import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_palette.dart';
import 'package:chat_app/Screens/Status/Pages/add_strories.dart';
import 'package:chat_app/Screens/Status/Pages/preview.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Styles/theme.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/status_view.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    super.initState();

    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  String url =
      'https://pbs.twimg.com/media/FkCNAVKXwAECeD7?format=jpg&name=4096x4096';
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeChange.darkTheme ? Colors.black : Colors.white,
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
                    flex: 13,
                    child: SizedBox(
                      width: size(context).width,
                      child: Column(
                        children: [
                          const Spacer(flex: 5),
                          Text(
                            'Stories',
                            style: TextStyle(
                                fontSize: size(context).width / 20,
                                letterSpacing: 1.1),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 75,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowIndicator();
                        return;
                      },
                      child: GridView.builder(
                        itemCount: status.length,
                        padding: EdgeInsets.symmetric(
                          vertical: size(context).width / 20,
                          horizontal: size(context).width / 40,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size(context).width / 2,
                          childAspectRatio: 2 / 2.8,
                          crossAxisSpacing: size(context).width / 35,
                          mainAxisSpacing: size(context).width / 35,
                        ),
                        itemBuilder: (context, index) {
                          final StoriesModel storiesModel =
                              status[index].stories[0];

                          return GestureDetector(
                            onTap: () => Navigate.forward(
                              context: context,
                              screen: index == 0
                                  ? AddStrory(
                                      isDark: themeChange.darkTheme,
                                      fromHome: true,
                                    )
                                  : PreviewStatus(status: status, index: index),
                              type: PageTransitionType.bottomToTop,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: .3,
                                  color: Colors.white,
                                ),
                                image: storiesModel.type == StoryType.IMAGE ||
                                        storiesModel.isbgimg
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          index == 0 ? url : storiesModel.bg,
                                        ),
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(
                                  size(context).width / 30,
                                ),
                                color: storiesModel.type == StoryType.TEXT &&
                                        !storiesModel.isbgimg
                                    ? bgcolors[int.parse(storiesModel.bg)]
                                    : themeChange.darkTheme
                                        ? Colors.white
                                        : Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size(context).width / 24,
                                    horizontal: size(context).width / 27),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    index == 0
                                        ? CircleAvatar(
                                            child: Icon(
                                              CupertinoIcons.add,
                                              size: size(context).width / 17,
                                            ),
                                          )
                                        : StatusRadius2(
                                            padding: 1,
                                            numberOfStatus: Random().nextInt(6),
                                            unSeenColor: Styles.kPrimaryColor,
                                            radius: size(context).width / 19,
                                            centerImageUrl: status[index]
                                                .userModel
                                                .profilepic,
                                          ),
                                    storiesModel.type == StoryType.TEXT
                                        ? Center(
                                            child: Text(
                                              textLimit(
                                                  text: storiesModel.msg,
                                                  max: 140),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : const SizedBox(),
                                    Text(
                                      index == 0
                                          ? 'Add to Story'
                                          : status[index].userModel.username,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size(context).width / 27,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
