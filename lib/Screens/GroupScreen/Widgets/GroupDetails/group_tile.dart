import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class ToggleTile extends StatelessWidget {
  final bool selected, isDark;
  final int index;
  final void Function() onTap;
  const ToggleTile({
    Key key,
    @required this.selected,
    @required this.index,
    @required this.isDark,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size(context).width / 2.7,
        margin: EdgeInsets.all(size(context).width / 30),
        padding: EdgeInsets.symmetric(vertical: size(context).width / 30),
        decoration: BoxDecoration(
          border:
              Border.all(color: selected ? Colors.transparent : Colors.grey),
          color: selected ? Styles.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(size(context).width),
        ),
        child: Center(
          child: Text(
            index == 1 ? 'Members' : 'Files',
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : isDark
                      ? Colors.white70
                      : Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
