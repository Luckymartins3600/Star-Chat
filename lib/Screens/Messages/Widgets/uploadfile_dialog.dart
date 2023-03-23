import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../../../Styles/style.dart';
import '../../../Utils/const.dart';
import 'bottomsheet_tile.dart';

uploadDialog(bool darkMode, BuildContext context) {
  showAdaptiveActionSheet(
    context: context,
    androidBorderRadius: size(context).width / 40,
    actions: <BottomSheetAction>[
      bottomTIle(
        title: 'Camera',
        trailingIcon: OMIcons.cameraAlt,
        context: context,
      ),
      bottomTIle(
        title: 'Gallery',
        trailingIcon: OMIcons.photo,
        context: context,
      ),
      // bottomTIle(
      //   title: 'Photos',
      //   trailingIcon: OMIcons.photo,
      //   context: context,
      // ),
      bottomTIle(
        title: 'Documents',
        trailingIcon: Icons.insert_drive_file_outlined,
        context: context,
      ),
      bottomTIle(
        title: 'Location',
        trailingIcon: OMIcons.locationOn,
        context: context,
      ),
    ],
    cancelAction: CancelAction(
      title: Text(
        'Cancel',
        style: TextStyle(
          color: Styles.kPrimaryColor,
          fontSize: size(context).width / 21,
        ),
      ),
    ),
  );
}
