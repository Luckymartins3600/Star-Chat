import 'package:flutter/material.dart';

class TextAlignWidget extends StatelessWidget {
  const TextAlignWidget({Key key, this.index, this.onTap})
      : super(key: key);
  final int index;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Widget icon() {
      switch (index) {
        case 0:
          return const Icon(Icons.format_align_left, color: Colors.white);
        case 1:
          return const Icon(Icons.format_align_center, color: Colors.white);
        default:
          return const Icon(Icons.format_align_right, color: Colors.white);
      }
    }

    return GestureDetector(onTap: onTap, child: icon());
  }
}
