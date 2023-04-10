import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../Model/Dummy/dummy_group.dart';
import '../../../Styles/style.dart';
import '../../../Styles/theme.dart';
import '../../../Utils/const.dart';
import '../../Messages/Widgets/search_bar.dart';
import '../Widgets/message_tile.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
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
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          {
            return Column(
              children: [
                Expanded(
                  flex: 21,
                  child: SizedBox(
                    width: size(context).width,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'Communities',
                          style: TextStyle(fontSize: size(context).width / 20),
                        ),
                        SearchWidget(isDarkMode: themeChange.darkTheme),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 73,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: dummyGroupRecentMessages.length,
                      padding:
                          EdgeInsets.only(bottom: size(context).width / 30),
                      itemBuilder: (context, index) {
                        return GroupMessageTile(
                          groupMessageModel: dummyGroupRecentMessages[index],
                          isDarkMode: themeChange.darkTheme,
                          groupInfo: GroupInfo(
                            name: 'The Getho Boy\'s',
                            uid: const Uuid().v1(),
                            profileUrl:
                                'https://firebasestorage.googleapis.com/v0/b/star-chat-87786.appspot.com/o/OSLJE9817.JPG?alt=media&token=b5f7b98a-dee1-49e5-b070-24aece7941c5',
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: size(context).width / 28),
        child: FloatingActionButton(
          heroTag: 'add_group_chat',
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Styles.white,
          ),
        ),
      ),
    );
  }
}
