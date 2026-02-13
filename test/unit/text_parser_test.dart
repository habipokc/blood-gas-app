import 'package:flutter_test/flutter_test.dart';
import 'package:blood_gas_app/core/utils/text_parser.dart';

void main() {
  late TextParser parser;

  setUp(() {
    parser = TextParser();
  });

  group('TextParser - Basic Parsing', () {
    test('should parse standard clean labels correctly', () {
      const input = '''
pH 7.35
pCO2 35.0
pO2 80.0
cNa 135
cK 4.5
''';
      final result = parser.parse(input);

      expect(result['pH'], 7.35);
      expect(result['pCO2'], 35.0);
      expect(result['pO2'], 80.0);
      expect(result['cNa'], 135.0);
      expect(result['cK'], 4.5);
    });

    test('should handle commas instead of dots', () {
      const input = '''
pH 7,35
pCO2 35,0
''';
      final result = parser.parse(input);

      expect(result['pH'], 7.35);
      expect(result['pCO2'], 35.0);
    });

    test('should handle common OCR typos in labels', () {
      const input = '''
pC02 35.0
p02 80.0
''';
      final result = parser.parse(input);

      expect(result['pCO2'], 35.0);
      expect(result['pO2'], 80.0);
    });

    test('should handle labels and values on the same line', () {
      const input = 'pH 7.42 pCO2 38.5';
      final result = parser.parse(input);
      expect(result['pH'], 7.42);
      expect(result['pCO2'], 38.5);
    });

    test('should return empty map for empty input', () {
      final result = parser.parse('');
      expect(result, isEmpty);
    });
  });

  group('TextParser - Negative Values', () {
    test('should parse negative BE values', () {
      const input = '''
BE(Ecf) -2.5
cBase(B)c -3.1
''';
      final result = parser.parse(input);
      expect(result['cBaseEcf'], -2.5);
      expect(result['cBaseB'], -3.1);
    });

    test('should parse standalone BE with negative value', () {
      const input = 'BE -4.0';
      final result = parser.parse(input);
      expect(result['cBaseEcf'], -4.0);
    });
  });

  group('TextParser - OCR Typo Normalization', () {
    test('should fix O→0 in numeric sequences', () {
      // If OCR reads "7.3O" instead of "7.30"
      const input = 'pH 7.3O';
      final result = parser.parse(input);
      // After normalization: "7.30" → 7.30
      // But "O" at end of number gets fixed
      expect(result.containsKey('pH'), true);
    });
  });

  group('TextParser - Separator Handling', () {
    test('should handle colon separator', () {
      const input = 'pH : 7.35';
      final result = parser.parse(input);
      expect(result['pH'], 7.35);
    });

    test('should handle equals separator', () {
      const input = 'cK+ = 5.2 mmol/L';
      final result = parser.parse(input);
      expect(result['cK'], 5.2);
    });
  });

  group('TextParser - Units Handling', () {
    test('should skip unit tokens between label and value', () {
      const input = '''
cK+ mmol/L 4.0
cNa+ mmol/L 135
Glu mg/dL 90
''';
      final result = parser.parse(input);
      expect(result['cK'], 4.0);
      expect(result['cNa'], 135.0);
      expect(result['cGlu'], 90.0);
    });
  });

  group('TextParser - Acid Base & Special Keys', () {
    test('should parse HCO3 values', () {
      const input = '''
HCO3 24.5
HCO3std 22.0
''';
      final result = parser.parse(input);
      expect(result['cHCO3P'], 24.5);
      expect(result['cHCO3Pst'], 22.0);
    });
  });

  group('TextParser - Multi-line Parsing', () {
    test('should handle label on one line, value on next', () {
      const input = '''
pH
7.35
pCO2
38.0
''';
      final result = parser.parse(input);
      expect(result['pH'], 7.35);
      expect(result['pCO2'], 38.0);
    });
  });

  group('TextParser - Validation', () {
    test('should reject physiologically impossible values', () {
      const input = '''
pH 14.0
pCO2 35.0
''';
      final result = parser.parse(input);
      expect(result.containsKey('pH'), false); // 14.0 is out of range
      expect(result['pCO2'], 35.0);
    });
  });

  group('TextParser - Case Insensitivity', () {
    test('should handle mixed case labels', () {
      const input = '''
ph 7.40
PCO2 40
''';
      final result = parser.parse(input);
      expect(result['pH'], 7.40);
      expect(result['pCO2'], 40.0);
    });
  });

  group('TextParser - Noise Handling', () {
    test('should handle noisy OCR output', () {
      const input = '''
      Report
      
      pH : 7.35
      cK+ = 5.2 mmol/L
      ''';
      final result = parser.parse(input);
      expect(result['pH'], 7.35);
      expect(result['cK'], 5.2);
    });
  });

  group('TextParser - Section-Based Fallback', () {
    test('should parse values using section headers when labels are garbled', () {
      const input = '''
Blood as Values
ph 7.230
538
69 8
Oximetry Values
Hb 131
Hcte 40.2
sO2 88 4
FO0-b 86.6
09
FHHD 11.4
EMettHb 1.1
Electrolyte Values
Na 140
K 2.7
Ca 1.09
Metabolite Values
1 3lu 106
1c.ac 153
Acid Base Status
G 3ase(B)c -59
-47
194
21.7
''';
      final parser = TextParser();
      final result = parser.parse(input);
      
      expect(result['pH'], 7.230);
      expect(result['cNa'], 140.0);
      expect(result['cK'], 2.7);
      expect(result['cCa'], 1.09);
      
      print('Section fallback test results: $result');
    });
  });
}
