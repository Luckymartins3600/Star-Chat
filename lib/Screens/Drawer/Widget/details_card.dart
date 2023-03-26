import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Screens/Drawer/edit_profile.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    Key key,
    @required this.currentUserModel,
  }) : super(key: key);

  final CurrentUserModel currentUserModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size(context).width / 20),
      child: SizedBox(
        width: size(context).width,
        height: size(context).width / 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            CircleAvatar(
              radius: size(context).width / 6.6,
              backgroundImage:
                  CachedNetworkImageProvider(currentUserModel.profilepic),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(
                    top: size(context).width / 190,
                    bottom: size(context).width / 70,
                  ),
                  decoration: BoxDecoration(
                    color: Styles.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.subtitleTxt),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size(context).width / 70),
                    child: Icon(
                      Icons.camera_alt,
                      size: size(context).width / 25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size(context).width / 14),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size(context).width / 40),
                Text(
                  currentUserModel.username,
                  style: TextStyle(
                    fontSize: size(context).width / 22,
                  ),
                ),
                SizedBox(height: size(context).width / 90),
                Text(
                  currentUserModel.email,
                  style: TextStyle(
                    fontSize: size(context).width / 33,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: size(context).width / 20),
                  child: SizedBox(
                    height: size(context).width / 10,
                    child: CupertinoButton.filled(
                      padding: EdgeInsets.symmetric(
                        horizontal: size(context).width / 13,
                      ),
                      onPressed: () => Navigate.forward(
                        context: context,
                        type: PageTransitionType.rightToLeft,
                        screen: const EditProfile(),
                      ),
                      child: const Text('Edit Profile'),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
