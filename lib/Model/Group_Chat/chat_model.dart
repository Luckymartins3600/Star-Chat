import 'package:chat_app/Model/Chat/chat.dart';
import 'package:flutter/foundation.dart';
import '../enums.dart';

class GroupChatModel {
  GroupRole groupRole;
  ChatModel lastChat;
  GroupChatModel({
    this.groupRole = GroupRole.STANDARD,
    @required this.lastChat,
  });
}
