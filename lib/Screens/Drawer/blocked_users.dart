import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/const.dart';

import '../../Styles/theme.dart';
import '../../Styles/style.dart';
import '../../Utils/trim_text.dart';

class BlockedUsers extends StatefulWidget {
  const BlockedUsers({Key key}) : super(key: key);

  @override
  State<BlockedUsers> createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  List<Map<String, dynamic>> users = List.generate(
    Random().nextInt(100),
    (index) => {
      'name': faker.internet.userName(),
      'email': faker.internet.email(),
      'pic': faker.image.image(random: true),
    },
  );
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
        title: const Text('Blocked Users'),
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
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: size(context).width / 53,
                  horizontal: size(context).width / 40,
                ),
                leading: CircleAvatar(
                  backgroundColor: Styles.kPrimaryColor,
                  radius: size(context).width / 16,
                  backgroundImage:
                      CachedNetworkImageProvider(users[index]['pic']),
                ),
                title: Text(textLimit(text: users[index]['name'], max: 20)),
                subtitle: Text(
                  textLimit(text: users[index]['email'], max: 20),
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Styles.subtitleTxt
                          : Styles.black38),
                ),
                trailing: trailingButton('Unblock'),
              );
            },
          );
        }),
      ),
    );
  }

  Widget trailingButton(String text) {
    return SizedBox(
      height: size(context).width / 10.5,
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(
          horizontal: size(context).width / 16,
        ),
        borderRadius: BorderRadius.circular(size(context).width / 20),
        color: Styles.kPrimaryColor,
        child: Text(text),
        onPressed: () {},
      ),
    );
  }
}
