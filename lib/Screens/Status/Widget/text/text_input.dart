import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.msgController,
  }) : super(key: key);

  final TextEditingController msgController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: size(context).width / 15),
        constraints: BoxConstraints(
          maxHeight: size(context).width / .9,
          maxWidth: size(context).width / 1.07,
        ),
        child: AutoSizeTextField(
          autofocus: true,
          autocorrect: true,
          minLines: 1,
          maxLines: 10,
          maxLength: 320,
          controller: msgController,
          decoration: const InputDecoration(
            counterText: '',
            hintText: 'Start Typing...',
            border: InputBorder.none,
          ),
          fullwidth: false,
          minFontSize: 20,
          minWidth: 280,
          style: TextStyle(
            height: 1.2,
            fontSize: size(context).width / 20,
            color: const Color(0xDAFFFFFF),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onEditingComplete: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
