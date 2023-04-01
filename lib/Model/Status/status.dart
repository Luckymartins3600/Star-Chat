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

List<StatusModel> status = [
  StatusModel(
    userModel: CurrentUserModel(
      username: faker.address.person.firstName(),
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    stories: [
      StoriesModel(
        type: StoryType.IMAGE,
        bg: 'https://images.pexels.com/photos/14898760/pexels-photo-14898760.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: 'https://images.pexels.com/photos/14737351/pexels-photo-14737351.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isbgimg: true,
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: Random().nextInt(14).toString(),
        isbgimg: false,
      ),
    ],
  ),
  StatusModel(
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
  ),
  StatusModel(
    userModel: CurrentUserModel(
      username: faker.address.person.firstName(),
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    stories: [
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: 'https://images.pexels.com/photos/5199173/pexels-photo-5199173.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isbgimg: true,
      ),
      StoriesModel(
        type: StoryType.IMAGE,
        bg: 'https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&w=800',
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: Random().nextInt(14).toString(),
        isbgimg: false,
      ),
    ],
  ),
  StatusModel(
    userModel: CurrentUserModel(
      username: faker.address.person.firstName(),
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: 'https://images.pexels.com/photos/3750768/pexels-photo-3750768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    stories: [
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: Random().nextInt(14).toString(),
        isbgimg: false,
      ),
      StoriesModel(
        type: StoryType.IMAGE,
        bg: 'https://images.pexels.com/photos/7984828/pexels-photo-7984828.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: 'https://images.pexels.com/photos/3178786/pexels-photo-3178786.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        isbgimg: true,
      ),
    ],
  ),
  StatusModel(
    userModel: CurrentUserModel(
      username: faker.address.person.firstName(),
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    stories: [
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: 'https://images.pexels.com/photos/13619263/pexels-photo-13619263.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load',
        isbgimg: true,
      ),
      StoriesModel(
        type: StoryType.IMAGE,
        bg: 'https://images.pexels.com/photos/4909269/pexels-photo-4909269.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load',
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: Random().nextInt(14).toString(),
        isbgimg: false,
      ),
    ],
  ),
  StatusModel(
    userModel: CurrentUserModel(
      username: faker.address.person.firstName(),
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic:
          'https://images.pexels.com/photos/9783372/pexels-photo-9783372.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load',
    ),
    stories: [
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: 'https://images.pexels.com/photos/12351694/pexels-photo-12351694.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load',
        isbgimg: true,
      ),
      StoriesModel(
        type: StoryType.IMAGE,
        bg: 'https://images.pexels.com/photos/4909474/pexels-photo-4909474.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load',
      ),
      StoriesModel(
        msg: quotes[Random().nextInt(10)],
        type: StoryType.TEXT,
        bg: Random().nextInt(14).toString(),
        isbgimg: false,
      ),
    ],
  ),
];
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
