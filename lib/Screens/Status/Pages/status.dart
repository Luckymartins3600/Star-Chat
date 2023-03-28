import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Screens/Status/Pages/preview.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Styles/theme.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/status_view.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:faker/faker.dart';
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
    await getimages();
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  List<String> images = [];
  getimages() {
    for (var i = 0; i < Random().nextInt(100); i++) {
      images.add(
        faker.image.image(
          keywords: ['person'],
          random: true,
        ),
      );
    }
  }

  String url =
      'https://scontent-mrs2-2.xx.fbcdn.net/v/t39.30808-6/266494252_212958047695224_884558708221533173_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=rGTra_e_QxoAX8gT6Vm&_nc_ht=scontent-mrs2-2.xx&oh=00_AfAnZ1-uZGVcfTT4PclB90dodUXretIiVhrOv0Y1TGEZxQ&oe=64270B90';
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
                    flex: 14,
                    child: SizedBox(
                      width: size(context).width,
                      child: Column(
                        children: [
                          const Spacer(flex: 9),
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
                    child: GridView.builder(
                      itemCount: images.length,
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
                        return GestureDetector(
                          onTap: () => Navigate.forward(
                            context: context,
                            screen: const PreviewStatus(),
                            type: PageTransitionType.bottomToTop,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  index == 0 ? url : images[index],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                  size(context).width / 30),
                              color: themeChange.darkTheme
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
                                      : StatusRadius(
                                          padding: 1,
                                          numberOfStatus: Random().nextInt(6),
                                          unSeenColor: Styles.kPrimaryColor,
                                          radius: size(context).width / 19,
                                          centerImageUrl: faker.image.image(
                                              random: true,
                                              keywords: ['person']),
                                        ),
                                  Text(
                                    index == 0
                                        ? 'Add to Story'
                                        : faker.internet.userName(),
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
