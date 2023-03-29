import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor, fgColor;
  final void Function() onTap;
  final double iconSize;
  const ActionButton({
    Key key,
    @required this.icon,
    this.bgColor,
    this.fgColor,
    this.onTap,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: bgColor ?? Colors.pink,
          child: AnimatedContainer(
            duration: const Duration(seconds: 7),
            child: Icon(
              icon,
              size: iconSize,
              color: fgColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CloseBtn extends StatelessWidget {
  const CloseBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: size(context).width / 10),
        child: IconButton(
          padding: EdgeInsets.zero,
          color: Colors.white,
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
