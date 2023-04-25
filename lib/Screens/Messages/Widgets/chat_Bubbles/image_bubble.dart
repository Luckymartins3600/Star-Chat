import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/current_user.dart';
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
    CurrentUserModel senderModel =
        CurrentUserModel.fromMap(chatMessage.senderModel);
    if (chatMessage.imgList != null && chatMessage.imgList.length > 3) {
      return Container(
        height: size(context).width / 1.89,
        padding: EdgeInsets.all(size(context).width / 60),
        margin: EdgeInsets.only(
          left: senderModel.uid == currentUserModel.uid
              ? size(context).width / 4
              : size(context).width / 16,
          right: senderModel.uid != currentUserModel.uid
              ? size(context).width / 4
              : size(context).width / 16,
          bottom: size(context).width / 20,
        ),
        decoration: BoxDecoration(
          color: senderModel.uid == currentUserModel.uid
              ? Styles.kPrimaryColor
              : darkMode == false
                  ? const Color(0xFFEEEEEE)
                  : const Color(0x29757575),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(size(context).width / 50),
            bottomRight: Radius.circular(size(context).width / 50),
            topLeft: senderModel.uid == currentUserModel.uid
                ? Radius.circular(size(context).width / 50)
                : const Radius.circular(0),
            topRight: senderModel.uid != currentUserModel.uid
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
              ),
            );
          },
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => Navigate.forward(
          context: context,
          screen: ViewSingleImage(
            isDarkMode: darkMode,
            url: chatMessage.imgList[0],
          ),
          type: PageTransitionType.fade,
        ),
        child: Container(
          height: size(context).width / 1.4,
          margin: EdgeInsets.only(
            left: senderModel.uid == currentUserModel.uid
                ? size(context).width / 3
                : size(context).width / 16,
            right: senderModel.uid != currentUserModel.uid
                ? size(context).width / 3
                : size(context).width / 16,
            bottom: size(context).width / 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: size(context).width / 150,
              color: senderModel.uid != currentUserModel.uid
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
