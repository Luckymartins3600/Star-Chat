import 'dart:math';

import 'package:chat_app/Screens/Notifcation/Widget/Tiles/accept.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/announcement.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/friends_status.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/reaction.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/request.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/status.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/status_view_count.dart';
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
      case 0:
        return RequestWidget(isDark: isDark);
        break;
      case 1:
        return AnnounceMentWidget(isDark: isDark);
        break;
      case 2:
        return AcceptedRequestWidget(isDark: isDark);
      case 3:
        return FriendsStatusWidget(isDark: isDark);
      case 4:
        return StatusViewsWidget(isDark: isDark);
      case 5:
        return UploadStatusWidget(isDark: isDark);
      default:
        return StatusReactionWidget(
          isDark: isDark,
          isLike: Random().nextBool(),
        );
    }
  }
}
