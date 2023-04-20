import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timeago/timeago.dart' as timeago;

class AcceptedRequestWidget extends StatelessWidget {
  final bool isDark;
  final Color color;

  const AcceptedRequestWidget({Key key, @required this.isDark, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://scontent.fdxb1-1.fna.fbcdn.net/v/t39.30808-1/266494252_212958047695224_884558708221533173_n.jpg?stp=dst-jpg_p720x720&_nc_cat=110&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=hkiycPmD-JkAX8N42dt&_nc_ht=scontent.fdxb1-1.fna&oh=00_AfCuYmebICNq9SGgxBxj9cmbDmFawNMEiqkb6q2RokF7Kw&oe=643E3AAE';
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      tileColor: color,
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(url),
        radius: size(context).width / 15,
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: size(context).width / 35,
            child: Icon(Icons.person_rounded, size: size(context).width / 25),
          ),
        ),
      ),
      title: Html(
        data: '<p><i><b>Lucky Flamze</b> accepted your friend request.</i></p>',
        style: {
          '*': Style(margin: Margins.zero),
          'i': Style(letterSpacing: 1, fontStyle: FontStyle.normal),
        },
      ),
      subtitle: Text(
        timeago.format(DateTime(2023)),
        style: TextStyle(
          color: Styles.kPrimaryColor.withOpacity(.9),
          fontSize: size(context).width / 32,
        ),
      ),
    );
  }
}
