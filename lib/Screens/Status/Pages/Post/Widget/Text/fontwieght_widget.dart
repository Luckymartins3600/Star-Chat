import 'package:flutter/material.dart';

class BoldWidget extends StatelessWidget {
  const BoldWidget({
    Key key,
    @required this.isBold,
    this.onTap,
  }) : super(key: key);

  final bool isBold;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: !isBold ? null : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.format_bold,
          size: 20,
          color: !isBold ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
