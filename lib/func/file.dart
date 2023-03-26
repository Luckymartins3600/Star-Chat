  import 'package:share_plus/share_plus.dart';

shareApp() async {
    await Share.share(
        "Hey, I'm using chat_app to chat. Join me! Download it here: https://telegram.org/dl");
  }