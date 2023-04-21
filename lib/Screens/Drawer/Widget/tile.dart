import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Color trailingIconColor;
  final bool hasArrow, darkMode;
  final Function() onpressed;

  const ProfileTile({
    Key key,
    this.title = 'Title',
    this.leadingIcon,
    this.trailingIconColor,
    this.hasArrow = true,
    @required this.darkMode,
    @required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(

        left: size(context).width / 26,
      ),
      child: ListTile(
        onTap: onpressed,
        title: Text(
          title,
          style: const TextStyle(letterSpacing: .6),
        ),
        leading: Icon(
          leadingIcon ?? OMIcons.permMedia,
          color: trailingIconColor ??
              (darkMode == false ? Styles.black : Styles.white),
        ),
        horizontalTitleGap: size(context).width / 80,
        trailing: hasArrow != true
            ? const SizedBox()
            : Icon(
                Icons.arrow_forward_ios_rounded,
                color: darkMode == false ? Styles.black38 : Styles.subtitleTxt,
              ),
      ),
    );
  }
}
