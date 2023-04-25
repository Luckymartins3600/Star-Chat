import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat_app/Model/current_user.dart';

class FirebaseService {
  Future<CurrentUserModel> getUserModelById(String uid) async {
    CurrentUserModel userModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();

    if (docSnap.data() != null) {
      userModel = CurrentUserModel.fromMap(docSnap.data());
    }

    return userModel;
  }

  Future<String> resetPassword({String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'Email Sent';
    } catch (e) {
      return "Error occured maybe email is incorrect";
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<CurrentUserModel> getcurrentUserdetails() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      final value = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      CurrentUserModel userData = CurrentUserModel.fromMap(value.data());
      return userData;
    } catch (e) {
      return null;
    }
  }

  Future<List<CurrentUserModel>> getAllUser() async {
    List<CurrentUserModel> users = [];
    QuerySnapshot docSnap =
        await FirebaseFirestore.instance.collection('Users').get();
    if (docSnap != null) {
      for (var i = 0; i < docSnap.docs.length; i++) {
        users.add(
          CurrentUserModel(
            uid: docSnap.docs[i]['uid'],
            email: docSnap.docs[i]['email'],
            username: docSnap.docs[i]['username'],
            profilepic: docSnap.docs[i]['profilepic'],
            firstName: docSnap.docs[i]['firstName'],
            dateCreated: docSnap.docs[i]['dateCreated'],
            disabled: docSnap.docs[i]['disabled'],
            isonline: docSnap.docs[i]['isonline'],
            lastSeenTime: docSnap.docs[i]['lastSeenTime'],
            bio: docSnap.docs[i]['bio'],
            birthday: docSnap.docs[i]['birthday'],
            role: docSnap.docs[i]['role'],
          ),
        );
      }
    }
    return users;
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
      await getUserData(value.user.uid).then((valueF) async {
        print(valueF);
        if (valueF == null) {
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
            bio: '',
            birthday: DateTime.now(),
          );
          await setData(
            colection: 'Users',
            id: value.user.uid,
            data: userData.toMap(),
          );
        }
      });
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

  Future getUserData(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(id).get();
    } catch (e) {
      return null;
    }
  }

  signOut() async {
    final GoogleSignIn googleUser = GoogleSignIn();
    await googleUser.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  String getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }
}
