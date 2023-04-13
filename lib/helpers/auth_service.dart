import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Lambda functions are cool :)
  Future<void> signInEmail(String email, String password) async =>
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signUp(String email, String password) async =>
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();

  Future<void> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
