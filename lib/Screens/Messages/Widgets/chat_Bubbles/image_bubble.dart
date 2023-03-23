import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/multiimages.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/single_image.dart';
import '../../../../Model/Chat/chat.dart';
import '../../../../Model/user_model.dart';
import '../../../../Styles/style.dart';
import '../../../../Utils/const.dart';
import '../../../../func/navigate.dart';

class ImageBubble extends StatelessWidget {
  final ChatModel chatMessage;
  final bool darkMode;
  const ImageBubble(
      {Key key, @required this.chatMessage, @required this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatMessage.imgList != null && chatMessage.imgList.length > 3) {
      return GestureDetector(
        onTap: () => Navigate.forward(
          context: context,
          screen: ViewMultipleImage(
            isDarkMode: darkMode,
            images: chatMessage.imgList,
          ),
          type: PageTransitionType.rightToLeft,
        ),
        child: Container(
          height: size(context).width / 1.89,
          padding: EdgeInsets.all(size(context).width / 60),
          margin: EdgeInsets.only(
            left: chatMessage.senderModel.uid == currentUserModel.uid
                ? size(context).width / 4
                : size(context).width / 16,
            right: chatMessage.senderModel.uid != currentUserModel.uid
                ? size(context).width / 4
                : size(context).width / 16,
            bottom: size(context).width / 20,
          ),
          decoration: BoxDecoration(
            color: chatMessage.senderModel.uid == currentUserModel.uid
                ? Styles.kPrimaryColor
                : darkMode == false
                    ? const Color(0xFFEEEEEE)
                    : const Color(0x29757575),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size(context).width / 50),
              bottomRight: Radius.circular(size(context).width / 50),
              topLeft: chatMessage.senderModel.uid == currentUserModel.uid
                  ? Radius.circular(size(context).width / 50)
                  : const Radius.circular(0),
              topRight: chatMessage.senderModel.uid != currentUserModel.uid
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
                    image:
                        CachedNetworkImageProvider(chatMessage.imgList[index]),
                  ),
                  borderRadius: BorderRadius.circular(size(context).width / 60),
                ),
                child: chatMessage.imgList.length > 4 && index == 3
                    ? Center(
                        child: Text(
                        '+ ${chatMessage.imgList.length - 4}',
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
      );
    } else {
      return GestureDetector(
        onTap: () => Navigate.forward(
          context: context,
          screen: ViewSingleImage(
            isDarkMode: darkMode,
            url: chatMessage.message,
            tag: 'Random',
          ),
          type: PageTransitionType.fade,
        ),
        child: Container(
          height: size(context).width / 1.4,
          margin: EdgeInsets.only(
            left: chatMessage.senderModel.uid == currentUserModel.uid
                ? size(context).width / 3
                : size(context).width / 16,
            right: chatMessage.senderModel.uid != currentUserModel.uid
                ? size(context).width / 3
                : size(context).width / 16,
            bottom: size(context).width / 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: size(context).width / 150,
              color: chatMessage.senderModel.uid != currentUserModel.uid
                  ? const Color(0x787261EF)
                  : darkMode == false
                      ? const Color(0x9EEEEEEE)
                      : const Color(0xF91D1C1C),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(chatMessage.imgList[0]),
            ),
            borderRadius: BorderRadius.circular(size(context).width / 60),
          ),
        ),
      );
    }
  }
}
