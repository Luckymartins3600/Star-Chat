import 'package:chat_app/Screens/Notifcation/Widget/notitication_tile.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final bool isDark;
  const Notifications({Key key, this.isDark}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(icon: Icons.close),
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: Text(
          'Notification',
          style: TextStyle(fontSize: size(context).width / 18),
        ),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
        actions: [
          CupertinoButton(
            child: const Text('Mark all as read'),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: size(context).width / 40,
          right: size(context).width / 40,
          top: size(context).width / 20,
          bottom: size(context).width / 6,
        ),
        itemBuilder: (context, i) => CustumeWidget(
          isDark: widget.isDark,
          i: i,
          color: i.isOdd ? Styles.kPrimaryColor.withOpacity(.4) : null,
        ),
        separatorBuilder: (context, index) => Divider(
          color: const Color(0x25787777),
          height: size(context).width / 30,
        ),
        itemCount: 11,
      ),
    );
  }
}
