import 'package:flutter/material.dart';
import '../../../Model/current_user.dart';

IconButton navcIconCard(
    {@required IconData iconData,
    IconData selectedIcon,
    @required Size size,
    @required bool isSelected,
    void Function() onPressed,
    CurrentUserModel value,
    Color color}) {
  return IconButton(
    isSelected: isSelected,
    splashColor: Colors.transparent,
    splashRadius: 1,
    icon: Icon(
      isSelected == false ? iconData : selectedIcon,
      size: size.width / 15,
      color: color,
    ),
    onPressed: onPressed,
    tooltip: '',
  );
}
