import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  /// Copy an asset Image to the documents directory
  static Future<String> pathToBitMapPath(String assetFile) async {
    // Copy the sound asset to the documents directory
    final byteData = await rootBundle.load(assetFile);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${assetFile.split('/').last}';
    final file = File(filePath);
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return filePath;
  }
}
