import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> urlLuncher(String url) async {
  final Uri link = Uri.parse(url);

  if (!await launchUrl(link,
      mode: Platform.isAndroid
          ? LaunchMode.externalNonBrowserApplication
          : LaunchMode.platformDefault)) {
    throw Exception('Could not launch $link');
  }
}
