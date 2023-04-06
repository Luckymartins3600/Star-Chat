import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/align_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_palette.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/fonts_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/fontwieght_widget.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Text/prev.dart';
import 'package:chat_app/Screens/Status/Widget/text/text_input.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:chat_app/widgets/text_button.dart';
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
  int bgindex = 1, alignIndex = 1, fontIndex = 0;
  bool isBold = false, isColor = false, isBgColor = false;
  double fontSize = 20;
  String fontFamily = "OpenSans";
  TextStyle style;
  @override
  void initState() {
    bgindex == 1 ? bgindex = 3 : bgindex;
    super.initState();
  }

  onSubmit() {
    Navigate.forward(
      context: context,
      screen: PreviewSc(
        textAlign: align(),
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          height: 1.2,
          fontSize: fontSize,
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        isDark: widget.isDark,
        bgcolor: bgcolors[(bgindex)],
        msg: msgController.text.trim(),
      ),
    );
  }

  bool isEmpty() {
    if (msgController.text.trim().isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          backgroundColor: bgcolors[bgindex],
          appBar: AppBar(
            foregroundColor: Colors.white,
            leading: const BackButtonCB(icon: Icons.close_rounded),
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsets.only(
                left: size(context).width / 8,
                right: size(context).width / 17,
              ),
              child: Center(
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
            actions: [
              TextButtonCB(
                title: 'Done',
                disabled: isEmpty(),
                onPressed: () => onSubmit(),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        value: fontSize,
                        min: 20,
                        max: 40,
                        onChanged: (value) => setState(() => fontSize = value),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextInput(
                      fontStyle: TextStyle(
                        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                        height: 1.2,
                        fontSize: fontSize,
                        color: Colors.white,
                        fontFamily: fontFamily,
                      ),
                      textAlign: align(),
                      msgController: msgController,
                      onChanged: (p0) => setState(() {}),
                      onEditingComplete: () =>
                          !isEmpty() ? onSubmit() : Navigator.pop(context),
                    ),
                  ),
                ],
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
              itemCount: isColor ? bgcolors.length : fonts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => isColor
                  ? GestureDetector(
                      onTap: () => setState(() => bgindex = index),
                      child: ColorPalette(index: index, selindex: bgindex),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() => fontFamily = fonts[index]);
                        setState(() => fontIndex = index);
                      },
                      child: FontWidget(
                          isSelected: fontIndex == index, font: fonts[index],),
                    ),
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

