import 'package:flutter/cupertino.dart';

class CurrentUserModel {
  String uid, username, email, profilepic;

  CurrentUserModel({
    @required this.uid,
    @required this.email,
    this.username,
    @required this.profilepic,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
