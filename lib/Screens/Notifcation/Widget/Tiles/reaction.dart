import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class StatusReactionWidget extends StatelessWidget {
  final bool isDark, isLike;
  const StatusReactionWidget(
      {Key key, @required this.isDark, this.isLike = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://scontent.fdxb1-1.fna.fbcdn.net/v/t39.30808-1/266494252_212958047695224_884558708221533173_n.jpg?stp=dst-jpg_p720x720&_nc_cat=110&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=hkiycPmD-JkAX8N42dt&_nc_ht=scontent.fdxb1-1.fna&oh=00_AfCuYmebICNq9SGgxBxj9cmbDmFawNMEiqkb6q2RokF7Kw&oe=643E3AAE';
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(url),
        radius: size(context).width / 15,
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: !isLike ? Colors.red : null,
            radius: size(context).width / 35,
            child: Padding(
              padding:
                  EdgeInsets.only(top: isLike ? 0 : size(context).width / 160),
              child: Icon(
                isLike ? CupertinoIcons.hand_thumbsup_fill : MdiIcons.heart,
                size: size(context).width / 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      title: Html(
        data:
            '<p><i><b>Lucky Flamze</b> ${isLike ? 'likes your' : 'reacted to your'} status</i></p>',
        style: {
          '*': Style(margin: Margins.only(bottom: 3)),
          'i': Style(letterSpacing: 1, fontStyle: FontStyle.normal),
        },
      ),
      subtitle: Text(
        timeago.format(DateTime(2023, 4, 17, 11)),
        style: TextStyle(
          color: Styles.kPrimaryColor.withOpacity(.9),
          fontSize: size(context).width / 32,
        ),
      ),
    );
  }
}
