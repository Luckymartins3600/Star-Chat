import 'dart:io';

import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/discard_dialog.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoDetails extends StatefulWidget {
  final String path;
  final bool isDark;
  const PhotoDetails({Key key, @required this.path, @required this.isDark})
      : super(key: key);

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          await onDiscard(scaffoldKey, context, widget.isDark),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          foregroundColor: Colors.white,
          leading: BackButtonCB(
            icon: Icons.close_rounded,
            onTap: () => onDiscard(scaffoldKey, context, widget.isDark),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.file(
                File(widget.path),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size(context).width / 9,
                horizontal: size(context).width / 30,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                  pressedOpacity: .7,
                  color: Styles.kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: size(context).width / 14),
                  onPressed: () {},
                  child: const Text(
                    'Share',
                    style: TextStyle(letterSpacing: .1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
