import 'package:flutter/cupertino.dart';

class CurrentUserModel {
  String uid, role, firstName, username, email, profilepic;
  bool disabled, isonline;
  dynamic lastSeenTime, dateCreated;
  CurrentUserModel({
    @required this.uid,
    @required this.email,
    @required this.username,
    @required this.profilepic,
    @required this.firstName,
    this.role = 'Standard',
    this.dateCreated,
    this.disabled,
    this.isonline,
    this.lastSeenTime,
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
  }
}
