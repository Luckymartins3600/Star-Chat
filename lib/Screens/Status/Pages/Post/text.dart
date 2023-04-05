import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/align_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_palette.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/fonts_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/fontwieght_widget.dart';
import 'package:chat_app/Screens/Status/Widget/text/text_input.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class TextStatus extends StatefulWidget {
  final bool isDark;

  const TextStatus({Key key, @required this.isDark}) : super(key: key);

  @override
  State<TextStatus> createState() => _TextStatusState();
}

class _TextStatusState extends State<TextStatus> {
  TextEditingController msgController = TextEditingController();
  int bgindex = 1, alignIndex = 1, textColorindex = 1;
  bool isBold = false, isColor = true, isBgColor = false;
  Color textColor = const Color(0xDAFFFFFF);
  double fontSize = 21;
  String fontFamily = "OpenSans";
  TextStyle style;
  @override
  void initState() {
    bgindex == 1 ? bgindex = 3 : bgindex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: colors[bgindex],
          appBar: AppBar(
            foregroundColor: bgindex == 1 ? Colors.black : Colors.white,
            leading: const BackButtonCB(icon: Icons.close_rounded),
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsets.only(
                left: size(context).width / 8,
                right: size(context).width / 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextAlignWidget(
                    index: alignIndex,
                    onTap: () => toggleAlign(),
                  ),
                  ColorWidget(isColor: isColor, onTap: () => toggleColor()),
                  BoldWidget(isBold: isBold, onTap: () => toggleBold()),
                ],
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                fontStyle: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                  height: 1.2,
                  fontSize: fontSize,
                  color: textColor,
                  fontFamily: fontFamily,
                ),
                textAlign: align(),
                msgController: msgController,
                onChanged: (p0) => setState(() {}),
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: SizedBox(
            height: size(context).width / 10,
            child: ListView.builder(
              padding: EdgeInsets.only(
                right: size(context).width / 15,
              ),
              itemCount: isColor
                  ? isBgColor
                      ? bgcolors.length
                      : colors.length
                  : fonts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => isColor
                  ? GestureDetector(
                      onTap: () => setState(() => bgindex = index),
                      child:
                          ColorPalette(index: index, selindex: textColorindex))
                  : FontWidget(isSelected: false, font: fonts[index]),
            ),
          ),
        );
      },
    );
  }

  toggleColor() => setState(() => isColor = !isColor);
  toggleBold() => setState(() => isBold = !isBold);
  toggleAlign() =>
      setState(() => alignIndex == 2 ? alignIndex = 0 : alignIndex++);
  TextAlign align() {
    switch (alignIndex) {
      case 0:
        return TextAlign.left;
      case 1:
        return TextAlign.center;
      default:
        return TextAlign.end;
    }
  }
}






// import 'dart:math';

// import 'package:chat_app/Screens/Status/Pages/Post/prev.dart';
// import 'package:chat_app/Screens/Status/Widget/text/text_input.dart';
// import 'package:chat_app/Styles/string_color.dart';
// import 'package:chat_app/func/navigate.dart';
// import 'package:chat_app/widgets/back_button.dart';
// import 'package:chat_app/widgets/text_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// class TextStatus extends StatefulWidget {
//   final bool isDark;

//   const TextStatus({Key key, @required this.isDark}) : super(key: key);

//   @override
//   State<TextStatus> createState() => _TextStatusState();
// }

// class _TextStatusState extends State<TextStatus> {
//   TextEditingController msgController = TextEditingController();
//   int index = Random().nextInt(13);
//   changeColor() {
//     if (index < 13) {
//       setState(() => index++);
//     } else {
//       setState(() => index = 0);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: stringColor(index),
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         leading: const BackButtonCB(icon: Icons.close_rounded),
//         backgroundColor: Colors.transparent,
//         actions: [
//           if (msgController.text.trim().isNotEmpty)
//             TextButtonCB(
//               title: 'Done',
//               onPressed: () => msgController.text.trim().isNotEmpty
//                   ? Navigate.forward(
//                       context: context,
//                       screen: PreviewSc(
//                         isDark: widget.isDark,
//                         color: stringColor(index),
//                         msg: msgController.text.trim(),
//                       ),
//                     )
//                   : {},
//             )
//         ],
//       ),
//       body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
//         return TextInput(
//           msgController: msgController,
//           onChanged: (p0) => setState(() {}),
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: stringColor(index == 13 ? 0 : index + 1),
//         onPressed: () => changeColor(),
//         child: const Icon(
//           Icons.color_lens_rounded,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
