import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:faker/faker.dart';

class FirebaseService {
  Future<CurrentUserModel> getcurrentUserdetails() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      List<UserInfo> userInfo = user.providerData;

      CurrentUserModel currentUserModel = CurrentUserModel(
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
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    final GoogleSignIn googleUser = GoogleSignIn();
    await googleUser.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
