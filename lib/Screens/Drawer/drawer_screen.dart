import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Screens/Drawer/edit_profile.dart';
import 'package:chat_app/Screens/Drawer/theme.dart';
import 'package:chat_app/func/firebase_service.dart';
import 'package:url_launcher/url_launcher.dart';
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

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: themeChange.darkTheme ? Styles.black : Styles.white),
        centerTitle: true,
        title: const Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          SizedBox(
            width: size(context).width / 35,
          )
        ],
      ),
      body: ChangeNotifierProvider(
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size(context).width / 20),
                      child: SizedBox(
                        width: size(context).width,
                        height: size(context).width / 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(flex: 1),
                            CircleAvatar(
                              radius: size(context).width / 6.6,
                              backgroundImage: CachedNetworkImageProvider(
                                  widget.value.profilepic),
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
                                    border:
                                        Border.all(color: Styles.subtitleTxt),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        size(context).width / 70),
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
                                  widget.value.username,
                                  style: TextStyle(
                                    fontSize: size(context).width / 22,
                                  ),
                                ),
                                SizedBox(height: size(context).width / 90),
                                Text(
                                  widget.value.email,
                                  style: TextStyle(
                                    fontSize: size(context).width / 33,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size(context).width / 20),
                                  child: SizedBox(
                                    height: size(context).width / 10,
                                    child: CupertinoButton.filled(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size(context).width / 13,
                                      ),
                                      child: const Text('Edit Profile'),
                                      onPressed: () => Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const EditProfile(),
                                            type:
                                                PageTransitionType.rightToLeft),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(flex: 6),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    tile(
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
                    tile(
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
                    tile(
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
                    tile(
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
                    tile(
                        title: 'Invite friends',
                        leadingIcon: Icons.share,
                        darkMode: themeChange.darkTheme,
                        onpressed: () => shareApp()),
                    tile(
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
      ),
    );
  }

  Widget tile(
      {String title = 'Title',
      IconData leadingIcon,
      Color trailingIconColor,
      bool hasArrow = true,
      Future Function() onpressed,
      bool darkMode}) {
    return Padding(
      padding: EdgeInsets.only(
        top: size(context).width / 200,
        left: size(context).width / 39,
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

  Future<void> openUri() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  shareApp() async {
    await Share.share(
        "Hey, I'm using chat_app to chat. Join me! Download it here: https://telegram.org/dl");
  }
}
