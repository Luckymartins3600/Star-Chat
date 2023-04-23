import 'dart:io';

import 'package:chat_app/Screens/Status/Widget/dialog_title.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/crop_image.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

imagePicker({
  @required BuildContext context,
  @required GlobalKey<ScaffoldState> key,
  @required bool isDark,
  void Function() cam,
  void Function() gal,
}) {
  key.currentState.showBottomSheet(
    (context) {
      return StatefulBuilder(builder: (context, setData) {
        return SizedBox(
          height: size(context).width / (Platform.isAndroid ? 1.7 : 1.8),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: size(context).width / 30,
                  left: size(context).width / 20,
                ),
                title: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Options',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size(context).width / 20,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size(context).width / 20),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: BackButtonCB(icon: Icons.close_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              DiscardTile(
                isDark: isDark,
                title: 'Camera',
                leadingIcon: Icons.camera_alt,
                onTap: cam,
              ),
              DiscardTile(
                isDark: isDark,
                title: 'Gallery',
                leadingIcon: Icons.photo_library_rounded,
                onTap: gal,
              ),
            ],
          ),
        );
      });
    },
    backgroundColor: isDark ? Colors.white : const Color(0xD6F7F4F4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size(context).width / 16),
        topRight: Radius.circular(size(context).width / 16),
      ),
    ),
  );
}

Future<CroppedFile> pickImage(int index, BuildContext context) async {
  Navigator.pop(context);
  XFile file;
  final ImagePicker picker = ImagePicker();
  file = await picker.pickImage(
    source: index == 1 ? ImageSource.camera : ImageSource.gallery,
    imageQuality: 100,
  );
  if (file != null) {
    return cropImage(file.path);
  }
  return null;
}


