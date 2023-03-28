import 'package:chat_app/Screens/Status/Widget/button.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  final Function() likedFunc;
  final Function() heartedFunc;
  const CommentBox({
    Key key,
    this.likedFunc,
    this.heartedFunc,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

int iconSize = 24;
validate() {}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: size(context).width / 8,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size(context).width / 20,
                    vertical: size(context).width / 31,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: size(context).width / 40,
                    vertical: size(context).width / 120,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38),
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
                  children: [
                    ActionButton(
                      onTap: widget.likedFunc,
                      icon: CupertinoIcons.hand_thumbsup_fill,
                      bgColor: Styles.kPrimaryColor,
                    ),
                    ActionButton(icon: CupertinoIcons.heart_fill, onTap: () {}),
                  ],
                ),
              ),
              SizedBox(width: size(context).width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
