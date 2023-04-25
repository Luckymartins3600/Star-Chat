import 'package:chat_app/Screens/GroupScreen/Widgets/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Model/Group_Chat/chat_model.dart';
import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';
import '../../../Messages/Utils/format_date.dart';

class GroupTextBubble extends StatelessWidget {
  final GroupChatModel chatMessage;
  final bool darkMode;
  const GroupTextBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size(context).width / 30,
      ),
      child: Column(
        crossAxisAlignment:
            chatMessage.lastChat.senderModel['uid'] != currentUserModel.uid
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
        children: [
          DisplayUserName(
              lastChat: chatMessage.lastChat, groupRole: chatMessage.groupRole),
          Align(
            alignment:
                chatMessage.lastChat.senderModel['uid'] != currentUserModel.uid
                    ? Alignment.topLeft
                    : Alignment.topRight,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size(context).width / 25,
                    vertical: size(context).width / 60,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(size(context).width / 29),
                    color: chatMessage.lastChat.senderModel['uid'] ==
                            currentUserModel.uid
                        ? Styles.kPrimaryColor
                        : darkMode == false
                            ? const Color(0xFFEEEEEE)
                            : const Color(0x29757575),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Linkify(
                    text: chatMessage.lastChat.message,
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
                        color: chatMessage.lastChat.senderModel['uid'] ==
                                currentUserModel.uid
                            ? const Color(0xFF0BF561)
                            : Colors.teal,
                        fontSize: size(context).width / 30,
                        letterSpacing: .6,
                        decoration: TextDecoration.none),
                    style: TextStyle(
                      color: chatMessage.lastChat.senderModel['uid'] ==
                              currentUserModel.uid
                          ? Colors.white
                          : darkMode
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: chatMessage.lastChat.senderModel['uid'] == currentUserModel.uid
                  ? 0
                  : size(context).width / 18,
              right:
                  chatMessage.lastChat.senderModel['uid'] != currentUserModel.uid
                      ? 0
                      : size(context).width / 28,
            ),
            child: Text(
              FormateDate(DateTime.now()).getText(),
              style: TextStyle(
                fontSize: size(context).width / 30,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
