import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

import '../../../Styles/style.dart';
import '../../../Utils/const.dart';

BottomSheetAction bottomTIle({
  @required BuildContext context,
  @required String title,
  @required IconData trailingIcon,
}) {
  return BottomSheetAction(
    title: Padding(
      padding: EdgeInsets.only(left: size(context).width / 50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
    leading: Icon(
      trailingIcon,
      color: Styles.kPrimaryColor,
      size: size(context).width / 14,
    ),
    onPressed: (context) {},
  );
}
