import 'package:chat_app/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:chat_app/Model/Chat/message.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';

class MsgState extends StatelessWidget {
  final MessageModel msg;
  const MsgState({Key key, @required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (msg.unreadMsgCount != 0) {
      return Container(
        height: size(context).width / 17,
        width: size(context).width / 17,
        padding: const EdgeInsets.all(1.2),
        decoration: const BoxDecoration(
          color: Styles.kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            NumberFormat.compact().format(msg.unreadMsgCount),
            style: TextStyle(
              letterSpacing: .05,
              fontSize: size(context).width / 55,
              fontWeight: FontWeight.w600,
              color: Styles.white,
            ),
          ),
        ),
      );
    } else {
      if (msg.lastChat.chatStatus == ChatStatus.DILIVERED) {
        return msg.lastChat.senderModel.uid==currentUserModel.uid
            ? Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.done_all_rounded,
                    color: Colors.grey.withOpacity(.6),
                    size: size(context).width / 20),
              )
            : const SizedBox();
      }
      if (msg.lastChat.chatStatus == ChatStatus.SENT) {
        return msg.lastChat.senderModel.uid==currentUserModel.uid
            ? Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.done_rounded,
                    color: Colors.grey.withOpacity(.6),
                    size: size(context).width / 20),
              )
            : const SizedBox();
      } else {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.done_all_rounded,
              color: Styles.kPrimaryColor, size: size(context).width / 20),
        );
      }
    }
  }
}
