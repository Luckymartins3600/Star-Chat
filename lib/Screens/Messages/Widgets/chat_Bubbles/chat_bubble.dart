import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/text_bubble.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/video_bubble.dart';
import '../../../../Model/enums.dart';
import '../../../../Model/Chat/chat.dart';
import 'audio_bubble.dart';
import 'file_bubble.dart';
import 'image_bubble.dart';

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  bool reciverTyping;
  ChatModel chatMessage;
  bool darkMode, isplaying, paused;
  AudioPlayer audioPlayer;
  void Function() onTap;
  final double progess;
  final Duration duration;
  final Duration position;
  ChatBubble({
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
    if (chatMessage.type == ChatMessageType.TEXT) {
      return TextBubble(chatMessage: chatMessage, darkMode: darkMode);
    } else if (chatMessage.type == ChatMessageType.PICTURE) {
      return ImageBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    } else if (chatMessage.type == ChatMessageType.AUDIO) {
      return AudioBubble(
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
    } else if (chatMessage.type == ChatMessageType.VIDEO) {
      return VideoBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    } else {
      return FileBubble(
        chatMessage: chatMessage,
        darkMode: darkMode,
      );
    }
  }
}
