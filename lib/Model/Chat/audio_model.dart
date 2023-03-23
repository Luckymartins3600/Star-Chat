import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AudioModel {
  String name, size, url, sendername;
  DateTime timeStamp;
  bool isplaying, paused;
  AudioModel({
    @required this.name,
    @required this.size,
    @required this.url,
    @required this.timeStamp,
    @required this.sendername,
    @required this.isplaying,
    this.paused = false,
  });
}

List<AudioModel> audiofiles = [
  AudioModel(
    name: 'Zlatan - Let Be There Light ft Seyi',
    size: '2.59MB',
    url:
        'https://cdn.trendybeatz.com/audio/Zlatan-Ft-Seyi-Vibez-Let-Be-There-Light-(TrendyBeatz.com).mp3',
    timeStamp: DateTime.now(),
    sendername: faker.internet.userName(),
    isplaying: false,
  ),
  AudioModel(
    name: 'Zlatan - Money ft Davido ',
    size: '300.6KB',
    url:
        'https://cdn.trendybeatz.com/audio/Zlatan-Ft-Davido-Money-(TrendyBeatz.com).mp3',
    timeStamp: DateTime(2023, 02, 13, 03),
    isplaying: false,
    sendername: faker.internet.userName(),
  ),
  AudioModel(
    name: 'Zlatan - Astalavista ft Young Jonn',
    size: '3MB',
    url:
        'https://cdn.trendybeatz.com/audio/Zlatan-Ft-Young-Jonn-Astalavista-(TrendyBeatz.com).mp3',
    timeStamp: DateTime(2023, 02, 14),
    isplaying: false,
    sendername: faker.internet.userName(),
  ),
  AudioModel(
    name: 'Kizz Daniel - RTID (Rich Till I Die)',
    size: '1.4MB',
    url:
        'https://cdn.trendybeatz.com/audio/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
    timeStamp: DateTime(2023, 02, 13),
    isplaying: false,
    sendername: faker.internet.userName(),
  )
];
