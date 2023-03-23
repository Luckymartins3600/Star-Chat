import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/const.dart';
import '../../../Model/Dummy/dummy_sgchat.dart';
import '../../../Styles/style.dart';
import '../../../Styles/theme.dart';
import '../Widgets/MessageTile/message_tile.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/status.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
                            'Message',
                            style:
                                TextStyle(fontSize: size(context).width / 20),
                          ),
                          SearchWidget(isDarkMode: themeChange.darkTheme),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 73,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return false;
                      },
                      child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: recentMessageList.length,
                        padding:
                            EdgeInsets.only(bottom: size(context).width / 30),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container(
                              padding: EdgeInsets.only(
                                left: size(context).width / 40,
                                bottom: size(context).width / 90,
                              ),
                              height: size(context).width / 5,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return StatusWidget(
                                    isFirst: index == 0,
                                    darkMode: themeChange.darkTheme,
                                  );
                                },
                              ),
                            );
                          }

                          return MessageTile(
                            index: index,
                            isDarkMode: themeChange.darkTheme,
                            messageModel: recentMessageList[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: size(context).width / 28),
        child: FloatingActionButton(
          heroTag: 'add_message',
          onPressed: () {},
          child: const Icon(
            Icons.person_add_rounded,
            color: Styles.white,
          ),
        ),
      ),
    );
  }
}
