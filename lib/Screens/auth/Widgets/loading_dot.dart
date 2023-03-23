
import 'package:flutter/material.dart';

import '../../../Styles/style.dart';
import '../../../Utils/const.dart';

Widget dotDesign(bool selected, BuildContext context) {
  return AnimatedContainer(
    transformAlignment: Alignment.centerRight,
    width:
        selected == true ? size(context).width / 20 : size(context).width / 40,
    height:
        selected == true ? size(context).width / 40 : size(context).width / 40,
    margin: EdgeInsets.all(size(context).width / 80),
    decoration: BoxDecoration(
        color:
            selected == true ? Styles.kPrimaryColor : const Color(0x7BB0D6FF),
        borderRadius: BorderRadius.circular(size(context).width)),
    duration: const Duration(milliseconds: 600),
    curve: Curves.fastOutSlowIn,
  );
}
