import 'dart:developer';
import 'dart:io';
import 'package:chat_app/Model/Group_Chat/chat_model.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/username.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:chat_app/Model/Chat/audio_model.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/url_file.dart';
import '../../../../Model/enums.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/trim_text.dart';

class GroupFileBubble extends StatelessWidget {
  final GroupChatModel chatMessage;
  final bool darkMode;
  const GroupFileBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  Color color() {
    if (chatMessage.lastChat.senderModel['uid'] == currentUserModel.uid) {
      return Styles.kPrimaryColor;
    } else {
      if (darkMode == false) {
        return const Color(0xFFEEEEEE);
      } else {
        return const Color(0x29757575);
      }
    }
  }

  Color borderColor() {
    if (chatMessage.lastChat.senderModel['uid'] == currentUserModel.uid) {
      if (darkMode) {
        return const Color(0x67ADADAD);
      } else {
        return const Color(0xFFCCDBE7);
      }
    } else {
      if (darkMode) {
        return const Color(0x17ADADAD);
      } else {
        return const Color(0x080E4CF5);
      }
    }
  }

  Color textColor() {
    if (chatMessage.lastChat.senderModel['uid'] == currentUserModel.uid) {
      return const Color(0xBBFFFFFF);
    } else {
      if (darkMode == false) {
        return const Color(0x720F0E0E);
      } else {
        return const Color(0xA6FFFFFF);
      }
    }
  }

  String fileType() {
    switch (chatMessage.lastChat.fileModel.fileType) {
      case FileType.APK:
        return 'APK';
        break;
      case FileType.PDF:
        return 'PDF';
        break;
      case FileType.TXT:
        return 'TXT';
        break;
      case FileType.XLS:
        return 'XLS';
        break;
      case FileType.ZIP:
        return 'ZIP';
        break;
      default:
        return 'UNKNOWN';
    }
  }

  custext(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: size(context).width / 40,
        ),
        child: Text(
          fileType() == 'UNKNOWN' ? '?' : fileType(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fileType() == 'UNKNOWN'
                ? size(context).width / 25
                : size(context).width / 35,
          ),
        ),
      );
  Widget iconStatus(context) {
    switch (chatMessage.lastChat.fileModel.fileType) {
      case FileType.APK:
        return custext(context);

        break;
      case FileType.PDF:
        return custext(context);

        break;
      case FileType.TXT:
        return custext(context);

        break;
      case FileType.XLS:
        return custext(context);

        break;
      case FileType.ZIP:
        return custext(context);

        break;
      default:
        return custext(context);
    }
  }

  Color fileColor() {
    switch (chatMessage.lastChat.fileModel.fileType) {
      case FileType.PDF:
        return const Color(0xCCAB271D);

        break;
      case FileType.XLS:
        return Colors.green;

      default:
        return const Color(0xBC9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    CurrentUserModel senderModel =
        CurrentUserModel.fromMap(chatMessage.lastChat.senderModel);
    return Column(
      crossAxisAlignment: senderModel.uid != currentUserModel.uid
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        DisplayUserName(
          top: size(context).width / 30,
          left: size(context).width / 19,
          bottom: size(context).width / 80,
          lastChat: chatMessage.lastChat,
          groupRole: chatMessage.groupRole,
        ),
        GestureDetector(
          onTap: () async {
            File file = await fileFromImageUrl(
              extension: 'jpeg',
              uri: 'asset/background/pexels-photo-4046303.jpeg',
              name: chatMessage.lastChat.fileModel.fileName,
            );

            if (file != null) {
              log(file.path);
              await OpenFile.open('asset/background/pexels-photo-4046303.jpeg');
            }
            await OpenFile.open('asset/background/pexels-photo-4046303.jpeg');
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: size(context).width / 30,
              left: senderModel.uid == currentUserModel.uid
                  ? size(context).width / 4
                  : size(context).width / 29,
              right: senderModel.uid != currentUserModel.uid
                  ? size(context).width / 4
                  : size(context).width / 45,
            ),
            width: size(context).width,
            decoration: BoxDecoration(
              color: color(),
              border: Border.all(color: borderColor(), width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size(context).width / 35),
                bottomLeft: Radius.circular(
                    senderModel.uid == currentUserModel.uid
                        ? size(context).width / 35
                        : 0),
                topRight: Radius.circular(size(context).width / 35),
                bottomRight: Radius.circular(
                    senderModel.uid != currentUserModel.uid
                        ? size(context).width / 35
                        : 0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    textLimit(
                      text: chatMessage.lastChat.fileModel.fileName,
                      max: 18,
                    ),
                    style: TextStyle(
                      color: senderModel.uid == currentUserModel.uid
                          ? Colors.white
                          : darkMode
                              ? Colors.white
                              : Colors.black,
                      fontSize: size(context).width / 27,
                    ),
                  ),
                  subtitle: Text(
                    '${chatMessage.lastChat.fileModel.fileSize} • ${fileType()}',
                    style: TextStyle(
                      color: textColor(),
                    ),
                  ),
                  leading: SizedBox(
                    width: size(context).width / 7,
                    height: size(context).width / 8.7,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //       'APK', 'PDF' ,
                        //     'TXT',  'XLS',
                        //  'ZIP',
                        //  'UNKNOWN';
                        Icon(
                          MdiIcons.file,
                          color: fileColor(),
                          size: size(context).width / 8,
                        ),
                        iconStatus(context),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size(context).width / 90,
                    right: size(context).width / 50,
                  ),
                  child: Text(
                    DateFormat('jm').format(audiofiles[2].timeStamp),
                    style: TextStyle(
                        color: textColor(), fontSize: size(context).width / 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
