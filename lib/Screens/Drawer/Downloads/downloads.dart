import 'dart:io';

import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/const.dart';

import '../../../Styles/theme.dart';
import '../../../Styles/style.dart';
import 'audio_sc.dart';
import 'file_sc.dart';
import 'links_sc.dart';
import 'media_sc.dart';
import 'voice_au.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
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
    return DefaultTabController(
      length: 5,
      child: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackButtonCB(),
              centerTitle: true,
              title: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: size(context).width / 40),
                width: size(context).width / 1.4,
                height: size(context).width / 10,
                decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? const Color(0xFFE6E6E6).withOpacity(0.1)
                      : const Color(0xFFE6E6E6).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(size(context).width / 20),
                ),
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: size(context).width / 20,
                        bottom:
                            Platform.isAndroid ? size(context).width / 40 : 0),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: themeChange.darkTheme
                          ? Styles.subtitleTxt
                          : Styles.black38,
                    ),
                  ),
                )),
              ),
              elevation: .4,
              shadowColor: Styles.white,
              bottom: TabBar(
                tabs: const [
                  Tab(text: 'Media'),
                  Tab(text: 'Links'),
                  Tab(text: 'Files'),
                  Tab(text: 'Music'),
                  Tab(text: 'Voice'),
                ],
                unselectedLabelColor:
                    themeChange.darkTheme ? Styles.white : Styles.black38,
                labelColor: Styles.kPrimaryColor,
                indicatorColor: Styles.kPrimaryColor,
              ),
            ),
            body: const TabBarView(
              children: [
                MediaSc(),
                LinkSc(),
                FileSc(),
                AudioSc(),
                VoiceAudioSc(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
