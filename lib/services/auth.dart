import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poly_brewers/services/firestore.dart';

import 'models.dart';

class AuthService {
  //User stream can be thought of as a thread of activities the user can
  //perform
  final userStream = FirebaseAuth.instance.authStateChanges();

  //User is of course, the user using the specific user stream
  var user = FirebaseAuth.instance.currentUser;

  Future<void> registerEmailUser(String emailAddress, String password) async {
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      user = credential.user;
      FirestoreService().sendUserInfo(user);
    } on FirebaseAuthException catch (e) {
      throw e.message!
          .substring(e.message!.indexOf('/') + 1, e.message!.indexOf(')'));
    }
  }

  Future<void> emailPasswordLogin(String emailAddress, String password) async {
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message!
          .substring(e.message!.indexOf('/') + 1, e.message!.indexOf(')'));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    /*
      NOTE TO SELF GOOGLE USER ALSO NEEDS NEW SPOT IN DB
    */
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    //user = cred.user;
    //FirestoreService().sendUserInfo(user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
