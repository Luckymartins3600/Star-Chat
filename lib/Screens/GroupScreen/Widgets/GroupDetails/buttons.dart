import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/group_tile.dart';
import 'package:flutter/material.dart';

class TileButtons extends StatelessWidget {
  final bool isDark;
  final int currentIndex;
  final void Function() first;
  final void Function() second;
  const TileButtons({
    Key key,
    this.currentIndex,
    this.isDark,
    this.first,
    this.second,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ToggleTile(
          onTap: first,
          selected: currentIndex == 1,
          index: 1,
          isDark: isDark,
        ),
        ToggleTile(
          onTap: second,
          selected: currentIndex == 2,
          index: 2,
          isDark: isDark,
        ),
      ],
    );
  }
}
