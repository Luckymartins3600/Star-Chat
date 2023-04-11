import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/func/navigate.dart';

import '../../../Utils/const.dart';
import '../../Messages/Utils/format_date.dart';
import '../../../Utils/trim_text.dart';
import '../Screens/chat_screen.dart';
import 'MessageTile/msg_state.dart';
import 'MessageTile/sub_tile.dart';

class GroupMessageTile extends StatefulWidget {
  final GroupRecentMessageModel groupMessageModel;
  final bool isDarkMode;
  final GroupInfo groupInfo;
  const GroupMessageTile({
    Key key,
    @required this.isDarkMode,
    this.groupMessageModel,
    @required this.groupInfo,
  }) : super(key: key);

  @override
  State<GroupMessageTile> createState() => _GroupMessageTileState();
}

class _GroupMessageTileState extends State<GroupMessageTile>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  GroupInfo groupInfo;
  @override
  void initState() {
    groupInfo = widget.groupInfo;
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..repeat(reverse: true);

    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animation = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Styles.smallFontSize,
        vertical: 5,
      ),
      minLeadingWidth: 0,
      horizontalTitleGap: Styles.meduimFontSize,
      onTap: () {
        Navigate.forward(
          context: context,
          screen: GroupChatScreen(
            index: 3,
            img: faker.image.image(random: false),
            isDarkMode: widget.isDarkMode,
            name: 'wait what ?',
          ),
        );
      },
      title: Text(groupInfo.name),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(FormateDate(DateTime.now()).getText()),
          const Spacer(),
          GroupMsgState(msg: widget.groupMessageModel)
        ],
      ),
      subtitle: SubTitleGroupDetails(
        messageModel: widget.groupMessageModel,
        animation: animation,
        isDarkMode: widget.isDarkMode,
      ),
      leading: CircleAvatar(
        radius: size(context).width / 17,
        backgroundImage: groupInfo.profileUrl == null
            ? null
            : CachedNetworkImageProvider(groupInfo.profileUrl),
        child: groupInfo.profileUrl == null
            ? Icon(CupertinoIcons.person_2_fill, size: size(context).width / 13)
            : null,
      ),
    );
  }

  TextStyle style() => TextStyle(
        color: widget.isDarkMode ? Styles.subtitleTxt : Styles.black38,
      );

  Widget subtitle(BuildContext context) {
    return Text(
      textLimit(
        text: widget.groupMessageModel.lastMessage.lastChat.message,
        max: 24,
      ),
      style: style(),
    );
  }
}
