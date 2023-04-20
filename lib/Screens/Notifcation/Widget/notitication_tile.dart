import 'dart:math';

import 'package:chat_app/Screens/Notifcation/Widget/Tiles/accept.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/announcement.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/friends_status.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/reaction.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/request.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/status.dart';
import 'package:chat_app/Screens/Notifcation/Widget/Tiles/status_view_count.dart';
import 'package:flutter/material.dart';

// class CustumeWidget extends StatelessWidget {
//   final bool isDark;
//   final int i;
//   final Color color;
//   const CustumeWidget({Key key, this.isDark, @required this.i, this.color})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FriendRequestWidget(isDark: isDark, index: i);
//   }
// }

class CustumeWidget extends StatelessWidget {
  const CustumeWidget({
    Key key,
    @required this.isDark,
    @required this.i,
    this.color,
  }) : super(key: key);

  final bool isDark;
  final int i;
  final Color color;
  @override
  Widget build(BuildContext context) {
    switch (i) {
      case 0:
        return RequestWidget(isDark: isDark, color: color);
        break;
      case 1:
        return AnnounceMentWidget(isDark: isDark, color: color);
        break;
      case 2:
        return AcceptedRequestWidget(isDark: isDark, color: color);
      case 3:
        return FriendsStatusWidget(isDark: isDark, color: color);
      case 4:
        return StatusViewsWidget(isDark: isDark, color: color);
      case 5:
        return UploadStatusWidget(isDark: isDark, color: color);
      default:
        return StatusReactionWidget(
          isDark: isDark,
          isLike: Random().nextBool(),
          color: color,
        );
    }
  }
}
