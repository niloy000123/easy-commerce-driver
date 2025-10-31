import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

Future<List<dynamic>?> pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    var image = await _file.readAsBytes();
    return [image, _file];
  }
  debugPrint("No Image Selected");
}

Future<File?> compressImage(File file) async {
  try {
    // Read the image as bytes
    Uint8List imageBytes = await file.readAsBytes();

    // Decode the image using the 'image' package
    img.Image? image = img.decodeImage(imageBytes);

    if (image == null) return file;

    int quality = 100;
    File compressedFile = file;
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    debugPrint('photo size $sizeInMb');

    // Compress the image until its size is less than 2 MB
    while (sizeInMb > 1 && quality > 0) {
      quality -= 20;

      // Encode the image as a JPEG with reduced quality
      Uint8List compressedBytes =
          Uint8List.fromList(img.encodeJpg(image, quality: quality));

      // Save the compressed image back to a file
      compressedFile = await File(file.path).writeAsBytes(compressedBytes);

      // Recalculate the file size
      sizeInBytes = compressedFile.lengthSync();
      sizeInMb = sizeInBytes / (1024 * 1024);
    }
    print('photo re size $sizeInMb');

    return compressedFile;
  } catch (e) {
    print('--error-- $e');
    return null;
  }
}
