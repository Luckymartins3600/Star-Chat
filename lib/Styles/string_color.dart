import 'package:flutter/material.dart';

List<String> stringColors = [
  'red',
  'black',
  'orange',
  'blue',
  'blueAccent',
  'green',
  'yellowAccent',
  'blueGrey',
  'indigo',
  'cyan',
  'lime',
  'purple',
  'blueGrey',
  'pink',
];
Color stringColor(int index) {
  switch (stringColors[index]) {
    case 'red':
      return Colors.red;
      break;
    case 'black':
      return Colors.black;
      break;
    case 'orange':
      return Colors.orange;
      break;
    case 'blue':
      return Colors.blue;
      break;
    case 'blueAccent':
      return Colors.blueAccent;
      break;
    case 'green':
      return Colors.green;
      break;
    case 'yellowAccent':
      return const Color(0xC9CDA90B);
      break;
    case 'blueGrey':
      return Colors.blueGrey;
      break;
    case 'indigo':
      return Colors.indigo;
      break;
    case 'cyan':
      return Colors.cyan;
      break;
    case 'lime':
      return Colors.lime;
      break;
    case 'purple':
      return Colors.purple;
      break;
    case 'pink':
      return Colors.pink;
      break;
    default:
      return Colors.transparent;
  }
}
