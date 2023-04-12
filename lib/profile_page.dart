
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/brew_form.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/login_page.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

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
  didChangeDependencies() {
    getRecipes().then((value) => setState(() {
      
    },));
  }

  getRecipes() async {
    await Provider.of<UserData>(context, listen: false).recipes;
  }


  @override
  Widget build(BuildContext context) {

    var user = AuthService().user;
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Image.asset(
                                    'images/taps.jpg',
                                    width:
                                        MediaQuery.of(context).size.width,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 150, 0, 0),
                                  child: Text(
                                    uemail,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 87, 99, 108)
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Stack(
                                children: [
                                  const SizedBox(
                                    width: 750,
                                    height: 700,
                                    child: BrewForm(),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      hoverColor: Colors.transparent,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      onHover: (bool hovered) {
                        if (hovered) {
                          setState(() {
                            buttonColor[0] = const Color.fromARGB(255, 243, 243, 243);
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
                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
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
                      
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(0),
                            content: Iframe()
                          );
                        }
                      );
                    },
                    onHover: (bool hovered) {
                      if (hovered) {
                        setState(() {
                          buttonColor[1] = const Color.fromARGB(255, 243, 243, 243);
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
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            child: Text(
                              'View Beginner\'s Guide',
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
                        buttonColor[2] = const Color.fromARGB(144, 255, 96, 96);
                      });
                    } else {
                      setState(() {
                        buttonColor[2] = Colors.white;
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
                            color: buttonColor[2],
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
                                      color: Color.fromARGB(255, 16, 18, 19)),
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
            (Provider.of<UserData>(context, listen: false).recipes.isNotEmpty) 
            ? CategoryList(
              name: "Saved Brews",
              query: FirebaseFirestore.instance
              .collection('Recipe')
              .where('brewID', whereIn: Provider.of<UserData>(context, listen: true).recipes)
              .get(),
            )
            : const CircularProgressIndicator(),
            CategoryList(
              name: "My Brews",
              query: FirebaseFirestore.instance
                .collection('Recipe')
                .where('author', isEqualTo: AuthService().user!.uid)
                .get()
            )
          ],
        )
      )
    );
  }
}

class Iframe extends StatelessWidget {
  Iframe() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'assets/docs/PolyBrewers_Deliverable2.pdf';
      iframe.style.height = '100%';
      iframe.style.width = '100%';
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: const HtmlElementView(viewType: 'iframe')
    );
    
  }
}
