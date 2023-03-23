// ignore_for_file: constant_identifier_names

import 'package:chat_app/Model/current_user.dart';
import 'package:flutter/foundation.dart';
import 'audio.dart';
import 'file.dart';
import 'video.dart';
import '../enums.dart';

class ChatModel {
  ChatMessageType type;
  String message;
  List<String> imgList;
  int msgCount;
  ChatAudioModel audioModel;
  FileModel fileModel;
  String uuid;
  DateTime timeStamp;
  VideoModel videoModel;
  ChatStatus chatStatus;
  CurrentUserModel senderModel;

  ChatModel({
    this.type = ChatMessageType.TEXT,
    this.message,
    @required this.senderModel,
    this.imgList = const [],
    this.fileModel,
    this.audioModel,
    this.videoModel,
    @required this.timeStamp,
    @required this.chatStatus,
    @required this.uuid,
  });
}
