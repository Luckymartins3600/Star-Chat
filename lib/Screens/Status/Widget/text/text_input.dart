import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

List<String> fonts = [
 'Font0',
 'Font1',
 'Font2',
 'Font3',
 'Font4',
 'Font5',
 'Font6',
 'Font7',
 'Font8',
 'Font9',
 'Font10',
 'Font11',
 'Font12',
 'Font13',
 'Font14',
 'Font15',
 'Font16',
 'Font17',
 'Font18',
 'Font19',
 'Font20',
];

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.msgController,
    this.onChanged,
    this.onEditingComplete,
    this.fontStyle,
    this.textAlign,
  }) : super(key: key);

  final void Function(String) onChanged;
  final TextEditingController msgController;
  final TextStyle fontStyle;
  final TextAlign textAlign;
  final void Function() onEditingComplete;
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
          style: fontStyle ??
              TextStyle(
                height: 1.2,
                fontSize: size(context).width / 21,
                color: const Color(0xDAFFFFFF),
                fontFamily: fonts[1],
              ),
          textAlign: textAlign ?? TextAlign.center,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        ),
      ),
    );
  }
}
