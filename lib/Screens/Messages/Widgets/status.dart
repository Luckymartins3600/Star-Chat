import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../../../Styles/style.dart';
import '../../../Utils/const.dart';
import '../../../Utils/status_view.dart';

class StatusWidget extends StatelessWidget {
  final bool isFirst, darkMode;
  const StatusWidget({Key key, @required this.isFirst, @required this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size(context).width / 45),
      child: StatusRadius(
        radius:
            isFirst ? size(context).width / 13.6 : size(context).width / 13.4,
        spacing: 15,
        strokeWidth: 1.6,
        indexOfSeenStatus: 5,
        numberOfStatus: isFirst ? 20 : 5,
        padding: 3,
        noImg: isFirst,
        centerImageUrl: isFirst
            ? faker.image.image(keywords: ['person'])
            : "https://picsum.photos/200/300",
        child: isFirst
            ? Icon(
                Icons.add,
                color: darkMode ? Styles.white : const Color(0x80000000),
              )
            : null,
      ),
    );
  }
}