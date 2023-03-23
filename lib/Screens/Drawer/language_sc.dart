import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Styles/theme.dart';
import '../../Styles/style.dart';
import '../../Utils/const.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;
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
        centerTitle: true,
        title: const Text('Language'),
        elevation: .4,
        shadowColor: Styles.white,
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          return ListView.builder(
            itemCount: languagesls.length,
            padding: EdgeInsets.only(
              left: size(context).width / 40,
              top: size(context).width / 30,
              bottom: size(context).width / 20,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                trailing: selectedIndex == index
                    ? Padding(
                        padding: EdgeInsets.only(
                            bottom: size(context).width / 10,
                            right: size(context).width / 40),
                        child: const Icon(Icons.check,
                            color: Styles.kPrimaryColor),
                      )
                    : const SizedBox(),
                onTap: () => setState(() => selectedIndex = index),
                contentPadding:
                    EdgeInsets.symmetric(vertical: size(context).width / 40),
                title: Text(languagesls[index]['title']),
                // minVerticalPadding: -100,
                // dense: trs,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languagesls[index]['sub'],
                      style: TextStyle(
                          color: themeChange.darkTheme == true
                              ? Styles.subtitleTxt
                              : Styles.black38),
                    ),
                    SizedBox(height: size(context).width / 80),
                    const Divider(thickness: .08),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
