import 'package:flutter/material.dart';
import '../enums.dart';
import 'chat_model.dart';

class GroupInfo {
  String name, uid, profileUrl;
  GroupInfo(
      {@required this.name, @required this.uid, @required this.profileUrl});
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
