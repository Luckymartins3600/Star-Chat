import 'package:flutter/foundation.dart';

import 'package:chat_app/Model/enums.dart';

class MessageModel {
  dynamic messageStatus; //MessageStatus
  Map lastChat; //[ChatModel]
  int unreadMsgCount;
  bool isDeleted;
  Map recieverModel; // recieverdetails
  String senderDraftText, uid, recipientDraftText, role, authurUid;
  Map<String, dynamic> participants;

  MessageModel({
    this.messageStatus = MessageStatus.NONE,
    @required this.lastChat,
    @required this.unreadMsgCount,
    @required this.uid,
    this.isDeleted = false,
    this.senderDraftText = '',
    this.recipientDraftText = '',
    this.recieverModel,
    this.authurUid,
    this.role='Standard',
    this.participants,
  });
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "messageStatus": messageStatus,
      "lastChat": lastChat,
      "unreadMsgCount": unreadMsgCount,
      "isDeleted": isDeleted,
      "senderDraftText": senderDraftText,
      "recipientDraftText": recipientDraftText,
      "recieverModel": recieverModel,
      "isAuthur": authurUid,
      "participants": participants,
      "role": role,
    };
  }

  MessageModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    messageStatus = map["messageStatus"];
    lastChat = map["lastChat"];
    unreadMsgCount = map["unreadMsgCount"];
    isDeleted = map["isDeleted"];
    senderDraftText = map["senderDraftText"];
    recipientDraftText = map["recipientDraftText"];
    recieverModel = map["recieverModel"];
    participants = map["participants"];
    role = map["role"];
  }
}
