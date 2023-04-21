import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:faker/faker.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<CurrentUserModel> getcurrentUserdetails() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      List<UserInfo> userInfo = user.providerData;

      CurrentUserModel currentUserModel = CurrentUserModel(
        firstName: getFirstWords(user.displayName, 1),
        uid: user.uid,
        email: userInfo[0].email ?? 'hiddenEmail${userInfo[0].uid}@gmail.com',
        profilepic: user.photoURL,
        username: user.displayName,
      );

      return currentUserModel;
    } catch (e) {
      return CurrentUserModel(
        uid: faker.internet.ipv6Address(),
        email: faker.internet.email(),
        profilepic: faker.image.image(random: true),
        username: faker.internet.userName(),
        firstName: faker.person.firstName(),
      );
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      final fname = value.additionalUserInfo.profile['given_name'];
      CurrentUserModel userData = CurrentUserModel(
        uid: value.user.uid,
        firstName: fname,
        username: value.user.displayName,
        email: value.user.email,
        profilepic: value.user.photoURL,
        disabled: false,
        isonline: true,
        role: 'Standard',
        dateCreated: FieldValue.serverTimestamp(),
        lastSeenTime: FieldValue.serverTimestamp(),
      );
      await setData(
        colection: 'Users',
        id: value.user.uid,
        data: userData.toMap(),
      );
    });
  }

  Future setData(
      {String colection, Map<String, dynamic> data, String id}) async {
    try {
      await FirebaseFirestore.instance.collection(colection).doc(id).set(data);
    } catch (e) {
      return null;
    }
  }

  Future getData() async {}

  signOut() async {
    final GoogleSignIn googleUser = GoogleSignIn();
    await googleUser.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  String getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }
}
