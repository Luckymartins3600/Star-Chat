import 'package:chat_app/Screens/Notifcation/Widget/notitication_tile.dart';
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
        itemBuilder: (context, i) => CustumeWidget(isDark: widget.isDark, i: i),
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0x46838383)),
        itemCount: 11,
      ),
    );
  }
}
