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

      file = await compress(
        image: file,
      );

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

      file = await compress(
        image: file,
      );

      return file;
    } else {
      return File("assets/images/logo.png");
    }
  }

  Future<File> compress({
    required File image,
  }) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(image.path);
    final path = await FlutterNativeImage.compressImage(image.path,
        quality: 80,
        targetWidth: 600,
        targetHeight: (properties.height! * 600 / properties.width!).round());

    return path;
  }
}
