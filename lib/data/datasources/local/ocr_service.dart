import 'dart:io';
import 'dart:math';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:blood_gas_app/core/utils/image_processor.dart';
import 'package:blood_gas_app/core/utils/text_parser.dart';

class OcrService {
  final ImageProcessor _imageProcessor;
  final TextParser _textParser;

  OcrService(this._imageProcessor, this._textParser);

  Future<Map<String, double>> processImage(String imagePath) async {
    print('[OCR] Starting processImage: $imagePath');
    
    // 1. Preprocess
    final processedPath = await _imageProcessor.processImage(imagePath);
    print('[OCR] Image preprocessed: $processedPath');

    final processedFile = File(processedPath);

    // 2. OCR
    final inputImage = InputImage.fromFilePath(processedPath);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    try {
      print('[OCR] Running ML Kit text recognition...');
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      // 3. Reconstruct rows using spatial positions
      final reconstructedText = _reconstructRows(recognizedText);
      
      print('[OCR] ========== RECONSTRUCTED TEXT ==========');
      for (final line in reconstructedText.split('\n')) {
        print('[OCR] $line');
      }
      print('[OCR] ========================================');

      // 4. Parse the reconstructed text
      final results = _textParser.parse(reconstructedText);

      print('[OCR] Parsed ${results.length} values:');
      results.forEach((k, v) => print('[OCR]   $k = $v'));

      return results;
    } catch (e, st) {
      print('[OCR] ERROR: $e');
      print('[OCR] Stack: $st');
      rethrow;
    } finally {
      await textRecognizer.close();

      try {
        await processedFile.delete();
      } catch (_) {}
    }
  }

  /// Reconstructs rows from ML Kit text elements using their bounding box
  /// Y-coordinates. This is critical for columnar layouts like blood gas reports
  /// where labels, values, units, and reference ranges are in separate columns.
  String _reconstructRows(RecognizedText recognizedText) {
    // Collect all text elements (the smallest recognized units) with positions
    final elements = <_PositionedText>[];

    for (final block in recognizedText.blocks) {
      for (final line in block.lines) {
        for (final element in line.elements) {
          final box = element.boundingBox;
          if (box != null) {
            elements.add(_PositionedText(
              text: element.text,
              centerY: (box.top + box.bottom) / 2,
              left: box.left.toDouble(),
              height: (box.bottom - box.top).toDouble(),
            ));
          }
        }
      }
    }

    if (elements.isEmpty) {
      // Fallback: use raw text if no bounding box data
      return recognizedText.text;
    }

    // Sort by Y position first
    elements.sort((a, b) => a.centerY.compareTo(b.centerY));

    // Group elements into rows based on Y-coordinate proximity
    // Elements within ~50% of average line height are considered same row
    final avgHeight = elements.map((e) => e.height).reduce((a, b) => a + b) / elements.length;
    final yThreshold = max(avgHeight * 0.6, 10.0);

    final rows = <List<_PositionedText>>[];
    List<_PositionedText> currentRow = [elements.first];

    for (int i = 1; i < elements.length; i++) {
      final el = elements[i];
      final rowCenterY = currentRow
          .map((e) => e.centerY)
          .reduce((a, b) => a + b) / currentRow.length;

      if ((el.centerY - rowCenterY).abs() <= yThreshold) {
        currentRow.add(el);
      } else {
        rows.add(currentRow);
        currentRow = [el];
      }
    }
    rows.add(currentRow);

    // Within each row, sort left-to-right and join
    final lines = <String>[];
    for (final row in rows) {
      row.sort((a, b) => a.left.compareTo(b.left));
      
      // Smart joining: add space between elements, 
      // but filter out reference range columns (rightmost ~30% of page)
      // We keep only the first 2-3 columns (label + value + maybe unit)
      if (row.length >= 3) {
        // Likely a multi-column row — find max x to determine page width
        final maxRight = row.map((e) => e.left).reduce(max);
        final minLeft = row.map((e) => e.left).reduce(min);
        final pageWidth = maxRight - minLeft;
        
        // Keep elements in the left ~65% of the row (label + value + unit)
        // Reference ranges are typically in the rightmost column
        final cutoff = minLeft + pageWidth * 0.65;
        final filtered = row.where((e) => e.left <= cutoff).toList();
        if (filtered.isNotEmpty) {
          lines.add(filtered.map((e) => e.text).join(' '));
        }
      } else {
        lines.add(row.map((e) => e.text).join(' '));
      }
    }

    return lines.join('\n');
  }
}

class _PositionedText {
  final String text;
  final double centerY;
  final double left;
  final double height;

  _PositionedText({
    required this.text,
    required this.centerY,
    required this.left,
    required this.height,
  });
}
