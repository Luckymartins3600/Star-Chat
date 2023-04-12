import 'package:flutter/material.dart';
import '../enums.dart';
import 'chat_model.dart';

class GroupInfo {
  String name, profileUrl, bio;
  bool public, pathfromfile;
  GroupInfo({
    @required this.name,
    @required this.bio,
    @required this.profileUrl,
    this.public,
    this.pathfromfile,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "profileUrl": profileUrl,
      "bio": bio,
      "public": public,
      "pathfromfile": pathfromfile,
    };
  }
}

class GroupRecentMessageModel {
  int unreadMsgCount;
  MessageStatus messageStatus;
  GroupChatModel lastMessage;
  GroupRecentMessageModel({
    this.messageStatus = MessageStatus.NONE,
    @required this.lastMessage,
    @required this.unreadMsgCount,
  });
}
