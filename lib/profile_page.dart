import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poly_brewers/login_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool passwordVisibility = false;
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {

    return (!loggedIn) ? const LoginPage() :
     Scaffold(
      body: Text("This is the profile page")
    );
  }
}