import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chat_app/Styles/style.dart';

import '../../../../../Utils/const.dart';

class StatusSendingFile extends StatelessWidget {
  const StatusSendingFile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Sending file',
          style: TextStyle(
            color: Styles.kPrimaryColor,
          ),
        ),
        SizedBox(width: size(context).width / 90),
        Padding(
          padding: EdgeInsets.only(bottom: size(context).width / 190),
          child: SizedBox(
            height: 9,
            child: SpinKitWave(
              color: Styles.kPrimaryColor,
              size: Styles.fontSize - 2,
              type: SpinKitWaveType.center,
            ),
          ),
        ),
      ],
    );
  }
}
