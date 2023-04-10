import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:chat_app/Utils/const.dart';

import '../../../Styles/style.dart';
import '../../Messages/Utils/format_date.dart';
import '../../../Utils/trim_text.dart';
import '../../Messages/Utils/url_luncher.dart';

class LinkSc extends StatefulWidget {
  const LinkSc({Key key}) : super(key: key);

  @override
  State<LinkSc> createState() => _LinkScState();
}

class _LinkScState extends State<LinkSc> {
  List<Map<String, dynamic>> links = List.generate(
    images.length,
    (index) => {
      'name': faker.internet.email(),
      'sender': faker.internet.userName(),
      'pic': faker.image.image(random: true),
      'link': 'https://flutter.dev',
      'timestamp': DateTime(
        2023,
        // int.parse('200${Random().nextInt(9)}'),
        int.parse('0${Random().nextInt(9)}'),
        int.parse('1${Random().nextInt(5)}'),
      )
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: links.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => urlLuncher(links[index]['link']),
            contentPadding: EdgeInsets.all(size(context).width / 40),
            leading: Container(
              height: size(context).width / 7,
              width: size(context).width / 7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(links[index]['pic']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(size(context).width / 40),
              ),
            ),
            title: Text(
              textLimit(text: links[index]['name'], max: 15, morecharacter: ''),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                textLimit(text: links[index]['link'], max: 50),
                style: TextStyle(
                    color: Styles.kPrimaryColor.withOpacity(.7),
                    fontSize: size(context).width / 28),
              ),
            ),
            trailing: Text(
              FormateDate(links[index]['timestamp'] as DateTime).getText(),
              style: const TextStyle(color: Styles.subtitleTxt),
            ),
            // horizontalTitleGap:5 ,
          );
        },
      ),
    );
  }
}
