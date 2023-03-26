import 'package:flutter/material.dart';

class BackButtonCB extends StatelessWidget {
  const BackButtonCB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
