import 'package:chat_app/Screens/Notifcation/Widget/Tiles/accept.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/request.dart';
import 'package:flutter/material.dart';

class CustumeWidget extends StatelessWidget {
  final bool isDark;
  final int i;
  const CustumeWidget({Key key, this.isDark, @required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FriendRequestWidget(isDark: isDark, index: i);
  }
}

class FriendRequestWidget extends StatelessWidget {
  const FriendRequestWidget({
    Key key,
    @required this.isDark,
    @required this.index,
  }) : super(key: key);

  final bool isDark;
  final int index;
  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return RequestWidget(isDark: isDark);
        break;
      default:
        return AcceptedRequestWidget(isDark: isDark);
    }
  }
}
