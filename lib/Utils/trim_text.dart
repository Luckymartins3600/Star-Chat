import 'package:flutter/material.dart';

String textLimit(
    {@required String text, @required int max, String morecharacter = '..'}) {
  int length = text.length - max;

  if (text.length <= max) {
    return text;
  } else {
    return '${text.substring(0, text.length - length)}$morecharacter';
  }
}
