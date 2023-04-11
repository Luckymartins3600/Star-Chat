import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class PrivacyWidget extends StatelessWidget {
  const PrivacyWidget({
    Key key,
    @required this.index,
    @required this.isDark,
  }) : super(key: key);

  final int index;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size(context).width / 24),
      margin: EdgeInsets.only(top: size(context).width / 40),
      width: size(context).width,
      decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? Styles.subtitleTxt : const Color(0x18000000),
          ),
          borderRadius: BorderRadius.circular(size(context).width / 70)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            index == null
                ? 'Choose privacy'
                : index == 1
                    ? 'Public'
                    : 'Private',
            style: TextStyle(
                letterSpacing: 1,
                fontSize: size(context).width / 24,
                color: Colors.grey),
          ),
          const Icon(Icons.arrow_drop_down_rounded),
        ],
      ),
    );
  }
}
