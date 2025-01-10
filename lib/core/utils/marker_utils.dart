import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerUtils {
  /// Converts [IconData] or a custom Flutter [Image] into a [BitmapDescriptor].
  static Future<BitmapDescriptor> createBitmapDescriptor({
    IconData? iconData,
    Color color = Colors.black,
    double size = 40.0, // Default canvas size
    ui.Image? image,
  }) async {
    // Ensure that at least one of the inputs is provided
    if (iconData == null && image == null) {
      throw ArgumentError('Either iconData or image must be provided.');
    }

    // Prepare a PictureRecorder and Canvas
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final canvasSize = size * 2; // Double the size for better resolution

    if (iconData != null) {
      // Render the IconData onto the Canvas
      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );

      final iconStr = String.fromCharCode(iconData.codePoint);

      textPainter.text = TextSpan(
        text: iconStr,
        style: TextStyle(
          fontSize: canvasSize / 2, // Adjust font size relative to canvas size
          fontFamily: iconData.fontFamily,
          color: color,
        ),
      );

      textPainter.layout();
      final xCenter = (canvasSize - textPainter.width) / 2;
      final yCenter = (canvasSize - textPainter.height) / 2;
      textPainter.paint(canvas, Offset(xCenter, yCenter));
    } else if (image != null) {
      // Draw the custom Flutter Image onto the Canvas
      final paint = Paint();
      final rect = Rect.fromLTWH(
        canvasSize * 0.1, // Slight margin from left
        canvasSize * 0.1, // Slight margin from top
        canvasSize * 0.8, // Scale image to 80% of the canvas size
        canvasSize * 0.8, // Scale image to 80% of the canvas size
      );

      // Scale and center the image
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        rect,
        paint,
      );
    }

    // Convert the Canvas to an Image
    final picture = pictureRecorder.endRecording();
    final imageResult =
        await picture.toImage(canvasSize.toInt(), canvasSize.toInt());
    final byteData =
        await imageResult.toByteData(format: ui.ImageByteFormat.png);

    // Create and return the BitmapDescriptor
    return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
  }

  /// Loads an image from assets as a [ui.Image].
  static Future<ui.Image> loadImageFromAssets(String path) async {
    final data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
