import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class OutlinedTxtField extends StatelessWidget {
  final bool darkMode, isUsername, disabled, underlined;
  final String label, hintext;
  final int maxLength, maxline;
  final Function(String) onChanged;
  final TextEditingController controller;
  final EdgeInsetsGeometry margin;
  final FocusNode focusNode;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final Widget suffixIcon;
  final TextStyle style;
  const OutlinedTxtField({
    Key key,
    @required this.darkMode,
    this.isUsername,
    this.label,
    this.disabled = false,
    this.controller,
    this.maxLength,
    this.onChanged,
    this.margin,
    this.maxline,
    this.hintext,
    this.focusNode,
    this.borderRadius,
    this.contentPadding,
    this.underlined = false,
    this.suffixIcon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ?? EdgeInsets.symmetric(vertical: size(context).width / 35),
      child: TextField(
        style: style,
        readOnly: disabled,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: maxline ?? 1,
        minLines: 1,
        controller: controller,
        onChanged: onChanged,
        keyboardType: isUsername == true
            ? TextInputType.emailAddress
            : TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintext,
          counterText: '',
          enabled: true,
          labelText: label,
          contentPadding: contentPadding,
          labelStyle: TextStyle(
            color: darkMode ? Styles.subtitleTxt : Styles.black38,
            letterSpacing: 1,
          ),
          border: border(underlined),
          enabledBorder: border(underlined),
        ),
      ),
    );
  }

  InputBorder border(bool underline) {
    if (underline) {
      return UnderlineInputBorder(
        borderSide: BorderSide(
          color: darkMode ? Styles.subtitleTxt : const Color(0x18000000),
        ),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        borderSide: BorderSide(
          color: darkMode ? Styles.subtitleTxt : const Color(0x18000000),
        ),
      );
    }
  }
}
