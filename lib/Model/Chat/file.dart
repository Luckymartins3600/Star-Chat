import 'package:flutter/material.dart';
import 'package:chat_app/Model/enums.dart';

class FileModel {
  FileType fileType;
  String fileSize, fileName, url;

  FileModel({
    @required this.fileName,
    @required this.fileSize,
    @required this.fileType,
    @required this.url,
  });
}
