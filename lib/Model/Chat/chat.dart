// ignore_for_file: constant_identifier_names

import 'package:chat_app/Model/current_user.dart';
import 'package:flutter/foundation.dart';
import 'audio.dart';
import 'file.dart';
import 'video.dart';
import '../enums.dart';

class ChatModel {
  dynamic type; //ChatMessageType
  String message;
  List<String> imgList;
  int msgCount;
  ChatAudioModel audioModel;
  FileModel fileModel;
  String uuid;
  dynamic timeStamp;
  VideoModel videoModel;
  dynamic chatStatus; //ChatStatus
  Map senderModel;//CurrentUserModel

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
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'message': message,
      'imgList': imgList,
      'msgCount': msgCount,
      'audioModel': audioModel,
      'fileModel': fileModel,
      'timeStamp': timeStamp,
      'videoModel': videoModel,
      'chatStatus': chatStatus,
      'senderModel': senderModel,
    };
  }

  ChatModel.fromMap(Map<String, dynamic> map) {
    type = map['type'];
    message = map['message'];
    imgList = map['imgList'];
    msgCount = map['msgCount'];
    audioModel = map['audioModel'];
    fileModel = map['fileModel'];
    timeStamp = map['timeStamp'];
    videoModel = map['videoModel'];
    chatStatus = map['chatStatus'];
    senderModel = map['senderModel'];
  }
}
