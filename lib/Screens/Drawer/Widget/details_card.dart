import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Screens/Drawer/edit_profile.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/status_view.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    Key key,
    @required this.currentUserModel,
    this.isDark,
  }) : super(key: key);

  final CurrentUserModel currentUserModel;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatusRadius2(
          fromAsset: currentUserModel.profilepic == null,
          centerImageUrl:
              currentUserModel.profilepic ?? 'asset/background/not-found.png',
          unSeenColor: Styles.kPrimaryColor,
          radius: size(context).width / 5,
          padding: 7,
          numberOfStatus: 14,
          child: GestureDetector(
            onTap: () => Navigate.forward(
              context: context,
              type: PageTransitionType.rightToLeft,
              screen: EditProfile(isDark: isDark, userModel: currentUserModel),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(size(context).width / 40),
                decoration: BoxDecoration(
                  color: Styles.kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: size(context).width / 17,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size(context).width / 26),
        Text(
          textLimit(text: currentUserModel.username, max: 23),
          style: GoogleFonts.sanchez(
            fontSize: size(context).width / 17,
            letterSpacing: .8,
          ),
        ),
        SizedBox(height: size(context).width / 190),
        Text(
          textLimit(text: currentUserModel.email, max: 36),
          style: TextStyle(
              fontSize: size(context).width / 31, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
