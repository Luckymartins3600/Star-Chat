import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

PreferredSize appBarUnderLine(
    {BuildContext context, bool isDark, Color color}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(4.0),
    child: Container(
      color: color ?? (isDark ? Colors.grey.shade900 : Colors.grey.shade300),
      height: size(context).width / 700,
      width: size(context).width,
    ),
  );
}
