import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class TextButtonCB extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool disabled;
  const TextButtonCB({
    Key key,
    @required this.title,
    this.disabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          right: size(context).width / 20,
          top: size(context).width / 20,
        ),
        child: Text(
          title,
          style: disabled ? const TextStyle(color: Colors.transparent) : null,
        ),
      ),
    );
  }
}
