import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

mixin ImageMixin {
  final imagePicker = ImagePicker();
  bool isNoPhoto = true;

  Future<File> getGalleryImage() async {
    var result = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (result != null) {
      File file = File(result.path);

      isNoPhoto = false;

      file = await compress(image: file, quality: 400, percentage: 90);

      return file;
    } else {
      return File("assets/images/logo.png");
    }
  }

  Future<File> getCameraImage() async {
    var result = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (result != null) {
      File file = File(result.path);

      file = await compress(image: file, quality: 400, percentage: 90);

      return file;
    } else {
      return File("assets/images/logo.png");
    }
  }

  Future<File> compress({
    required File image,
    int quality = 100,
    int percentage = 70,
  }) async {
    final path = await FlutterNativeImage.compressImage(
      image.absolute.path,
      quality: quality,
      percentage: percentage,
    );

    return path;
  }
}
