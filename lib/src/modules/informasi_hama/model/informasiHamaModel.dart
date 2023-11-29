import 'dart:typed_data';

class ImageModel {
  Uint8List? data;
  String name;

  ImageModel({
    this.data,
    required this.name,
  });
}
