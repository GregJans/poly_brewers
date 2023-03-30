import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //User stream can be thought of as a thread of activities the user can
  //perform
  final userStream = FirebaseAuth.instance.authStateChanges();

  //User is of course, the user using the specific user stream
  final user = FirebaseAuth.instance.currentUser;

  static Future<void> registerEmailUser(
      String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message!.substring(e.message!.indexOf('/') + 1, e.message!.indexOf(')'));
    }
    }

  static Future<void> emailPasswordLogin(
      String emailAddress, String password) async {
        
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message!.substring(e.message!.indexOf('/') + 1, e.message!.indexOf(')'));
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
