import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class PrimayBtn extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const PrimayBtn({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size(context).width / 20,
          vertical: size(context).width / 45,
        ),
        margin: EdgeInsets.symmetric(
          vertical: size(context).width / 40,
        ),
        decoration: BoxDecoration(
          color: Styles.kPrimaryColor,
          borderRadius: BorderRadius.circular(size(context).width / 70),
        ),
        child: Text(
          text ?? 'Accept',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
