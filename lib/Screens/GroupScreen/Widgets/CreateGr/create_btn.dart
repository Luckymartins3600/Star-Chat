import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateBtn extends StatelessWidget {
  final bool disabled, isDark;
  final void Function() onPressed;
  const CreateBtn({
    Key key,
   @required this.disabled,
    @required this.isDark,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: size(context).width / 33),
        child: CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: size(context).width / 3.5),
          color: Styles.kPrimaryColor,
          onPressed: onPressed,
          disabledColor:
              isDark ? const Color(0xA6202020) : const Color(0x2D747480),
          child: Text(
            'Create group',
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
    );
  }
}
