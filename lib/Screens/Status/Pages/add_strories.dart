// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Screens/Status/Pages/Post/Text/text.dart';
import 'package:chat_app/Screens/Status/Pages/Post/video/details.dart';
import 'package:chat_app/Screens/Status/Widget/story_container.dart';
import 'package:chat_app/Screens/nav.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/pick_img.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';

class AddStrory extends StatefulWidget {
  final bool isDark;
  final bool fromHome;
  const AddStrory({Key key, @required this.isDark, @required this.fromHome})
      : super(key: key);
  @override
  State<AddStrory> createState() => _AddStroryState();
}

class _AddStroryState extends State<AddStrory> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: BackButtonCB(
            onTap: !widget.fromHome
                ? () => Navigate.forward(
                    context: context, screen: const NavScreen())
                : null),
        centerTitle: true,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Add Strory'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: StoryContainer(
                onTap: () => Navigate.forward(
                  context: context,
                  screen: TextStatus(isDark: widget.isDark),
                ),
                index: 1,
              )),

              // Expanded(
              //     child: StoryContainer(
              //   index: 2,
              //   onTap: () => {},
              // )),
              Expanded(
                  child: StoryContainer(
                index: 3,
                onTap: () => imagePicker(
                  context: context,
                  key: scaffoldKey,
                  isDark: widget.isDark,
                  cam: () => callBack(1),
                  gal: () => callBack(2),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  callBack(int i) async {
    await pickImage(i, context).then((value) {
      if (value != null) {
        Navigate.forward(
          context: context,
          screen: PhotoDetails(
            path: value.path,
            isDark: widget.isDark,
          ),
        );
      }
    });
  }
}
