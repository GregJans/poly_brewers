import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poly_brewers/brew_form.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/login_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  static bool loggedIn = false;
  Color logoutButtonColor = Colors.white;

  refresh() {
    setState(() {
      loggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return (!loggedIn) ? LoginPage(notifyParent: refresh,) :
     Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Image.asset(
                                    'taps.jpg',
                                    width: MediaQuery.of(context).size.width,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                /* Can be used for a profile picture if wanted
                                Align(
                                  alignment: const AlignmentDirectional(0.85, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'taps.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                */
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24, 140, 0, 0),
                                  child: Text(
                                    '[User Name Here]',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 87, 99, 108)
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(24, 174, 0, 0),
                                    child: Text(
                                      'username@domain.com',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 87, 99, 108)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 87, 99, 108)
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BrewForm()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'Submit A New Recipe',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 16, 18, 19)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF95A1AC),
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 16, 18, 19)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF95A1AC),
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    loggedIn = false;
                  }),
                  onHover: (bool hovered) {
                      if (hovered) {
                        setState(() {
                        logoutButtonColor = const Color.fromARGB(255, 255, 96, 96);
                      });
                      }
                      else {
                        setState(() {
                          logoutButtonColor = Colors.white;
                        });
                      }
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: logoutButtonColor,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 16, 18, 19)
                                ),
                                ),
                              ),
                              Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.logout_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 18,
                                ),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100,),
            const CategoryList(name: "Saved Brews", amount: 5),
            const CategoryList(name: "My Brews", amount: 4)
          ],
        )
      )
    );
  }
}