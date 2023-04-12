import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class ErrorMSG extends StatelessWidget {
  const ErrorMSG({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size(context).width / 90),
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: size(context).width / 19,
          ),
          SizedBox(width: size(context).width / 60),
          Text(
            index == 1
                ? 'Choose a name for your group.'
                : 'Choose a privacy level for your group.',
            style: const TextStyle(color: Colors.red, letterSpacing: .8),
          ),
        ],
      ),
    );
  }
}