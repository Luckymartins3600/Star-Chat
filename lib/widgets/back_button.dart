import 'package:flutter/material.dart';

class BackButtonCB extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  const BackButtonCB({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Icon(icon ?? Icons.arrow_back_ios_new_rounded),
    );
  }
}
