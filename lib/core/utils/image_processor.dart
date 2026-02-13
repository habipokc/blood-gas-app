import 'dart:io';
import 'package:image/image.dart' as img;

class ImageProcessor {
  /// Fixes orientation, converts to grayscale, and increases contrast.
  /// Returns the path to the processed image.
  Future<String> processImage(String imagePath) async {
    final imageBytes = await File(imagePath).readAsBytes();
    img.Image? originalImage = img.decodeImage(imageBytes);

    if (originalImage == null) {
      throw Exception('Could not decode image at $imagePath');
    }

    // 1. Fix orientation (EXIF data — crucial for Android cameras)
    originalImage = img.bakeOrientation(originalImage);

    // 2. Convert to grayscale
    var processed = img.grayscale(originalImage);

    // 3. Increase contrast for thermal paper readability
    // adjustColor with contrast factor > 1.0 boosts contrast
    processed = img.adjustColor(processed, contrast: 1.5);

    // 4. Optional: Normalize brightness to handle faded thermal prints
    processed = img.normalize(processed, min: 0, max: 255);

    // Save to temp file
    final processedPath = '${imagePath}_processed.jpg';
    await File(processedPath).writeAsBytes(img.encodeJpg(processed, quality: 95));

    return processedPath;
  }
}
