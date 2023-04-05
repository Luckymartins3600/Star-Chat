import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key key,
    @required this.index,
    @required this.selindex,
  }) : super(key: key);

  final int index, selindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size(context).width / 11,
      width: size(context).width / 11,
      margin: EdgeInsets.only(right: size(context).width / 70),
      decoration: BoxDecoration(
        color: bgcolors[index],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: index == selindex
          ? const Icon(Icons.check_rounded, color: Colors.white)
          : const SizedBox(),
    );
  }
}

// List<Color> colors = [
//   Colors.black,
//   Colors.white,
//   Color(int.parse('0xffEA2027')),
//   Color(int.parse('0xff006266')),
//   Color(int.parse('0xff1B1464')),
//   Color(int.parse('0xff5758BB')),
//   Color(int.parse('0xff6F1E51')),
//   Color(int.parse('0xffB53471')),
//   Color(int.parse('0xffEE5A24')),
//   Color(int.parse('0xff009432')),
//   Color(int.parse('0xff0652DD')),
//   Color(int.parse('0xff9980FA')),
//   Color(int.parse('0xff833471')),
//   Color(int.parse('0xff112CBC4')),
//   Color(int.parse('0xffFDA7DF')),
//   Color(int.parse('0xffED4C67')),
//   Color(int.parse('0xffF79F1F')),
//   Color(int.parse('0xffA3CB38')),
//   Color(int.parse('0xff1289A7')),
//   Color(int.parse('0xffD980FA'))
// ];
List<Color> bgcolors = [
  Colors.black,
  Color(int.parse('0xffEA2027')),
  Color(int.parse('0xff006266')),
  Color(int.parse('0xff1B1464')),
  Color(int.parse('0xff5758BB')),
  Color(int.parse('0xff6F1E51')),
  Color(int.parse('0xffB53471')),
  Color(int.parse('0xffEE5A24')),
  Color(int.parse('0xff009432')),
  Color(int.parse('0xff0652DD')),
  Color(int.parse('0xff9980FA')),
  Color(int.parse('0xff833471')),
  Color(int.parse('0xff112CBC4')),
  Color(int.parse('0xffFDA7DF')),
  Color(int.parse('0xffED4C67')),
  Color(int.parse('0xffF79F1F')),
  Color(int.parse('0xffA3CB38')),
  Color(int.parse('0xff1289A7')),
  Color(int.parse('0xffD980FA'))
];
