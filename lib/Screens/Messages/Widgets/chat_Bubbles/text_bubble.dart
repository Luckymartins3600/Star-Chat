import 'package:chat_app/Model/current_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:chat_app/Model/Chat/chat.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';

class TextBubble extends StatelessWidget {
  final ChatModel chatMessage;
  final bool darkMode;
  const TextBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        CurrentUserModel senderModel =
        CurrentUserModel.fromMap(chatMessage.senderModel);
    return Align(
      alignment:
          (senderModel.uid!=currentUserModel.uid ? Alignment.topLeft : Alignment.topRight),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size(context).width / 25,
          vertical: size(context).width / 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size(context).width / 17),
          color: senderModel.uid==currentUserModel.uid 
              ? Styles.kPrimaryColor
              : darkMode == false
                  ? const Color(0xFFEEEEEE)
                  : const Color(0x29757575),
        ),
        padding: const EdgeInsets.all(16),
        child: Linkify(
          text: chatMessage.message,
          onOpen: (link) async {
            if (await canLaunchUrl(
              Uri.parse(link.url),
            )) {
              await launchUrl(Uri.parse(link.url));
            } else {
              return null;
            }
          },
          linkifiers: const [UrlLinkifier()],
          linkStyle: TextStyle(
              color: senderModel.uid==currentUserModel.uid ? const Color(0xFF0BF561) : Colors.teal,
              fontSize: size(context).width / 30,
              letterSpacing: .6,
              decoration: TextDecoration.none),
          style: TextStyle(
              color: senderModel.uid==currentUserModel.uid
                  ? Colors.white
                  : darkMode
                      ? Colors.white
                      : Colors.black),
        ),
      ),
    );
  }
}
