import 'package:flutter/cupertino.dart';

class CurrentUserModel {
  String uid, role, firstName, username, email, profilepic, bio;
  bool disabled, isonline;
  dynamic lastSeenTime, dateCreated, birthday;
  CurrentUserModel({
    @required this.uid,
    @required this.email,
    @required this.username,
    @required this.profilepic,
    @required this.firstName,
    this.role = 'Standard',
    @required this.dateCreated,
    @required this.disabled,
    @required this.isonline,
    @required this.lastSeenTime,
    @required this.bio,
    @required this.birthday,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "firstName": firstName,
      "username": username,
      "email": email,
      "disabled": disabled,
      "profilepic": profilepic,
      "isonline": isonline,
      "lastSeenTime": lastSeenTime,
      "dateCreated": dateCreated,
      "role": role,
      "bio": bio,
      "birthday": birthday,
    };
  }

  CurrentUserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    firstName = map["firstName"];
    username = map["username"];
    email = map["email"];
    disabled = map["disabled"];
    profilepic = map["profilepic"];
    isonline = map["isonline"];
    lastSeenTime = map["lastSeenTime"];
    dateCreated = map["dateCreated"];
    role = map["role"];
    bio = map["bio"];
    birthday = map["birthday"];
  }
}
