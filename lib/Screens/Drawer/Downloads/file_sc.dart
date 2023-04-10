import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/const.dart';

import '../../../Styles/style.dart';
import '../../Messages/Utils/format_date.dart';
import '../../../Utils/trim_text.dart';
import '../../Messages/Utils/url_luncher.dart';

class FileSc extends StatefulWidget {
  const FileSc({Key key}) : super(key: key);

  @override
  State<FileSc> createState() => _FileScState();
}

class _FileScState extends State<FileSc> {
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

  //  DOWNLOAD FILE ONTAP
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: links.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => urlLuncher(links[index]['link']),
            contentPadding: EdgeInsets.symmetric(
                vertical: size(context).width / 170,
                horizontal: size(context).width / 50),
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
              textLimit(text: 'File Name', max: 15, morecharacter: ''),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_downward_rounded,
                    color: Styles.kPrimaryColor,
                    size: size(context).width / 26,
                  ),
                  SizedBox(width: size(context).width / 80),
                  Text(
                    '10.MB',
                    style: TextStyle(
                        color: Styles.kPrimaryColor.withOpacity(.8),
                        fontSize: size(context).width / 28),
                  ),
                  Text(
                    ' • ',
                    style: TextStyle(
                        color: Styles.kPrimaryColor.withOpacity(.7),
                        fontSize: size(context).width / 28),
                  ),
                  sender(index)
                ],
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

  sender(int index) {
    return index.isEven
        ? Text(
            'Sender Name',
            style: TextStyle(
                color: Styles.kPrimaryColor,
                fontSize: size(context).width / 28),
          )
        : Row(
            children: [
              Text(
                'You',
                style: TextStyle(
                  color: Styles.kPrimaryColor.withOpacity(.8),
                  fontSize: size(context).width / 32,
                ),
              ),
              SizedBox(width: size(context).width / 180),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Styles.kPrimaryColor,
                size: size(context).width / 35,
              ),
              SizedBox(width: size(context).width / 130),
              Text(
                'Reciver Name',
                style: TextStyle(
                  color: Styles.kPrimaryColor,
                  fontSize: size(context).width / 32,
                ),
              ),
            ],
          );
  }
}
