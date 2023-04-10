import 'package:chat_app/Model/current_user.dart';
import 'package:flutter/foundation.dart';

import 'package:chat_app/Model/enums.dart';

import 'chat.dart';

class MessageModel {
  MessageStatus messageStatus;
  ChatModel lastChat;
  int unreadMsgCount;
  bool isDeleted;
  CurrentUserModel authurModel;

  String senderDraftText, recipientDraftText;

  MessageModel({
    this.messageStatus = MessageStatus.NONE,
    @required this.lastChat,
    @required this.unreadMsgCount,
    this.isDeleted = false,
    this.senderDraftText = '',
    this.recipientDraftText = '',
    this.authurModel,
  });
}
