import 'package:flutter/material.dart';

class BackButtonCB extends StatelessWidget {
  final IconData icon;
  const BackButtonCB({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(icon ?? Icons.arrow_back_ios_new_rounded),
    );
  }
}
