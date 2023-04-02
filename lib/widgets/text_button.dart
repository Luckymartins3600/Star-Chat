import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class TextButtonCB extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const TextButtonCB({
    Key key,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size(context).width / 40),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.black54),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
