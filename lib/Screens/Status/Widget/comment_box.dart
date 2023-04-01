import 'package:chat_app/Screens/Status/Widget/button.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class CommentBox extends StatelessWidget {
  final Function() likedFunc;
  final Function() heartedFunc;
  final Function() onTap;
  final String senderName;
  final bool liked;
  final TextEditingController controller;

  const CommentBox({
    Key key,
    this.likedFunc,
    this.heartedFunc,
    this.onTap,
    this.controller,
    @required this.senderName,
    @required this.liked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size(context).width / 40,
            vertical: size(context).width / 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(liked != null ? msg(liked) : ''),
              SizedBox(height: size(context).width / 50),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size(context).width / 34,
                            horizontal: size(context).width / 24,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xC4000000),
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.circular(size(context).width / 2),
                          ),
                           child: 
                           Text(
                            'Send Message',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionButton(
                          onTap: likedFunc,
                          icon: CupertinoIcons.hand_thumbsup_fill,
                          bgColor: Styles.kPrimaryColor,
                        ),
                        ActionButton(
                            icon: CupertinoIcons.heart_fill,
                            onTap: heartedFunc),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String msg(bool like) {
    return '${like ? Emoji('like', '👍').code : Emoji('heart', '❤️').code} sent to $senderName ';
  }
}
