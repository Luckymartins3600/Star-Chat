import 'package:chat_app/Screens/Drawer/Widget/details_card.dart';
import 'package:chat_app/Screens/Drawer/Widget/tile.dart';
import 'package:chat_app/func/file.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Screens/Drawer/theme.dart';
import 'package:chat_app/DataBase/firebase_service.dart';
import '../../Styles/theme.dart';
import '../../Styles/style.dart';
import '../../Utils/const.dart';
import 'blocked_users.dart';
import 'language_sc.dart';
import 'Downloads/downloads.dart';

final Uri url = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.apkgamesosomodguideandtips.sosomodapkgametipsandguide');

class DrawerScreen extends StatefulWidget {
  final CurrentUserModel value;
  const DrawerScreen({Key key, this.value}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  CurrentUserModel userModel;
  @override
  void initState() {
    userModel = widget.value;
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: themeChange.darkTheme ? Styles.black : Styles.white),
        centerTitle: true,
      ),
      // extendBodyBehindAppBar: true,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(auth.currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              userModel = CurrentUserModel.fromMap(snapshot.data.data());
            }
            return ChangeNotifierProvider(
              create: (_) {
                return themeChangeProvider;
              },
              child: Consumer<DarkThemeProvider>(
                  builder: (BuildContext context, value, Widget child) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: size(context).height - kToolbarHeight * 2.2),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          SizedBox(height: size(context).width / 40),
                          ProfileDetailsCard(
                            currentUserModel: userModel,
                            isDark: themeChange.darkTheme,
                          ),
                          const Spacer(flex: 3),
                          ProfileTile(
                            leadingIcon: MdiIcons.themeLightDark,
                            title: 'Dark Mode',
                            darkMode: themeChange.darkTheme,
                            onpressed: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const ThemeScreen(),
                                  type: PageTransitionType.rightToLeft),
                            ),
                          ),
                          ProfileTile(
                            leadingIcon: OMIcons.language,
                            title: 'Language',
                            darkMode: themeChange.darkTheme,
                            onpressed: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const LanguageScreen(),
                                  type: PageTransitionType.rightToLeft),
                            ),
                          ),
                          ProfileTile(
                            leadingIcon: MdiIcons.blockHelper,
                            darkMode: themeChange.darkTheme,
                            title: 'Blocked Users',
                            onpressed: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const BlockedUsers(),
                                  type: PageTransitionType.rightToLeft),
                            ),
                          ),
                          ProfileTile(
                            title: 'Downloads',
                            darkMode: themeChange.darkTheme,
                            onpressed: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: const Downloads(),
                                  type: PageTransitionType.rightToLeft),
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          ProfileTile(
                            title: 'Invite friends',
                            leadingIcon: Icons.share,
                            darkMode: themeChange.darkTheme,
                            onpressed: () => shareApp(),
                          ),
                          ProfileTile(
                            leadingIcon: Icons.logout,
                            title: 'Log Out',
                            hasArrow: false,
                            darkMode: themeChange.darkTheme,
                            trailingIconColor: Styles.red,
                            onpressed: () => FirebaseService().signOut(),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: size(context).width / 18,
                            child: Text(
                              'Version: 1.0',
                              style: TextStyle(
                                color: themeChange.darkTheme == false
                                    ? Styles.black38
                                    : Styles.subtitleTxt,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
