import 'dart:math';

import 'package:chat_app/Screens/Status/Pages/Post/prev.dart';
import 'package:chat_app/Screens/Status/Widget/text/text_input.dart';
import 'package:chat_app/Styles/string_color.dart';
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
  int index = Random().nextInt(13);
  changeColor() {
    if (index < 13) {
      setState(() => index++);
    } else {
      setState(() => index = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: stringColor(index),
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: const BackButtonCB(icon: Icons.close_rounded),
        backgroundColor: Colors.transparent,
        actions: [
          if (msgController.text.trim().isNotEmpty)
            TextButtonCB(
              title: 'Done',
              onPressed: () => msgController.text.trim().isNotEmpty
                  ? Navigate.forward(
                      context: context,
                      screen: PreviewSc(
                        isDark: widget.isDark,
                        color: stringColor(index),
                        msg: msgController.text.trim(),
                      ),
                    )
                  : {},
            )
        ],
      ),
      body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return TextInput(
          msgController: msgController,
          onChanged: (p0) => setState(() {}),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: stringColor(index == 13 ? 0 : index + 1),
        onPressed: () => changeColor(),
        child: const Icon(
          Icons.color_lens_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
