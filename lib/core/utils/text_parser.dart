/// Parses raw OCR text output into a map of blood gas parameter key-value pairs.
///
/// Design decisions:
/// - Labels are matched longest-first to avoid short-key false positives
///   (e.g., 'pCO2' is matched before 'p' or 'co2').
/// - Negative values are supported (e.g., BE = -2.5).
/// - OCR typo normalization is applied before parsing (O→0, l/I→1 in numeric context).
/// - Physiological range validation flags impossible values.
class TextParser {
  /// Known section headers and their field order in a standard ABG report.
  /// When labels are too garbled for exact matching, we fall back to
  /// detecting section headers and assigning values sequentially.
  static const _sectionFieldOrder = <String, List<String>>{
    'blood': ['pH', 'pCO2', 'pO2'],   // "Blood Gas Values"
    'oximetry': ['ctHb', 'hctc', 'sO2', 'fO2Hb', 'fCOHb', 'fHHb', 'fMetHb'],
    'electrolyte': ['cNa', 'cK', 'cCa', 'cCl'],
    'metabolite': ['cGlu', 'cLac', 'ctBil', 'mOsmc'],
    'temperature': ['phT', 'pCO2T', 'pO2T'],
    'oxygen': ['ctO2c', 'p50c'],
    'acid': ['cBaseB', 'cBaseEcf', 'cHCO3Pst', 'cHCO3P'],
  };

  /// Main entry point. Returns a map like {'pH': 7.35, 'pCO2': 38.0, ...}
  Map<String, double> parse(String rawText) {
    if (rawText.trim().isEmpty) return {};

    final normalizedText = _normalizeOcrText(rawText);
    final lines = normalizedText.split('\n');
    final Map<String, double> results = {};

    // ===================== PASS 1: Label-based exact matching =====================
    String? pendingKey;
    int skippedLinesAfterPending = 0;

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;

      // 1. Try to extract label+value pairs from this line
      final lineResults = _parseLineForPairs(trimmed);
      if (lineResults.isNotEmpty) {
        for (final entry in lineResults.entries) {
          final validated = _validateValue(entry.key, entry.value);
          if (validated != null) {
            results[entry.key] = validated;
          }
        }
        pendingKey = null;
        continue;
      }

      // 2. If we have a pending key, check if this line is just a value
      if (pendingKey != null) {
        final val = _extractNumericValue(trimmed);
        if (val != null) {
          final validated = _validateValue(pendingKey, val);
          if (validated != null) {
            results[pendingKey] = validated;
          }
          pendingKey = null;
          continue;
        }
      }

      // 3. Check if this line is just a label (no value on it)
      final possibleKey = _matchLabelOnly(trimmed);
      if (possibleKey != null) {
        pendingKey = possibleKey;
        skippedLinesAfterPending = 0;
      } else if (pendingKey != null) {
        skippedLinesAfterPending++;
        if (skippedLinesAfterPending > 2) {
          pendingKey = null;
        }
      }
    }

    // ===================== PASS 2: Section-based sequential fallback =====================
    // If pass 1 found very few results, try section-based approach
    if (results.length < 5) {
      final sectionResults = _parseBySections(lines);
      // Merge: only add values not already found
      for (final entry in sectionResults.entries) {
        results.putIfAbsent(entry.key, () => entry.value);
      }
    }

    return results;
  }

  /// Section-based sequential parser: detects section headers and assigns
  /// values to fields in their known order within each section.
  Map<String, double> _parseBySections(List<String> lines) {
    final results = <String, double>{};
    String? currentSectionKey;
    int fieldIndex = 0;

    for (final rawLine in lines) {
      final line = rawLine.trim().toLowerCase();
      if (line.isEmpty) continue;

      // Check if this line is a section header
      final sectionMatch = _detectSection(line);
      if (sectionMatch != null) {
        currentSectionKey = sectionMatch;
        fieldIndex = 0;
        continue;
      }

      // Skip lines that are clearly not data rows
      if (_isSectionHeaderNoise(line)) continue;

      if (currentSectionKey == null) continue;
      
      final sectionFields = _sectionFieldOrder[currentSectionKey];
      if (sectionFields == null || fieldIndex >= sectionFields.length) continue;

      // Extract any numeric value from this line (first number found)
      // For lines like "Hb 13.1 g/dL", "1 3lu 106 mg/dL"
      final value = _extractFirstValidNumber(rawLine.trim());
      if (value != null) {
        final fieldKey = sectionFields[fieldIndex];
        final validated = _validateValue(fieldKey, value);
        if (validated != null) {
          results[fieldKey] = validated;
        }
        fieldIndex++;
      }
    }

    return results;
  }

  /// Detects if a line is a section header and returns the section key
  String? _detectSection(String lowerLine) {
    // Remove noise characters
    final clean = lowerLine.replaceAll(RegExp(r'[^a-z\s]'), '').trim();
    
    if (clean.contains('blood') && (clean.contains('gas') || clean.contains('value'))) return 'blood';
    if (clean.contains('oximetry') || clean.contains('oximet')) return 'oximetry';
    if (clean.contains('electrolyte') || clean.contains('elektrolit')) return 'electrolyte';
    if (clean.contains('metabolite') || clean.contains('metabolit')) return 'metabolite';
    if (clean.contains('temperature') || clean.contains('corrected')) return 'temperature';
    if (clean.contains('oxygen') && clean.contains('stat')) return 'oxygen';
    if (clean.contains('acid') && clean.contains('base')) return 'acid';
    return null;
  }

  /// Returns true if the line is noise (reference ranges, units-only, brackets)
  bool _isSectionHeaderNoise(String lowerLine) {
    // Lines with only brackets, pipes, or very short noise
    if (RegExp(r'^[\[\]|I\s]+$').hasMatch(lowerLine)) return true;
    // Reference range lines like "7.350 - 7.450"
    if (RegExp(r'^\d+\.?\d*\s*-\s*\d+\.?\d*\s*[\[\]|1]*$').hasMatch(lowerLine.trim())) return true;
    // Unit-only lines like "mmol/l", "g/dl", "%"
    if (RegExp(r'^[rn]*m?[mc]?[oil/]+[lkg.%]*$', caseSensitive: false).hasMatch(lowerLine.trim())) return true;
    if (lowerLine.trim() == '%' || lowerLine.trim() == 'vol%') return true;
    return false;
  }

  /// Extracts the first plausible numeric value from a line,
  /// ignoring reference ranges (pairs of numbers separated by -)
  double? _extractFirstValidNumber(String line) {
    // Remove known label-like text and unit-like text
    // Split into tokens and find the first standalone number
    final tokens = line.split(RegExp(r'\s+'));
    
    for (final token in tokens) {
      final val = _tryParseNumber(token);
      if (val != null) return val;
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // OCR Text Normalization
  // ---------------------------------------------------------------------------

  /// Applies all normalization rules from the roadmap:
  /// - Replace commas with dots
  /// - Fix O→0 in numeric sequences
  /// - Fix l/I→1 in numeric sequences
  String _normalizeOcrText(String text) {
    // Step 1: Commas to dots globally
    var result = text.replaceAll(',', '.');

    // Step 2: Fix letter O (uppercase) between two digits → 0
    // Only replace when O is truly inside a numeric sequence (digit-O-digit)
    // This avoids corrupting labels like "HCO3" → "HC03"
    result = result.replaceAllMapped(
      RegExp(r'(\d)O(\d)'),
      (m) => '${m.group(1)}0${m.group(2)}',
    );

    // Step 3: Fix lowercase l or uppercase I between two digits → 1
    result = result.replaceAllMapped(
      RegExp(r'(\d)[lI](\d)'),
      (m) => '${m.group(1)}1${m.group(2)}',
    );

    return result;
  }

  // ---------------------------------------------------------------------------
  // Label Definitions (sorted longest first to prevent short-key collisions)
  // ---------------------------------------------------------------------------

  /// Each entry: OCR variant (lowercase) → canonical key name
  /// IMPORTANT: Sorted by key length descending so "pco2" matches before "p"
  static final List<MapEntry<String, String>> _sortedLabels = () {
    const labels = <String, String>{
      // Acid Base Status
      'cbase(ecf)c': 'cBaseEcf',
      'cbase(b)c': 'cBaseB',
      'chco3(p.st)': 'cHCO3Pst',
      'chco3-(p.st)': 'cHCO3Pst',
      'chco3-(p)c': 'cHCO3P',
      'act.bicarb': 'cHCO3P',
      'st.bicarb': 'cHCO3Pst',
      'cbaseecf': 'cBaseEcf',
      'be(ecf)': 'cBaseEcf',
      'be-ecf': 'cBaseEcf',
      'hco3std': 'cHCO3Pst',
      'hco3st': 'cHCO3Pst',
      'cbaseb': 'cBaseB',
      'be(b)': 'cBaseB',
      'chco3p': 'cHCO3P',
      'beecf': 'cBaseEcf',
      'hco3-': 'cHCO3P',
      'be-b': 'cBaseB',
      'hco3': 'cHCO3P',
      'beb': 'cBaseB',

      // --- Real OCR garbled variants (observed from emulator) ---
      // cBase(B)c often read as "G 3ase(B)c" or "G3ase(b)c"
      'g3ase(b)c': 'cBaseB',
      'gbase(b)c': 'cBaseB',
      'g3ase(ecf)c': 'cBaseEcf',
      // cHCO3(P)c often read as "G4CO,(P):" or "G4CO(P)"
      'g4co(p)': 'cHCO3P',
      'g4co,(p)': 'cHCO3P',
      // FMetHb often read as "EMettHb" or "EMetHb" 
      'emetthb': 'fMetHb',
      'emethb': 'fMetHb',
      // FO2Hb sometimes read as "FO0-b", "FO0b", "F02Hb"
      'fo0-b': 'fO2Hb',
      'fo0b': 'fO2Hb',
      'f02hb': 'fO2Hb',
      // FHHb sometimes read as "FHHD" or "FHHd"
      'fhhd': 'fHHb',
      // Hctc sometimes read as "Hcte" or "Hct"
      'hcte': 'hctc',
      // cGlu sometimes read as "1 3lu" or "cGIu" or "CGlu"
      'cgiu': 'cGlu',
      // cLac sometimes read as "1c.ac" or "cLae" or "CLac"
      'clae': 'cLac',
      // ctBil sometimes read as "cBIl" or "cBil"
      'cbil': 'ctBil',
      'ctbii': 'ctBil',
      // mOsmc sometimes read as "rnOsmc"
      'rnosmc': 'mOsmc',
      
      // Temperature Corrected
      'pco2(t)': 'pCO2T',
      'pco2t': 'pCO2T',
      'po2(t)': 'pO2T',
      'ph(t)': 'phT',
      'po2t': 'pO2T',
      'pht': 'phT',
      // OCR garbled: p(7) → pH(T)
      'p(7)': 'phT',

      // Oximetry Values
      'fmethb': 'fMetHb',
      'methb': 'fMetHb',
      'fo2hb': 'fO2Hb',
      'fcohb': 'fCOHb',
      'o2hb': 'fO2Hb',
      'cohb': 'fCOHb',
      'fhhb': 'fHHb',
      'cthb': 'ctHb',
      'hctc': 'hctc',
      'hhb': 'fHHb',
      'thb': 'ctHb',
      'sao2': 'sO2',
      'sa02': 'sO2',
      'hct': 'hctc',
      'so2': 'sO2',

      // Oxygen Status
      'cto2c': 'ctO2c',
      'cto2': 'ctO2c',
      'p50c': 'p50c',
      'p50': 'p50c',

      // Blood Gas Values
      'pco2': 'pCO2',
      'pc02': 'pCO2',
      'po2': 'pO2',
      'p02': 'pO2',
      'pdo': 'pO2',

      // Metabolite Values
      'mosmc': 'mOsmc',
      'ctbil': 'ctBil',
      'clac': 'cLac',
      'cglu': 'cGlu',
      'osm': 'mOsmc',
      'bil': 'ctBil',
      'lac': 'cLac',
      'glu': 'cGlu',

      // Electrolyte Values – with ionic notation stripped during matching
      'cna+': 'cNa',
      'cna': 'cNa',
      'ck+': 'cK',
      'cca2+': 'cCa',
      'cca': 'cCa',
      'ccl-': 'cCl',
      'ccl': 'cCl',
      'na+': 'cNa',
      'ca2+': 'cCa',
      'cl-': 'cCl',
      'na': 'cNa',
      'ca': 'cCa',
      'cl': 'cCl',
      'ck': 'cK',
      'k+': 'cK',
      'k': 'cK',

      // pH (must be after all pXXX entries)
      'ph': 'pH',

      // Base Excess standalone (after all be-xxx entries)
      'be': 'cBaseEcf',

      // Hemoglobin standalone
      'hb': 'ctHb',
    };

    final sorted = labels.entries.toList()
      ..sort((a, b) => b.key.length.compareTo(a.key.length));
    return sorted;
  }();

  // ---------------------------------------------------------------------------
  // Physiological Validation Ranges
  // ---------------------------------------------------------------------------

  static const _validationRanges = <String, (double, double)>{
    'pH': (6.5, 8.0),
    'pCO2': (5.0, 200.0),
    'pO2': (0.0, 700.0),
    'ctHb': (1.0, 30.0),
    'hctc': (5.0, 80.0),
    'sO2': (0.0, 100.0),
    'fO2Hb': (0.0, 100.0),
    'fCOHb': (0.0, 100.0),
    'fHHb': (0.0, 100.0),
    'fMetHb': (0.0, 100.0),
    'cNa': (80.0, 200.0),
    'cK': (1.0, 15.0),
    'cCa': (0.1, 5.0),
    'cCl': (50.0, 200.0),
    'cGlu': (0.0, 100.0),
    'cLac': (0.0, 30.0),
    'ctBil': (0.0, 500.0),
    'mOsmc': (100.0, 500.0),
    'phT': (6.5, 8.0),
    'pCO2T': (0.0, 40.0),
    'pO2T': (0.0, 100.0),
    'ctO2c': (0.0, 40.0),
    'p50c': (0.0, 10.0),
    'cBaseB': (-30.0, 30.0),
    'cBaseEcf': (-30.0, 30.0),
    'cHCO3Pst': (0.0, 60.0),
    'cHCO3P': (0.0, 60.0),
  };

  /// Returns value if within physiological bounds, null otherwise.
  double? _validateValue(String key, double value) {
    final range = _validationRanges[key];
    if (range == null) return value; // No range defined → accept
    if (value >= range.$1 && value <= range.$2) return value;
    // Out of range — skip silently (likely OCR noise)
    return null;
  }

  // ---------------------------------------------------------------------------
  // Line Parsing
  // ---------------------------------------------------------------------------

  /// Attempts to find one or more label+value pairs on a single line.
  Map<String, double> _parseLineForPairs(String line) {
    final results = <String, double>{};
    final lower = line.toLowerCase();

    // Remove common separators for cleaner matching
    final cleaned = lower
        .replaceAll(':', ' ')
        .replaceAll('=', ' ')
        .replaceAll('\t', ' ');

    // Split into tokens
    final tokens = cleaned.split(RegExp(r'\s+'));

    int i = 0;
    while (i < tokens.length) {
      final matchResult = _matchLabelAtPosition(tokens, i);
      if (matchResult != null) {
        final (canonicalKey, tokensConsumed) = matchResult;

        // Look ahead for a numeric value (up to 3 positions after the label)
        bool found = false;
        for (int offset = tokensConsumed;
            offset <= tokensConsumed + 2 && (i + offset) < tokens.length;
            offset++) {
          final valToken = tokens[i + offset];
          final val = _tryParseNumber(valToken);
          if (val != null) {
            results[canonicalKey] = val;
            i += offset + 1;
            found = true;
            break;
          }
          // Skip unit tokens like mmol/l, mmhg, kpa, etc.
          if (_isUnitToken(valToken)) continue;
        }

        if (!found) {
          // Label found but no value on this line → it might be on next line
          i += tokensConsumed;
        }
      } else {
        i++;
      }
    }

    return results;
  }

  /// Try to match a known label starting at token position [startIdx].
  /// Returns (canonicalKey, numberOfTokensConsumed) or null.
  (String, int)? _matchLabelAtPosition(List<String> tokens, int startIdx) {
    // Try matching multi-token labels first (e.g., "be (ecf)")
    // Then single-token labels
    for (final entry in _sortedLabels) {
      final labelTokens = entry.key.split(RegExp(r'\s+'));
      if (startIdx + labelTokens.length > tokens.length) continue;

      bool matches = true;
      for (int j = 0; j < labelTokens.length; j++) {
        final tokenClean = tokens[startIdx + j].replaceAll(RegExp(r'[^a-z0-9+\-().]+'), '');
        if (tokenClean != labelTokens[j]) {
          matches = false;
          break;
        }
      }

      if (matches) {
        return (entry.value, labelTokens.length);
      }
    }

    // Fallback: try to match the token content against labels
    // (handles cases where OCR joined characters differently)
    final token = tokens[startIdx].replaceAll(RegExp(r'[^a-z0-9+\-().]+'), '');
    for (final entry in _sortedLabels) {
      // Only match if the token IS the label (not just contains it)
      if (token == entry.key) {
        return (entry.value, 1);
      }
    }

    return null;
  }

  /// Checks if a line contains only a label with no numeric value.
  String? _matchLabelOnly(String line) {
    final lower = line.toLowerCase().replaceAll(':', ' ').replaceAll('=', ' ').trim();
    final tokens = lower.split(RegExp(r'\s+'));

    for (int i = 0; i < tokens.length; i++) {
      final matchResult = _matchLabelAtPosition(tokens, i);
      if (matchResult != null) {
        final (canonicalKey, tokensConsumed) = matchResult;
        // Check if there are any non-label tokens that are numeric
        bool hasStandaloneNumber = false;
        for (int j = 0; j < tokens.length; j++) {
          // Skip tokens that are part of the matched label
          if (j >= i && j < i + tokensConsumed) continue;
          if (_tryParseNumber(tokens[j]) != null) {
            hasStandaloneNumber = true;
            break;
          }
        }
        if (!hasStandaloneNumber) {
          return canonicalKey;
        }
      }
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Number Parsing
  // ---------------------------------------------------------------------------

  /// Parses a token as a number, supporting negative values and cleaning noise.
  double? _tryParseNumber(String token) {
    // Clean non-numeric characters except digits, dots, minus
    final cleaned = token.replaceAll(RegExp(r'[^0-9.\-]'), '');
    if (cleaned.isEmpty) return null;

    // Match a number pattern: optional minus, digits, optional decimal
    final match = RegExp(r'^-?\d+(?:\.\d+)?$').firstMatch(cleaned);
    if (match != null) {
      return double.tryParse(match.group(0)!);
    }
    return null;
  }

  /// Extracts the first numeric value from a text string.
  double? _extractNumericValue(String text) {
    final cleaned = text.replaceAll(RegExp(r'[^0-9.\-\s]'), '');
    final match = RegExp(r'-?\d+(?:\.\d+)?').firstMatch(cleaned);
    if (match != null) {
      return double.tryParse(match.group(0)!);
    }
    return null;
  }

  /// Returns true if the token looks like a unit (mmol/l, mmhg, kpa, %, g/dl, etc.)
  bool _isUnitToken(String token) {
    const units = [
      'mmol/l', 'mmol', 'mmhg', 'kpa', 'g/dl', 'vol%',
      'mmol/kg', '%', 'mg/dl', 'meq/l',
    ];
    final lower = token.toLowerCase();
    return units.any((u) => lower.contains(u));
  }
}
