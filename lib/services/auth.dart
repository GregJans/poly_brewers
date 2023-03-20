import 'package:firebase_auth/firebase_auth.dart';
import 'package:poly_brewers/login_page.dart';
import 'package:poly_brewers/profile_page.dart';

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
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw Exception(e.code);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> emailPasswordLogin(
      String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == "invalid-email") {
        print("Not a proper email format");
      } else if (e.code == 'invalid-password') {
        print("Password must be of length 6");
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
