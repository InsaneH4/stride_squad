import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'my_objects.dart';

class AuthService {
  //Lambda functions are cool :)
  Future<void> signInEmail(String email, String password) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signUp(String email, String password) async =>
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  Future<void> signInGoogle(context) async {
    var googleUser = await GoogleSignIn().signIn();
    var googleAuth = await googleUser!.authentication;
    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    var user = authResult.user;
    if (authResult.additionalUserInfo!.isNewUser) {
      var newUser = SsUser(
        username: user!.displayName!.replaceAll(" ", ""),
        joinDate: DateFormat('M/d/yy').format(DateTime.now()),
        name: user.displayName!,
        stepsMap: {
          DateFormat('M-d-yy').format(DateTime.now()): stepsNotifier.value,
        },
        stepsGoal: 5000,
      );
      debugPrint(newUser.toJson().toString());
      await database
          .ref("/Users/${FirebaseAuth.instance.currentUser!.uid}")
          .set(newUser.toJson());
      //do stuff
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error signing in with Google'),
        ),
      );
    }
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
