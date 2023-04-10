// import 'package:flutter/cupertino.dart';

// class UserModel {
//   String uid, token, username, role, email, profilepic, active, dateCreated;
//   bool activeStatus, isDisabled, signinBy;
//   dynamic timeAgo;
//   UserModel(
//       {@required this.uid,
//       this.role,
//       @required this.timeAgo,
//       @required this.email,
//       this.isDisabled,
//       this.username,
//       @required this.token,
//       @required this.activeStatus,
//       this.dateCreated,
//       @required this.signinBy,
//       @required this.profilepic,
//       @required this.active});

//   UserModel.fromMap(Map<String, dynamic> map) {
//     timeAgo = map["timeAgo"];
//     isDisabled = map["isDisabled"];
//     role = map["role"];
//     uid = map["uid"];
//     username = map["username"];
//     token = map["token"];
//     email = map["email"];
//     profilepic = map["profilepic"];
//     signinBy = map["signinBy"];
//     activeStatus = map["activeStatus"];
//     dateCreated = map["dateCreated"];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "timeAgo": timeAgo,
//       "isDisabled": isDisabled,
//       "uid": uid,
//       "role": role,
//       "username": username,
//       "token": token,
//       "email": email,
//       "profilepic": profilepic,
//       'dateCreated': dateCreated,
//       'activeStatus': activeStatus,
//       'status': [],
//       "active": active,
//       "signinBy": signinBy
//     };
//   }
// }
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

import 'current_user.dart';

CurrentUserModel currentUserModel = CurrentUserModel(
  username: faker.internet.userName(),
  uid: const Uuid().v1(),
  email: faker.internet.email(),
  profilepic: faker.image.image(),
);
