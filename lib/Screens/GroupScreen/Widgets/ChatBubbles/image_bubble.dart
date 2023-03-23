import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/chat_model.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/username.dart';
import 'package:chat_app/Screens/Messages/Utils/format_date.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/multiimages.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/single_image.dart';
import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';
import '../../../../func/navigate.dart';

class GroupImageBubble extends StatelessWidget {
  final GroupChatModel chatMessage;
  final bool darkMode;
  const GroupImageBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatMessage.lastChat.imgList != null &&
        chatMessage.lastChat.imgList.length > 3) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: size(context).width / 30,
        ),
        child: Column(
          crossAxisAlignment:
              chatMessage.lastChat.senderModel.uid != currentUserModel.uid
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
          children: [
            DisplayUserName(
                left: size(context).width / 14,
                lastChat: chatMessage.lastChat,
                groupRole: chatMessage.groupRole),
            GestureDetector(
              onTap: () => Navigate.forward(
                context: context,
                screen: ViewMultipleImage(
                  isDarkMode: darkMode,
                  images: chatMessage.lastChat.imgList,
                ),
                type: PageTransitionType.rightToLeft,
              ),
              child: Container(
                height: size(context).width / 1.89,
                padding: EdgeInsets.all(size(context).width / 60),
                margin: EdgeInsets.only(
                  left: chatMessage.lastChat.senderModel.uid ==
                          currentUserModel.uid
                      ? size(context).width / 4
                      : size(context).width / 16,
                  right: chatMessage.lastChat.senderModel.uid !=
                          currentUserModel.uid
                      ? size(context).width / 4
                      : size(context).width / 40,
                  bottom: size(context).width / 50,
                  top: size(context).width / 50,
                ),
                decoration: BoxDecoration(
                  color: chatMessage.lastChat.senderModel.uid ==
                          currentUserModel.uid
                      ? Styles.kPrimaryColor
                      : darkMode == false
                          ? const Color(0xFFEEEEEE)
                          : const Color(0x29757575),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size(context).width / 50),
                    bottomRight: Radius.circular(size(context).width / 50),
                    topLeft: chatMessage.lastChat.senderModel.uid ==
                            currentUserModel.uid
                        ? Radius.circular(size(context).width / 50)
                        : const Radius.circular(0),
                    topRight: chatMessage.lastChat.senderModel.uid !=
                            currentUserModel.uid
                        ? Radius.circular(size(context).width / 50)
                        : const Radius.circular(0),
                  ),
                ),
                child: GridView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size(context).width / 2,
                    childAspectRatio: 3 / 2.4,
                    crossAxisSpacing: size(context).width / 100,
                    mainAxisSpacing: size(context).width / 100,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              chatMessage.lastChat.imgList[index]),
                        ),
                        borderRadius:
                            BorderRadius.circular(size(context).width / 60),
                      ),
                      child:
                          chatMessage.lastChat.imgList.length > 4 && index == 3
                              ? Center(
                                  child: Text(
                                  '+ ${chatMessage.lastChat.imgList.length - 4}',
                                  style: TextStyle(
                                    color: Styles.white,
                                    fontSize: size(context).width / 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Styles.kdefaultFamily,
                                  ),
                                ))
                              : null,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: size(context).width / 13),
              child: Text(
                FormateDate(DateTime.now()).getText(),
                style: TextStyle(
                  fontSize: size(context).width / 30,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: size(context).width / 30,
        ),
        child: Column(
          crossAxisAlignment:
              chatMessage.lastChat.senderModel.uid != currentUserModel.uid
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
          children: [
            DisplayUserName(
                left: size(context).width / 14,
                bottom: size(context).width / 90,
                lastChat: chatMessage.lastChat,
                groupRole: chatMessage.groupRole),
            GestureDetector(
              onTap: () => Navigate.forward(
                context: context,
                screen: ViewSingleImage(
                  isDarkMode: darkMode,
                  url: chatMessage.lastChat.message,
                  tag: 'Random',
                ),
                type: PageTransitionType.fade,
              ),
              child: Container(
                height: size(context).width / 1.4,
                margin: EdgeInsets.only(
                  left: chatMessage.lastChat.senderModel.uid ==
                          currentUserModel.uid
                      ? size(context).width / 3
                      : size(context).width / 16,
                  right: chatMessage.lastChat.senderModel.uid !=
                          currentUserModel.uid
                      ? size(context).width / 3
                      : size(context).width / 16,
                  bottom: size(context).width / 60,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: size(context).width / 150,
                    color: chatMessage.lastChat.senderModel.uid ==
                            currentUserModel.uid
                        ? const Color(0x787261EF)
                        : darkMode == false
                            ? const Color(0x9EEEEEEE)
                            : const Color(0xF91D1C1C),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        chatMessage.lastChat.imgList[0]),
                  ),
                  borderRadius: BorderRadius.circular(size(context).width / 60),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size(context).width / 13,
                bottom: size(context).width / 30,
              ),
              child: Text(
                FormateDate(DateTime.now()).getText(),
                style: TextStyle(
                  fontSize: size(context).width / 30,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
