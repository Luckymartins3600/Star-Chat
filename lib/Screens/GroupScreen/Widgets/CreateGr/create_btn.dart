import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateBtn extends StatelessWidget {
  final bool disabled, isDark;
  final void Function() onPressed;
  final String text;
  final EdgeInsetsGeometry padding;
  const CreateBtn({
    Key key,
    @required this.disabled,
    @required this.isDark,
    this.onPressed,
    this.text,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: size(context).width / 33),
          child: CupertinoButton.filled(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: size(context).width / 3.5),
            onPressed: onPressed,
            disabledColor:
                isDark ? const Color(0xA6202020) : const Color(0x2D747480),
            child: Text(
              text ?? 'Create group',
              style: TextStyle(
                color: disabled
                    ? isDark
                        ? Colors.white30
                        : Colors.black38
                    : Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
