import 'package:chat_app/Styles/style.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<CroppedFile> cropImage(String path) async {
  CroppedFile cropedFile =
      await ImageCropper.platform.cropImage(sourcePath: path, uiSettings: [
    AndroidUiSettings(
      toolbarTitle: 'Cropper',
      lockAspectRatio: false,
      toolbarColor: Styles.kPrimaryColor,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original,
    ),
    IOSUiSettings(title: 'Cropper'),
  ]);
  return cropedFile;
}