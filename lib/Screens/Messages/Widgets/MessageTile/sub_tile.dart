import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/Chat/message.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';

import 'loading/sending_file.dart';
import 'loading/typing.dart';

class SubTitleDetails extends StatelessWidget {
  final MessageModel messageModel;
  final Animation<double> animation;
  final bool isDarkMode;
  const SubTitleDetails(
      {Key key,
      @required this.messageModel,
      @required this.animation,
      @required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      if (messageModel.lastChat.type == ChatMessageType.PICTURE) {
        return Row(
          children: [
            photos(context),
            SizedBox(width: Styles.smallFontSize - 9),
            Text(
              '${images.length == 1 ? '' : images.length} Photo',
              style: style(),
            ),
          ],
        );
      } else if (messageModel.lastChat.type == ChatMessageType.FILE) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              SizedBox(width: Styles.smallFontSize - 9),
              Icon(
                CupertinoIcons.doc_fill,
                color: Colors.grey.withOpacity(.5),
                size: size(context).width / 26,
              ),
              SizedBox(width: size(context).width / 130),
              Text(
                textLimit(
                  text: messageModel.lastChat.fileModel.fileName,
                  max: 18,
                ),
                style: style(),
              ),
            ],
          ),
        );
      } else if (messageModel.lastChat.type == ChatMessageType.AUDIO) {
        return Row(
          children: [
            SizedBox(width: Styles.smallFontSize - 9),
            Icon(
              CupertinoIcons.mic_fill,
              color: Colors.grey.withOpacity(.5),
              size: size(context).width / 26,
            ),
            SizedBox(width: size(context).width / 200),
            Text(
              messageModel.lastChat.audioModel.duration,
              style: style(),
            ),
          ],
        );
      } else if (messageModel.lastChat.type == ChatMessageType.VIDEO) {
        return Row(
          children: [
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
      return Text(
        textLimit(text: messageModel.lastChat.message, max: 22),
        style: style(),
      );
    }
  }

  Widget photos(BuildContext context) {
    if (images.length > 3) {
      return Row(
        children: [
          ...List.generate(3, (index) => img(images[index], context)),
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

  TextStyle style() => TextStyle(
        color: isDarkMode ? Styles.subtitleTxt : Styles.black38,
      );
}
