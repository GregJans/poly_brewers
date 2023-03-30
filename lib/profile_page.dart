import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/brew_form.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/login_page.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  static bool loggedIn = false;

  var buttonColor = [Colors.white, Colors.white, Colors.white];

  refresh() {
    setState(() {
      loggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;
    UserData userInfo = Provider.of<UserData>(context);
    String uemail = user?.email ?? "uemail";

    return (!loggedIn)
        ? LoginPage(
            notifyParent: refresh,
          )
        : Scaffold(
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
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Image.asset(
                                        'images/taps.jpg',
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                    Padding(
<<<<<<< HEAD
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24, 140, 0, 0),
                                      child: Text(
                                        //USER INFO DEMO FOR PIPING DATA
                                        userInfo.fname,
                                        style: const TextStyle(
=======
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 150, 0, 0),
                                      child: Text(
                                        uemail,
                                        style: TextStyle(
>>>>>>> 18719d6bce9a4901657927f2eff0595b0fff1aac
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 87, 99, 108)),
                                      ),
                                    ),
                                    /*
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 174, 0, 0),
                                        child: Text(
                                          uemail,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 87, 99, 108)),
                                        ),
                                      ),
                                    ),
                                    */
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
                            color: Color.fromARGB(255, 87, 99, 108)),
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
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => const BrewForm()));
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      children: [
                                        const BrewForm(),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: IconButton(
                                            hoverColor: Color.fromARGB(
                                                0, 241, 241, 241),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(Icons.close),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          onHover: (bool hovered) {
                            if (hovered) {
                              setState(() {
                                buttonColor[0] =
                                    Color.fromARGB(255, 243, 243, 243);
                              });
                            } else {
                              setState(() {
                                buttonColor[0] = Colors.white;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: buttonColor[0],
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: Text(
                                    'Submit A New Recipe',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 16, 18, 19)),
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
                      child: InkWell(
                        onTap: () {
                          debugPrint("edit profile");
                        },
                        onHover: (bool hovered) {
                          if (hovered) {
                            setState(() {
                              buttonColor[1] =
                                  Color.fromARGB(255, 243, 243, 243);
                            });
                          } else {
                            setState(() {
                              buttonColor[1] = Colors.white;
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: buttonColor[1],
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 16, 18, 19)),
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
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        loggedIn = false;
                        buttonColor[2] = Colors.white;
                        AuthService().signOut();
                      }),
                      onHover: (bool hovered) {
                        if (hovered) {
                          setState(() {
                            buttonColor[2] = Color.fromARGB(144, 255, 96, 96);
                          });
                        } else {
                          setState(() {
                            buttonColor[2] = Colors.white;
                          });
                        }
                      },
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: buttonColor[2],
                                shape: BoxShape.rectangle,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 16, 18, 19)),
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
                const SizedBox(
                  height: 100,
                ),
                const CategoryList(name: "Saved Brews", amount: 5),
                const CategoryList(name: "My Brews", amount: 4)
              ],
            )));
  }
}
