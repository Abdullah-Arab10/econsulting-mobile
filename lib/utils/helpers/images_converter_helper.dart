import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class ImageConverter {
  static Image imageFromBase64String(String base64String) {
    Uint8List binaryImage = dataFromBase64String(base64String);
    return Image.memory(binaryImage);
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
