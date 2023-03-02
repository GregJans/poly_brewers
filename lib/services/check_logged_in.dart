import 'package:flutter/material.dart';
import 'package:poly_brewers/profile_page.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/home_page.dart';
import 'package:poly_brewers/login_page.dart';

/*

FIX_ME refactor this into a class with a function that returns Widgets upon
successful login

*/

class CheckLoggedIn {
  Widget checker() {
    //Stream builder to create user activity stream after login
    return StreamBuilder(
      //Defines the stream to use (from auth file)
      stream: AuthService().userStream,

      //The built stream itself
      builder: (context, snapshot) {
        //Here we have a few options to perform, one if data is still being
        //loaded from the backend
        if (snapshot.connectionState == ConnectionState.waiting) {
          //return const LoadingScreen();
          return const Text("loading data");
        }

        //Two, if an error occurs on our end, return an error widget!
        else if (snapshot.hasError) {
          return const Center(
            child: Text("ErrorMessage"),
          );
        }

        //Three if login is successful, that is, the user has data, we
        //go to home page widget
        else if (snapshot.hasData) {
          print('tanks');
          return const HomePage();
        }

        //Finally, we allow the user to login with login screen...
        else {
          print('checkin plox!');
          return const ProfilePage();
        }
      },
    );
  }
}
