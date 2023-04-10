import 'package:chat_app/Screens/Status/Pages/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Utils/const.dart';

import '../Styles/theme.dart';
import '../Styles/style.dart';
import 'GroupScreen/Screens/home.dart';
import 'Messages/Utils/nav_icon.dart';
import '../func/firebase_service.dart';
import 'Drawer/drawer_screen.dart';
import 'Messages/Screens/messages_sc.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  CurrentUserModel userModel;
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getUserDetails();

    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  int currentindex = 1;
  List<Widget> title = [
    const GroupChatScreen(),
    const MessageScreen(),
    const StatusScreen(),
  ];
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  openDrawer() {
    key.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      key: key,
      appBar: AppBar(
        // actions: [I],
        systemOverlayStyle: defaultTransparentAppBar(
          bottom: themeChange.darkTheme ? Colors.black : Styles.white,
        ),
        leading: GestureDetector(
            onTap: () => openDrawer(),
            child: const Icon(Icons.filter_list_rounded)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      drawer: DrawerScreen(value: userModel),
      body: Center(child: title[currentindex]),
      bottomNavigationBar: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            {
              return BottomAppBar(
                // color: Colors.red,
                // color: themeChange.darkTheme
                //     ? const Color(0xC2171717)
                //     : Styles.white,
                shape: const CircularNotchedRectangle(),
                notchMargin: 8.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    navcIconCard(
                      iconData: Icons.groups_rounded,
                      size: size,
                      color: currentindex == 0
                          ? Styles.kPrimaryColor
                          : themeChange.darkTheme
                              ? Styles.white
                              : Styles.black,
                      isSelected: false,
                      onPressed: () => setState(() => currentindex = 0),
                      value: userModel,
                    ),
                    SizedBox(width: size.width / 23),
                    navcIconCard(
                      iconData: Icons.whatshot_outlined,
                      size: size,
                      isSelected: false,
                      color: currentindex == 2
                          ? Styles.kPrimaryColor
                          : themeChange.darkTheme
                              ? Styles.white
                              : Styles.black,
                      onPressed: () => setState(
                        () => currentindex = 2,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.kPrimaryColor,
        child: Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: Styles.white,
          size: size.width / 16,
        ),
        onPressed: () => setState(() => currentindex = 1),
      ),
    );
  }

  void getUserDetails() async {
    await FirebaseService()
        .getcurrentUserdetails()
        .then((valuex) => setState(() => userModel = valuex));
  }
}
