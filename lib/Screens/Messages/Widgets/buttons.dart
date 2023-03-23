import 'package:flutter/material.dart';

import '../../../Styles/style.dart';
import '../../../Utils/const.dart';

Widget button(
    {Widget icon,
    EdgeInsets padding,
    void Function() onTap,
    @required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size(context).width / 70),
    child: GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Styles.kPrimaryColor,
        radius: size(context).width / 19,
        child: Center(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0.0),
            child: icon,
          ),
        ),
      ),
    ),
  );
}
