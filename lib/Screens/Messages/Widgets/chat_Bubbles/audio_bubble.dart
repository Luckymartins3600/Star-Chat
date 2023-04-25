import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Utils/const.dart';
import '../../../../Model/Chat/audio_model.dart';
import '../../../../Model/Chat/chat.dart';
import '../../../../Styles/style.dart';

class AudioBubble extends StatelessWidget {
  final ChatModel chatMessage;
  final bool darkMode, isplaying, paused;
  final AudioPlayer audioPlayer;
  final void Function() onTap;
  final double progess;
  final Duration duration;
  final Duration position;
  const AudioBubble({
    Key key,
    this.chatMessage,
    this.darkMode,
    @required this.audioPlayer,
    @required this.isplaying,
    @required this.onTap,
    @required this.duration,
    @required this.position,
    @required this.progess,
    @required this.paused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentUserModel senderModel =
        CurrentUserModel.fromMap(chatMessage.senderModel);
    return Container(
      padding: EdgeInsets.all(size(context).width / 40),
      margin: EdgeInsets.only(
        top: size(context).width / 20,
        left: senderModel.uid == currentUserModel.uid
            ? size(context).width / 3
            : size(context).width / 29,
        right: senderModel.uid != currentUserModel.uid
            ? size(context).width / 3
            : size(context).width / 29,
      ),
      decoration: BoxDecoration(
        color: color(senderModel),
        border: Border.all(color: borderColor(senderModel), width: .9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size(context).width / 20),
          bottomLeft: Radius.circular(senderModel.uid == currentUserModel.uid
              ? size(context).width / 20
              : 0),
          topRight: Radius.circular(size(context).width / 20),
          bottomRight: Radius.circular(senderModel.uid != currentUserModel.uid
              ? size(context).width / 20
              : 0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: size(context).width / 25,
              backgroundColor: Styles.white,
              child: Icon(
                isplaying ? Icons.pause_outlined : Icons.play_arrow_rounded,
                color: Styles.black,
              ),
            ),
          ),
          SizedBox(width: size(context).width / 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size(context).width / 30),
              SizedBox(
                width: size(context).width / 2.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size(context).width),
                  child: Slider(
                    activeColor: lightcolor(senderModel),
                    inactiveColor: lightcolor(senderModel),
                    thumbColor: Colors.white,
                    value: isplaying
                        ? (position != null &&
                                duration != null &&
                                position.inMilliseconds > 0 &&
                                position.inMilliseconds <
                                    duration.inMilliseconds)
                            ? position.inMilliseconds / duration.inMilliseconds
                            : 0.0
                        : 0.04,
                    onChanged: (double value) {
                      print(paused == false);
                      if (duration == null) {
                        return;
                      }
                      if (!isplaying && !paused) {
                        print('object');
                        return;
                      }
                      final position = value * duration.inMilliseconds;
                      audioPlayer
                          .seek(Duration(milliseconds: position.round()))
                          .then((value) => audioPlayer.pause());
                    },
                  ),
                ),
              ),
              SizedBox(height: size(context).width / 70),
              Row(
                children: [
                  Text(
                    isplaying ? printDuration(position) : '00:00',
                    style: TextStyle(
                      fontSize: size(context).width / 35,
                      color: textColor(senderModel),
                    ),
                  ),
                  SizedBox(width: size(context).width / 5),
                  Text(
                    DateFormat('jm').format(audiofiles[0].timeStamp),
                    style: TextStyle(
                      fontSize: size(context).width / 35,
                      color: textColor(senderModel),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color color(CurrentUserModel senderModel) {
    if (senderModel.uid == currentUserModel.uid) {
      return Styles.kPrimaryColor;
    } else {
      if (darkMode == false) {
        return const Color(0xFFEEEEEE);
      } else {
        return const Color(0x29757575);
      }
    }
  }

  Color textColor(CurrentUserModel senderModel) {
    if (senderModel.uid == currentUserModel.uid) {
      return const Color(0xBBFFFFFF);
    } else {
      if (darkMode == false) {
        return const Color(0x720F0E0E);
      } else {
        return const Color(0xA6FFFFFF);
      }
    }
  }

  Color lightcolor(CurrentUserModel senderModel) {
    if (senderModel.uid == currentUserModel.uid) {
      return const Color(0x38EBE9E9);
    } else {
      if (darkMode == false) {
        return const Color(0x33A3A0A0);
      } else {
        return const Color(0x29757575);
      }
    }
  }

  Color borderColor(CurrentUserModel senderModel) {
    if (senderModel.uid == currentUserModel.uid) {
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

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
