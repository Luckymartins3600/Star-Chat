import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';

class StatusTyping extends StatelessWidget {
  const StatusTyping({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size(context).width / 190),
          child: const Text(
            'Typing',
            style: TextStyle(
              color: Styles.kPrimaryColor,
            ),
          ),
        ),
        const SizedBox(width: 2),
        SpinKitThreeBounce(
          duration: const Duration(seconds: 1),
          size: Styles.fontSize - 2,
          color: Styles.kPrimaryColor,
        ),
      ],
    );
  }
}
