import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrUserProfile extends StatefulWidget {
  final bool isDark;
  const GrUserProfile({Key key, @required this.isDark}) : super(key: key);

  @override
  State<GrUserProfile> createState() => _GrUserProfileState();
}

class _GrUserProfileState extends State<GrUserProfile> {
  String url = 'https://4kwallpapers.com/images/walls/thumbs_3t/10135.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButtonCB()),
      body:
          //  Column(
          //   children: [
          //     Expanded(
          //       flex: 6,
          //       child: Container(
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             width: .9,
          //             color: Styles.kPrimaryColor,
          //           ),
          //           borderRadius: BorderRadius.circular(size(context).width / 50),
          //           color: Colors.amber,
          //           image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image: CachedNetworkImageProvider(url),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 4,
          //       child: Container(
          //         // color: Colors.blue,
          //         child: Column(
          //           children: [
          //             ListTile(
          //               contentPadding: EdgeInsets.symmetric(
          //                 vertical: size(context).width / 30,
          //                 horizontal: size(context).width / 30,
          //               ),
          //               title: Text(
          //                 'Spider-Man',
          //                 style: TextStyle(
          //                   fontSize: size(context).width / 18,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               ),
          //               subtitle: Text(
          //                 'Software Developer',
          //                 style: TextStyle(
          //                   fontSize: size(context).width / 26,
          //                   color: Colors.grey,
          //                 ),
          //               ),
          //               trailing: SizedBox(
          //                 width: size(context).width / 3,
          //                 child: CupertinoButton(
          //                   padding: const EdgeInsets.symmetric(),
          //                   color: Styles.kPrimaryColor,
          //                   child: const Text('Add Friend'),
          //                   onPressed: () {},
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // )
          Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: size(context).width / 4,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: size(context).width / 1.6,
                    width: size(context).width,
                    margin: EdgeInsets.symmetric(
                      horizontal: size(context).width / 80,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(size(context).width / 40),
                      color: widget.isDark
                          ? const Color(0x25565656)
                          : const Color(0x21B3BBBE),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: size(context).width / 10),
                        Text(
                          'Spider-Man',
                          style: TextStyle(
                            fontSize: size(context).width / 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: size(context).width / 50),
                        Text(
                          'Software Developer',
                          style: TextStyle(
                            fontSize: size(context).width / 22,
                          ),
                        ),
                        SizedBox(height: size(context).width / 7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: size(context).width / 4,
                  top: size(context).width / 15,
                  child: Container(
                    height: size(context).width / 2.3,
                    width: size(context).width / 2,
                    decoration: BoxDecoration(
                      color: Styles.kPrimaryColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(url),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size(context).width,
              margin: EdgeInsets.symmetric(
                horizontal: size(context).width / 45,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size(context).width / 20,
                      horizontal: size(context).width / 30,
                    ),
                    decoration: BoxDecoration(
                      color: widget.isDark
                          ? const Color(0x25565656)
                          : const Color(0x21B3BBBE),
                      borderRadius:
                          BorderRadius.circular(size(context).width / 70),
                    ),
                    child: Text(
                      "What sets you apart can sometimes feel like a burden and it's not. And a lot of the time, it's what makes you great.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.4,
                        fontSize: size(context).width / 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size(context).width / 10,
                      vertical: size(context).width / 10,
                    ),
                    child: CupertinoButton(
                      color: Styles.kPrimaryColor,
                      child: const Text('Add Friend'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
