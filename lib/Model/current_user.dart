import 'package:flutter/cupertino.dart';

class CurrentUserModel {
  String uid, username, email, profilepic;

  CurrentUserModel({
    @required this.uid,
    @required this.email,
   @required this.username,
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

  CurrentUserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    username = map["username"];
    email = map["email"];
    uid = map["uid"];
    username = map["username"];
    profilepic = map["profilepic"];
  }
}
