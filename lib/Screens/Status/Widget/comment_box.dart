import 'package:chat_app/Screens/Status/Widget/button.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class CommentBox extends StatefulWidget {
  final Function() likedFunc;
  final Function() heartedFunc;
  final String senderName;
  final bool liked;

  const CommentBox({
    Key key,
    this.likedFunc,
    this.heartedFunc,
    @required this.senderName,
    @required this.liked,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // color: Colors.blue,
          height: size(context).width / 5,
          margin: EdgeInsets.symmetric(
            horizontal: size(context).width / 40,
            vertical: size(context).width / 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(widget.liked != null ? msg(widget.liked) : ''),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size(context).width / 20,
                        vertical: size(context).width / 31,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          size(context).width / 2,
                        ),
                      ),
                      child: const Text('Send Message'),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionButton(
                          onTap: widget.likedFunc,
                          icon: CupertinoIcons.hand_thumbsup_fill,
                          bgColor: Styles.kPrimaryColor,
                        ),
                        ActionButton(
                            icon: CupertinoIcons.heart_fill,
                            onTap: widget.heartedFunc),
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
    return '${like ? Emoji('like', '👍').code : Emoji('heart', '❤️').code} sent to ${widget.senderName} ';
  }
}
