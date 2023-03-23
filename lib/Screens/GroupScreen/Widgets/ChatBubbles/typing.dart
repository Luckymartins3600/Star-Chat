import 'package:chat_app/Model/Group_Chat/chat_model.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/username.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TypingWidget extends StatelessWidget {
  final GroupChatModel messageModel;
  final bool isDarkMode;
  const TypingWidget({Key key, @required this.isDarkMode, this.messageModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DisplayUserName(
          left: size(context).width / 20,
          top: size(context).width / 40,
          bottom: size(context).width / 90,
          lastChat: messageModel.lastChat,
          groupRole: messageModel.groupRole,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(
              left: size(context).width / 29,
              right: size(context).width / 1.8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size(context).width / 35),
                topRight: Radius.circular(size(context).width / 35),
                bottomRight: Radius.circular(size(context).width / 35),
              ),
              color: isDarkMode
                  ? const Color(0x29757575)
                  : const Color(0x29757575),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size(context).width / 16,
              vertical: size(context).width / 45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Typing',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SpinKitThreeBounce(
                    color: Styles.kPrimaryColor,
                    size: size(context).width / 17,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
