import 'package:chat_app/Styles/style.dart';
import 'package:flutter/material.dart';

class FontWidget extends StatelessWidget {
  final bool isSelected;
  final String font;

  const FontWidget({Key key, this.isSelected, this.font}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isSelected ? Colors.white : Colors.black45,
      ),
      child: Center(
        child: Text(
          'Aa',
          style: TextStyle(
            color: isSelected ? Styles.kPrimaryColor : Colors.white,
            fontFamily: font,
          ),
        ),
      ),
    );
  }
}
