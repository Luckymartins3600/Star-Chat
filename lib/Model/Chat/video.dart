import 'package:flutter/material.dart';
import 'package:chat_app/Model/enums.dart';

class VideoModel {
  String url, thumbnail;
  VideoType videoType;
  VideoModel({
    @required this.videoType,
    @required this.url,
    @required this.thumbnail,
  });
}
