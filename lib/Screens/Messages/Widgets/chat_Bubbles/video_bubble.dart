import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/video.dart';

import '../../../../Model/Chat/audio_model.dart';
import '../../../../Model/Chat/chat.dart';
import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';
import '../../../../func/navigate.dart';

class VideoBubble extends StatelessWidget {
  final ChatModel chatMessage;
  final bool darkMode;
  const VideoBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  Color color() {
    if (chatMessage.senderModel.uid == currentUserModel.uid) {
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
    if (chatMessage.senderModel.uid == currentUserModel.uid) {
      if (darkMode) {
        return const Color(0x55ADADAD);
      } else {
        return const Color(0x7BCCDBE7);
      }
    } else {
      if (darkMode) {
        return const Color(0x17ADADAD);
      } else {
        return const Color(0x64A3A9B8);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigate.forward(
        context: context,
        screen: ViewVideo(
          isDarkMode: darkMode,
          model: chatMessage.videoModel,
          tag: 'Random',
        ),
        type: PageTransitionType.fade,
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: size(context).width / 20,
          left: chatMessage.senderModel.uid == currentUserModel.uid
              ? size(context).width / 3.6
              : size(context).width / 29,
          right: chatMessage.senderModel.uid != currentUserModel.uid
              ? size(context).width / 3.6
              : size(context).width / 29,
        ),
        height: size(context).width / 1.6,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor(), width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size(context).width / 20),
            bottomLeft: Radius.circular(
                chatMessage.senderModel.uid == currentUserModel.uid
                    ? size(context).width / 20
                    : 0),
            topRight: Radius.circular(size(context).width / 20),
            bottomRight: Radius.circular(
                chatMessage.senderModel.uid != currentUserModel.uid
                    ? size(context).width / 20
                    : 0),
          ),
          image: DecorationImage(
            colorFilter: const ColorFilter.mode(
              Color(0x4D000000),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(chatMessage.videoModel.thumbnail),
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
    );
  }
}
