import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Screens/auth/utils.dart';
import 'package:chat_app/func/firebase_service.dart';

import '../../Styles/style.dart';
import 'Widgets/loading_dot.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  int currentindex = 0;
  CarouselController carouselController = CarouselController();
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: defaultTransparentAppBar(bottom: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: size(context).width,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  CarouselSlider(
                    carouselController: carouselController,
                    disableGesture: true,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {},
                        scrollPhysics: const NeverScrollableScrollPhysics()),
                    items: imgList
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: size(context).width,
                            height: size(context).height,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  imgList[currentindex],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const Spacer(),
                  Text(
                    introDetails[currentindex]['title'],
                    style: TextStyle(
                      fontSize: size(context).width / 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .7,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      introDetails[currentindex]['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          wordSpacing: 2,
                          fontSize: size(context).width / 25,
                          height: size(context).width / 330),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dotDesign(currentindex == 0, context),
                      dotDesign(currentindex == 1, context),
                      dotDesign(currentindex == 2, context),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: size(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(flex: 2),
                  currentindex == 2
                      ? button(
                          'Get Started',
                          false,
                        )
                      : button(
                          'Next',
                          false,
                        ),
                  const Spacer(),
                  currentindex == 0
                      ? SizedBox(height: size(context).width / 8)
                      : button('Back', true),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  button(
    String text,
    bool istransparent,
  ) {
    setState(() {});
    return CupertinoButton(
      color: istransparent == false ? Styles.kPrimaryColor : Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: currentindex == 2
            ? size(context).width / 4
            : size(context).width / 3,
        vertical: size(context).width / 25,
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: Styles.kdefaultFamily, letterSpacing: .9),
      ),
      onPressed: () => navfunc(
        istransparent == true,
        currentindex == 2,
      ),
    );
  }

  navfunc(
    bool isback,
    bool onconplete,
  ) async {
    if (isback == false && onconplete == true) {
      if (ispressed == false) {
        FirebaseService firebaseService = FirebaseService();
        setState(() => ispressed = true);
        await firebaseService.signInWithGoogle();
      }
    }
    if (isback) {
      setState(() {
        currentindex--;
        currentindex < 0 ? currentindex = 0 : null;
        carouselController.previousPage();
      });
    } else {
      if (currentindex < 2) {
        setState(() {
          currentindex++;
        });
        carouselController.nextPage();
      }
    }
  }
}
