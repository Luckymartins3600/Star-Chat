import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Screens/chat_sc.dart';
import 'package:chat_app/Screens/Messages/Widgets/MessageTile/msg_state.dart';
import 'package:chat_app/Screens/Messages/Widgets/MessageTile/sub_tile.dart';
import '../../../../Model/Dummy/dummy_sgchat.dart';
import '../../../../Styles/style.dart';
import '../../../../Model/Chat/message.dart';
import '../../../../Utils/const.dart';
import '../../Utils/format_date.dart';

class MessageTile extends StatefulWidget {
  final int index;
  final bool isDarkMode;
  final MessageModel messageModel;
  const MessageTile(
      {Key key,
      @required this.index,
      @required this.isDarkMode,
      @required this.messageModel})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  List<String> images;
  MessageModel messageModel;

  @override
  void initState() {
    super.initState();
    messageModel = widget.messageModel;
    images = recentMessageList[widget.index].lastChat['imgList'];
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..repeat(reverse: true);

    animation = Tween<double>(begin: 0, end: 1).animate(controller);
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
      horizontalTitleGap: size(context).width / 35,
      onTap: () => Navigator.push(
        context,
        PageTransition(
          child: ChatScreen(
            index: widget.index,
            img: faker.image.image(random: true),
            name: faker.internet.userName(),
            isDarkMode: widget.isDarkMode,
          ),
          type: PageTransitionType.rightToLeft,
        ),
      ),
      title: Text(
        widget.messageModel.recieverModel['username'],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(FormateDate(DateTime.now()).getText()),
          const Spacer(),
          MsgState(msg: widget.messageModel)
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SubTitleDetails(
          messageModel: widget.messageModel,
          animation: animation,
          isDarkMode: widget.isDarkMode,
        ),
      ),
      leading: CircleAvatar(
        radius: size(context).width / 14,
        backgroundImage: CachedNetworkImageProvider(
          widget.messageModel.recieverModel['profilepic'],
        ),
        child: widget.index.isEven
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size(context).width / 30,
                    right: size(context).width / 80,
                  ),
                  child: CircleAvatar(
                    radius: size(context).width / 90,
                    backgroundColor: Styles.kPrimaryColor,
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
