/*
  Description: The AuthService class, the primary means of abstracting the
  Firebase authentication business logic for the rest of the application. Covers
  the registration of User Email and password, email-password login, and Google
  account authentication services

  Used By: login_page.dart and main.dart for Provider class.

  Created By: Nicholas Porter, Gregory Jans

*/

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

//registerEmailUser, the means of establishing a new user in the firebase
//authentication server. Takes the emailAddress and password from the frontend.
//Also creates new UserData entry in firestore database.
  Future<void> registerEmailUser(String emailAddress, String password) async {
    try {
      //send new credential information to firestore
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      //Send new user data upon creation to firestore database.
      user = credential.user;
      FirestoreService().sendUserInfo();
    } on FirebaseAuthException catch (e) {
      throw e.message!
          .substring(e.message!.indexOf('/') + 1, e.message!.indexOf(')'));
    }
  }

//emailPassowrdLogin, the means of logging in a user in the firebase
//authentication server. Takes the emailAddress and password from the frontend.
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

    var credential =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
    user = credential.user;
    if (credential.additionalUserInfo!.isNewUser) {
      FirestoreService().sendUserInfo();
      return credential;
    }

    return credential;
    //user = cred.user;
    //FirestoreService().sendUserInfo(user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
