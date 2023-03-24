import 'package:chat_app/Model/Chat/chat.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class DisplayUserName extends StatelessWidget {
  final ChatModel lastChat;
  final GroupRole groupRole;
  final double left;
  final double right;
  final double bottom;
  final double top;

  const DisplayUserName({
    Key key,
    @required this.lastChat,
    @required this.groupRole,
    this.left,
    this.right,
    this.bottom,
    this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom ?? 0, top: top ?? 0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: left ??
                  (lastChat.senderModel.uid != currentUserModel.uid
                      ? size(context).width / 16
                      : 0),
              right: right ?? lastChat.senderModel.uid == currentUserModel.uid
                  ? size(context).width / 16
                  : 0,
            ),
            child: Text(
              lastChat.senderModel.uid == currentUserModel.uid
                  ? ''
                  : textLimit(text: lastChat.senderModel.username, max: 20),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size(context).width / 30,
                color: Colors.grey,
              ),
            ),
          ),
          lastChat.senderModel.uid == currentUserModel.uid
              ? const SizedBox()
              : groupRole != GroupRole.ADMIN
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        MdiIcons.shieldStar,
                        size: size(context).width / 25,
                        color: Styles.kPrimaryColor,
                      ),
                    ),
          //  Container(
          //     margin:
          //         EdgeInsets.only(left: size(context).width / 60),
          //     padding: EdgeInsets.symmetric(
          //       horizontal: size(context).width / 40,
          //       vertical: size(context).width / 75,
          //     ),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Styles.kPrimaryColor),
          //       borderRadius: BorderRadius.circular(
          //         size(context).width / 60,
          //       ),
          //     ),
          //     child: const Text('Admin'),
          //   )
        ],
      ),
    );
  }
}
