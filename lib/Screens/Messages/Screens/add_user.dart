import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/DataBase/firebase_service.dart';
import 'package:chat_app/Model/Chat/chat.dart';
import 'package:chat_app/Model/Chat/message.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddUserScreen extends StatefulWidget {
  final bool isDark;
  const AddUserScreen({
    Key key,
    @required this.isDark,
  }) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  bool loading = false;
  TextEditingController searchController = TextEditingController();
  List<CurrentUserModel> searchUsers = [];
  List<CurrentUserModel> users = [];
  bool searched = false, added = false;
  CurrentUserModel currentUserModel;
  @override
  void initState() {
    getallUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Add Contact'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(size(context).width / 12),
            child: TextField(
              controller: searchController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.search,
              onChanged: (value) => onSearch(),
              onSubmitted: (value) => onSearch(),
              decoration: InputDecoration(
                enabled: true,
                labelText: ' Email Address',
                labelStyle: TextStyle(
                  color: widget.isDark ? Styles.subtitleTxt : Styles.black38,
                  letterSpacing: 1,
                ),
                border: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
              ),
            ),
          ),
          CupertinoButton(
            padding:
                EdgeInsets.symmetric(horizontal: size(context).width / 6.5),
            onPressed: () async => await onSearch(),
            color: Styles.kPrimaryColor,
            child: const Text(
              'Search',
              style: TextStyle(letterSpacing: .5),
            ),
          ),
          SizedBox(height: size(context).width / 30),
          searched
              ? searchUsers.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: size(context).width / 20),
                      itemCount: searchUsers.length,
                      itemBuilder: (context, i) {
                        CurrentUserModel details =
                            CurrentUserModel.fromMap(searchUsers[i].toMap());
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  details.profilepic)),
                          trailing: IconButton(
                            onPressed: () => addFriend(details),
                            icon: Icon(
                              added
                                  ? CupertinoIcons.chat_bubble_text
                                  : Icons.group_add_rounded,
                              color: widget.isDark ? Colors.white : Colors.red,
                            ),
                          ),
                          title: Text(details.username),
                          subtitle: Text(
                            textLimit(text: details.email, max: 20),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ))
                  : Padding(
                      padding: EdgeInsets.all(size(context).width / 10),
                      child: Column(
                        children: [
                          Text('No matches for', style: style()),
                          SizedBox(height: size(context).width / 60),
                          Text('" ${searchController.text.trim()} "',
                              style: style()),
                        ],
                      ),
                    )
              : const SizedBox()
        ],
      ),
    );
  }

  onSearch() async {
    String text = searchController.text.trim().toLowerCase();

    setState(() => searched = true);
    if (searchController.text.trim().isNotEmpty) {
      setState(() {
        searchUsers = users
            .where((element) => element.email.toLowerCase() == text)
            .toList();
      });
    }

    print('Done: result: ${searchUsers.length} users}');
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(size(context).width / 40),
      borderSide: BorderSide(
        color: widget.isDark ? Styles.subtitleTxt : const Color(0x18000000),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Styles.kPrimaryColor,
      borderRadius: BorderRadius.circular(size(context).width / 40),
    );
  }

  TextStyle style() =>
      TextStyle(color: Colors.grey.shade500, letterSpacing: .8);
  Future getallUsers() async {
    currentUserModel = await FirebaseService()
        .getUserModelById(FirebaseAuth.instance.currentUser.uid);
    users = await FirebaseService().getAllUser();

    setState(() {});
  }

  Future<MessageModel> addFriend(CurrentUserModel targetUser) async {
    MessageModel chatRoom;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Messages")
        .where("participants.${currentUserModel.uid}", isEqualTo: true)
        .where("participants.${targetUser.uid}", isEqualTo: true)
        .get();

    if (snapshot.docs.isNotEmpty) {
      // Fetch the existing one
      var docData = snapshot.docs[0].data();
      MessageModel existingChatroom = MessageModel.fromMap(docData);

      chatRoom = existingChatroom;
    } else {
      // Create a new one
      ChatModel chatModel = ChatModel(
        senderModel: currentUserModel.toMap(),
        timeStamp: DateTime.now(),
        chatStatus: ChatStatus.SENT.name,
        uuid: const Uuid().v1(),
        type:ChatMessageType.TEXT.name 
      );
      MessageModel newChatroom = MessageModel(
        messageStatus: MessageStatus.INVITATION.name,
        uid: const Uuid().v1(),
        lastChat: chatModel.toMap(),
        participants: {
          currentUserModel.uid.toString(): true,
          targetUser.uid.toString(): true,
        },
        authurUid: currentUserModel.uid.toString(),
        unreadMsgCount: 1,
        isDeleted: false,
        recieverModel: targetUser.toMap(),
      );

      await FirebaseFirestore.instance
          .collection("Messages")
          .doc(newChatroom.uid)
          .set(newChatroom.toMap());

      chatRoom = newChatroom;

      log("New Chatroom Created!");
    }

    return chatRoom;
  }
}
