import 'package:flutter/material.dart';

import '../../../Styles/style.dart';
import '../../../Utils/const.dart';

class SearchWidget extends StatelessWidget {
  final bool isDarkMode;
  final EdgeInsetsGeometry padding;
  const SearchWidget({Key key, this.isDarkMode, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: size(context).width / 20, bottom: size(context).width / 30),
      width: size(context).width / 1.24,
      // padding: padding ?? EdgeInsets.all(size(context).width / 600),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFFE6E6E6).withOpacity(0.1)
            : const Color(0xFFE6E6E6).withOpacity(0.6),
        borderRadius: BorderRadius.circular(size(context).width),
      ),
      child: Center(
          child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size(context).width / 20,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: isDarkMode ? Styles.subtitleTxt : Styles.black38,
          ),
        ),
      )),
    );
  }
}
