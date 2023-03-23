import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/Model/Group_Chat/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/ChatBubbles/text_bubble.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/ChatBubbles/video_bubble.dart';
import '../../../../Model/enums.dart';
import 'audio_bubble.dart';
import 'file_bubble.dart';
import 'image_bubble.dart';

// ignore: must_be_immutable
class GroupChatBubble extends StatelessWidget {
  final bool reciverTyping;
  final GroupChatModel chatMessage;
  final bool darkMode, isplaying, paused;
  final AudioPlayer audioPlayer;
  void Function() onTap;
  final double progess;
  final Duration duration;
  final Duration position;
  GroupChatBubble({
    Key key,
    @required this.chatMessage,
    @required this.darkMode,
    @required this.audioPlayer,
    @required this.isplaying,
    @required this.paused,
    @required this.onTap,
    @required this.reciverTyping,
    this.duration,
    this.position,
    this.progess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatMessage.lastChat.type == ChatMessageType.TEXT) {
      return GroupTextBubble(chatMessage: chatMessage, darkMode: darkMode);
    } else if (chatMessage.lastChat.type == ChatMessageType.PICTURE) {
      return GroupImageBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    } else if (chatMessage.lastChat.type == ChatMessageType.AUDIO) {
      return GroupAudioBubble(
        duration: duration,
        position: position,
        progess: progess,
        isplaying: isplaying,
        chatMessage: chatMessage,
        darkMode: darkMode,
        audioPlayer: audioPlayer,
        onTap: onTap,
        paused: paused,
      );
    } else if (chatMessage.lastChat.type == ChatMessageType.VIDEO) {
      return GroupVideoBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    } else {
      return GroupFileBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    }
  }
}
