import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class OutlinedBtn extends StatelessWidget {
  final bool isDark;
  final String text;
  final void Function() onTap;
  const OutlinedBtn({
    Key key,
    @required this.isDark,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size(context).width / 17,
          vertical: size(context).width / 45,
        ),
        margin: EdgeInsets.all(size(context).width / 40),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(size(context).width / 70),
          boxShadow: const [
            BoxShadow(
              color: Color(0x93B0B0B0),
              spreadRadius: .8,
              blurRadius: .5,
            )
          ],
        ),
        child: Text(
          text ?? 'Deny',
          style:
              TextStyle(color: isDark ? Colors.white : const Color(0xFF4A4A4A)),
        ),
      ),
    );
  }
}
