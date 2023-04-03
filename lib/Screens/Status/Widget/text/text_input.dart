import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.msgController,
    this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;
  final TextEditingController msgController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: size(context).width / 15),
        child: TextField(
          autofocus: true,
          autocorrect: true,
          minLines: 1,
          maxLines: 10,
          maxLength: 350,
          controller: msgController,
          decoration: InputDecoration(
              counterText: '',
              hintText: 'Start Typing...',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: size(context).width / 20)),
          style: TextStyle(
            height: 1.2,
            fontSize: size(context).width / 21,
            color: const Color(0xDAFFFFFF),
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          onEditingComplete: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
