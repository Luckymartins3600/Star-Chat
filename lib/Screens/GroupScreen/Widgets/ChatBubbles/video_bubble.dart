import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/chat_model.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/username.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/video.dart';

import '../../../../Model/Chat/audio_model.dart';
import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';
import '../../../../func/navigate.dart';

class GroupVideoBubble extends StatelessWidget {
  final GroupChatModel chatMessage;
  final bool darkMode;
  const GroupVideoBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  Color color() {
    if (chatMessage.lastChat.senderModel.uid == currentUserModel.uid) {
      return Styles.kPrimaryColor.withOpacity(.7);
    } else {
      if (darkMode == false) {
        return const Color(0xB1A6A5A5);
      } else {
        return const Color(0x29757575);
      }
    }
  }

  Color borderColor() {
    if (chatMessage.lastChat.senderModel.uid == currentUserModel.uid) {
      return Styles.kPrimaryColor;
    } else {
      if (darkMode) {
        return const Color(0x33ADADAD);
      } else {
        return const Color(0x64A3A9B8);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chatMessage.lastChat.senderModel.uid != currentUserModel.uid
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
      children: [
        DisplayUserName(
          top: size(context).width / 27,
          left: size(context).width / 16,
          bottom: size(context).width / 80,
          lastChat: chatMessage.lastChat,
          groupRole: chatMessage.groupRole,
        ),
        GestureDetector(
          onTap: () => Navigate.forward(
            context: context,
            screen: ViewVideo(
              isDarkMode: darkMode,
              model: chatMessage.lastChat.videoModel,
              tag: 'Random',
            ),
            type: PageTransitionType.fade,
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: chatMessage.lastChat.senderModel.uid == currentUserModel.uid
                  ? size(context).width / 3.6
                  : size(context).width / 29,
              right:
                  chatMessage.lastChat.senderModel.uid != currentUserModel.uid
                      ? size(context).width / 3.6
                      : size(context).width / 29,
            ),
            height: size(context).width / 1.6,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor(), width: 1.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size(context).width / 35),
                bottomLeft: Radius.circular(
                    chatMessage.lastChat.senderModel.uid == currentUserModel.uid
                        ? size(context).width / 35
                        : 0),
                topRight: Radius.circular(size(context).width / 35),
                bottomRight: Radius.circular(
                    chatMessage.lastChat.senderModel.uid != currentUserModel.uid
                        ? size(context).width / 30
                        : 0),
              ),
              image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                  Color(0x4D000000),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    chatMessage.lastChat.videoModel.thumbnail),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: size(context).width / 4,
                    width: size(context).width / 10,
                    decoration: const BoxDecoration(
                        color: Color(0xFFEEEEEE), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat('jm').format(audiofiles[0].timeStamp),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xD6FEFEFE),
                        fontSize: size(context).width / 32,
                        letterSpacing: 1,
                      ),
                    ),
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
