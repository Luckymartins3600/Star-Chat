import 'dart:math';

import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StatusModel {
  CurrentUserModel userModel;

  List<StoriesModel> stories;

  StatusModel({
    @required this.userModel,
    @required this.stories,
  });
}

class StoriesModel {
  StoryType type;
  String bg, msg;

  bool isbgimg;
  StoriesModel({
    this.bg,
    this.msg,
    this.isbgimg = false,
    @required this.type,
  });
}

List<StatusModel> status = List.generate(
  7,
  (index) {
    return StatusModel(
      userModel: CurrentUserModel(
        username: faker.address.person.firstName(),
        uid: const Uuid().v1(),
        email: faker.internet.email(),
        profilepic: faker.image.image(),
      ),
      stories: [
        StoriesModel(
          type: StoryType.IMAGE,
          bg: faker.image.image(keywords: ['post', 'person'], random: true),
        ),
        StoriesModel(
          msg: quotes[Random().nextInt(10)],
          type: StoryType.TEXT,
          bg: faker.image.image(keywords: ['dark', 'background'], random: true),
          isbgimg: true,
        ),
        StoriesModel(
          msg: quotes[Random().nextInt(10)],
          type: StoryType.TEXT,
          bg: Random().nextInt(14).toString(),
          isbgimg: false,
        ),
      ],
    );
  },
);
List<String> quotes = [
  "Don't count the days, make the days count. https://youtu.be/_9LJRY5R_sI",
  "Believe you can and you're halfway there.",
  "Be the change you wish to see in the world.",
  "Dream big and dare to fail.",
  "In three words I can sum up everything I've learned about life: it goes on.",
  "The only way to do great work is to love what you do.",
  "Happiness is not something ready made. It comes from your own actions.",
  "Success is not final, failure is not fatal: it is the courage to continue that counts.",
  "The best way to predict your future is to create it.",
  "You miss 100% of the shots you don't take. https://youtu.be/_9LJRY5R_sI"
];
