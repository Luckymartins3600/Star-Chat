// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle defaultTransparentAppBar({Color top, Color bottom}) {
  return SystemUiOverlayStyle(
    statusBarColor: top ?? Colors.transparent,
    systemNavigationBarColor: bottom ?? Colors.transparent, // Navigation bar
  );
}

// LANGUAGES
Size size(BuildContext context) => MediaQuery.of(context).size;

List<Map<String, dynamic>> languagesls = [
  {'title': 'English', 'sub': 'English'},
  {'title': 'العربية', 'sub': 'Arabic'},
  {'title': 'Беларуская', 'sub': 'Belarusian'},
  {'title': 'Català', 'sub': 'Catalan'},
  {'title': 'Hrvatski', 'sub': 'Croatian'},
  {'title': 'Čeština', 'sub': 'Czech'},
  {'title': 'Nederlands', 'sub': 'Dutch'},
  {'title': 'Hausa (Nigeria) ', 'sub': 'Nigeria'},
  {'title': 'Igbo (Nigeria)', 'sub': 'Nigeria'},
  {'title': 'Suomi', 'sub': 'Finnish'},
  {'title': 'Français', 'sub': 'French'},
  {'title': 'Hindi', 'sub': 'Hindi (India)'},
  {'title': 'Deutsch', 'sub': 'German'},
  {'title': 'Magyar', 'sub': 'Hungarian'},
  {'title': 'Bahasa Indonesia', 'sub': 'Indonesian'},
  {'title': 'Italiano', 'sub': 'Italian'},
  {'title': '한국어', 'sub': 'Korean'},
  {'title': 'Bahasa Melayu', 'sub': 'Malay'},
  {'title': 'Norsk (Bokmål)', 'sub': 'Norwegian (Bokmål)'},
  {'title': 'فارسی', 'sub': 'Persian'},
  {'title': 'Polski', 'sub': 'Polish'},
  {'title': 'Português (Brasil)', 'sub': 'Portuguese (Brazil)'},
  {'title': 'Русский', 'sub': 'Russian'},
  {'title': 'Српски', 'sub': 'Serbian'},
  {'title': 'Slovenčina', 'sub': 'Slovak'},
  {'title': 'Español', 'sub': 'Spanish'},
  {'title': 'Svenska', 'sub': 'Swedish'},
  {'title': 'Türkçe', 'sub': 'Turkish'},
  {'title': 'Українська', 'sub': 'Ukrainian'},
];
List<Locale> suppurtedLan = [
  const Locale('ar', 'AE'),
  const Locale('be', 'BY'),
  const Locale('en', 'US'),
  // const Locale('cs', 'CZ'),
  // const Locale('de', 'DE'),
  // const Locale('es', 'AR'),
  // const Locale('fa', 'AF'),
  // const Locale('fi', 'FI'),
  // const Locale('fr', 'BE'),
  // const Locale('hr', 'HR'),
  // const Locale('hu', 'HU'),
  // const Locale('in', 'ID'),
  // const Locale('it', 'IT'),
  // const Locale('ko', 'KP'),
  // const Locale('ms', 'MY'),
  // const Locale('nl', 'NL'),
  // const Locale('no', 'NO'),
  // const Locale('pl', 'PL'),
  // const Locale('pt', 'BR'),
  // const Locale('sk', 'SK'),
  // const Locale('sv', 'SE'),
  // const Locale('tr', 'TR'),
  // const Locale('uk', 'UA'),
  // const Locale('ig', 'ig_NG'),
  // const Locale('ha', 'ha_NG'),
  // const Locale('hi', 'hi_IN'),
];

List<String> images = [
  'https://images.pexels.com/photos/15388654/pexels-photo-15388654.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/13567380/pexels-photo-13567380.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/9427363/pexels-photo-9427363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/14255782/pexels-photo-14255782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/12071970/pexels-photo-12071970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/11879709/pexels-photo-11879709.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/12336775/pexels-photo-12336775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/10117799/pexels-photo-10117799.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/10049618/pexels-photo-10049618.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
];
