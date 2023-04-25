import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'loading/sending_file.dart';
import 'loading/typing.dart';

class SubTitleGroupDetails extends StatelessWidget {
  final GroupRecentMessageModel messageModel;
  final Animation<double> animation;
  final bool isDarkMode;

  const SubTitleGroupDetails(
      {Key key,
      @required this.messageModel,
      @required this.animation,
      @required this.isDarkMode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color textColor() {
      if (messageModel.lastMessage.lastChat.chatStatus ==
          ChatStatus.NewMessage) {
        return isDarkMode ? Colors.white.withOpacity(.8) : Colors.black;
      } else {
        return isDarkMode ? Styles.subtitleTxt : Styles.black38;
      }
    }

    TextStyle style({double fontsz}) => TextStyle(
          color: textColor(),
          fontSize: fontsz,
        );
    if (messageModel.messageStatus == MessageStatus.TYPING) {
      return FadeTransition(
        opacity: animation,
        child: const StatusTyping(),
      );
    } else if (messageModel.messageStatus == MessageStatus.SENDINGFILE) {
      return FadeTransition(
        opacity: animation,
        child: const StatusSendingFile(),
      );
    } else {
      if (messageModel.lastMessage.lastChat.type == ChatMessageType.PICTURE) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              messageModel.lastMessage.lastChat.senderModel['uid'] !=
                      currentUserModel.uid
                  ? Text(
                      '${textLimit(text: messageModel.lastMessage.lastChat.senderModel['username'], max: 13, morecharacter: '')}:',
                      style: style(fontsz: Styles.meduimFontSize - 1.7),
                    )
                  : const SizedBox(),
              photos(context),
              SizedBox(width: Styles.smallFontSize - 9),
              Text(
                '${images.length == 1 ? '' : images.length} Photo',
                style: style(fontsz: size(context).width / 30),
              ),
            ],
          ),
        );
      } else if (messageModel.lastMessage.lastChat.type ==
          ChatMessageType.FILE) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              messageModel.lastMessage.lastChat.senderModel['uid'] !=
                      currentUserModel.uid
                  ? Text(
                      '${textLimit(text: messageModel.lastMessage.lastChat.senderModel['username'], max: 13, morecharacter: '')}:',
                      style: style(fontsz: Styles.meduimFontSize - 1.7),
                    )
                  : const SizedBox(),
              SizedBox(width: Styles.smallFontSize - 9),
              Icon(
                CupertinoIcons.doc_fill,
                color: textColor(),
                size: size(context).width / 26,
              ),
              SizedBox(width: size(context).width / 130),
              Text(
                textLimit(
                  text: messageModel.lastMessage.lastChat.fileModel.fileName,
                  max: messageModel.lastMessage.lastChat.senderModel['uid'] ==
                          currentUserModel.uid
                      ? 26
                      : 16,
                ),
                style: style(),
              ),
            ],
          ),
        );
      } else if (messageModel.lastMessage.lastChat.type ==
          ChatMessageType.AUDIO) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              SizedBox(width: Styles.smallFontSize - 9),
              Icon(
                CupertinoIcons.mic_fill,
                color: Colors.grey.withOpacity(.5),
                size: size(context).width / 26,
              ),
              SizedBox(width: size(context).width / 200),
              Text(
                messageModel.lastMessage.lastChat.audioModel.duration,
                style: style(),
              ),
            ],
          ),
        );
      } else if (messageModel.lastMessage.lastChat.chatStatus ==
          ChatMessageType.VIDEO) {
        return Row(
          children: [
            messageModel.lastMessage.lastChat.senderModel['uid'] !=
                    currentUserModel.uid
                ? Text(
                    '${textLimit(text: messageModel.lastMessage.lastChat.senderModel['username'], max: 16, morecharacter: '')}:',
                    style: style(fontsz: Styles.meduimFontSize - 1.7),
                  )
                : const SizedBox(),
            SizedBox(width: Styles.smallFontSize - 9),
            Icon(
              CupertinoIcons.video_camera_solid,
              color: Colors.grey.withOpacity(.5),
              size: size(context).width / 18,
            ),
            SizedBox(width: size(context).width / 200),
            Text(
              'Video',
              style: style(),
            ),
          ],
        );
      }

      return Html(
        data:
            """<p><span>${messageModel.lastMessage.lastChat.senderModel['uid'] != currentUserModel.uid ? textLimit(text: '${messageModel.lastMessage.lastChat.senderModel['username']} :', max: messageModel.lastMessage.lastChat.senderModel['uid'] == currentUserModel.uid ? 27 : 13, morecharacter: '') : ''}</span> ${textLimit(text: messageModel.lastMessage.lastChat.message, max: messageModel.lastMessage.lastChat.senderModel['uid'] == currentUserModel.uid ? 30 : 16)}</p>""",
        style: {
          '*': Style(
              margin: Margins.zero,
              padding: EdgeInsets.zero,
              lineHeight: const LineHeight(1.36)),
          'p': Style(
            fontWeight: FontWeight.w100,
            color: isDarkMode
                ? messageModel.lastMessage.lastChat.chatStatus ==
                        ChatStatus.NewMessage
                    ? Colors.white.withOpacity(.8)
                    : Styles.subtitleTxt
                : Styles.black38,
          ),
          'span': Style(
            letterSpacing: .6,
            fontWeight: FontWeight.bold,
            fontSize: FontSize(Styles.meduimFontSize - 2),
            color: isDarkMode
                ? messageModel.lastMessage.lastChat.chatStatus ==
                        ChatStatus.NewMessage
                    ? Colors.white.withOpacity(.6)
                    : Styles.subtitleTxt
                : Styles.black38,
          ),
        },
      );
    }
  }

  Widget photos(BuildContext context) {
    if (images.length > 2) {
      return Row(
        children: [
          ...List.generate(2, (index) => img(images[index], context)),
        ],
      );
    }
    return Row(
      children: [
        ...List.generate(images.length, (index) => img(images[index], context)),
      ],
    );
  }

  Container img(img, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 1),
      height: size(context).width / 24,
      width: size(context).width / 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.4),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(img),
        ),
      ),
    );
  }
}
