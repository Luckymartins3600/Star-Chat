import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class GroupDetais extends StatelessWidget {
  final GroupInfo groupInfo;
  final bool isDark;
  const GroupDetais({Key key, @required this.groupInfo, @required this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(faker.lorem.sentences(4));
    return Column(
      children: [
        Container(
          height: size(context).width / 3,
          width: size(context).width / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(groupInfo.profileUrl),
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: Styles.kPrimaryColor,
              width: 2,
            ),
          ),
        ),
        SizedBox(height: size(context).width / 40),
        Text(
          groupInfo.name,
          style: TextStyle(
            fontSize: size(context).width / 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.public,
                size: size(context).width / 25,
                color: Styles.kPrimaryColor,
              ),
            ),
            Text(
              'Public group • 1.5M members',
              style: TextStyle(
                fontSize: size(context).width / 30,
                color: isDark ? Colors.white70 : Colors.grey,
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size(context).width / 30,
              vertical: size(context).width / 50,
            ),
            child: Text(
              'Id volutpat lacus laoreet non curabitur gravida arcu ac, Sed vulputate odio ut enim. gravida arcu ac, Sed vulputate odio ut enim.'
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.35),
            ),
          ),
        ),
      ],
    );
  }
}
