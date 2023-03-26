import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/const.dart';

import '../../Styles/theme.dart';
import '../../Styles/style.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  DarkThemeProvider themeChange;
  int selectLs = 0;
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();

    selectLs = themeChangeProvider.darkTheme == true ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        title: const Text('Dark Mode'),
        elevation: .4,
        shadowColor: Styles.white,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom:
                themeChange.darkTheme ? const Color(0xFF000000) : Styles.white),
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          return Padding(
            padding: EdgeInsets.all(size(context).width / 30),
            child: Column(
              children: [
                Text(
                  'Dark mode is a color scheme that uses light-colored text, icons, and graphical user interface elements on a dark background.',
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: .6,
                    color: themeChange.darkTheme == true
                        ? Styles.subtitleTxt
                        : const Color.fromARGB(166, 36, 33, 33),
                    fontSize: size(context).width / 27,
                  ),
                ),
                SizedBox(height: size(context).width / 20),
                ListTile(
                  onTap: () {
                    setState(() {
                      themeChange.darkTheme = true;
                      selectLs = 0;
                    });
                  },
                  title: const Text('On '),
                  leading: radio(selectLs == 0, themeChange),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      themeChange.darkTheme = false;
                      selectLs = 1;
                    });
                  },
                  title: const Text('Off'),
                  leading: radio(selectLs == 1, themeChange),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

Widget radio(bool selected, DarkThemeProvider themeChange) {
  return Icon(
    selected == true
        ? Icons.radio_button_checked_rounded
        : Icons.radio_button_unchecked_rounded,
    color: selected == true
        ? Styles.kPrimaryColor
        : themeChange.darkTheme
            ? Styles.subtitleTxt
            : Styles.black38,
  );
}
