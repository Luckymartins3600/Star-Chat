import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    Key key,
    @required this.isColor,
    this.onTap,
  }) : super(key: key);
  final bool isColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: !isColor
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                border: Border.all(color: Colors.white, width: 1.5),
                gradient: const SweepGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.red,
                    Colors.blue,
                  ],
                  stops: [0.0, 0.25, 0.5, 0.75, 1],
                ),
              ),
            )
          : Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Center(
                child: Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
