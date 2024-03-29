/*
  Description: The page to log into the applicaiton. 
    Loaded by default when going to the profile page unless user was authenticated
    Has a callback to profile_page to refresh once logged in

  Used By: profile_page.dart

  Created By: Gregory Jans, Nicholas Porter

*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/services/auth.dart';

class LoginPage extends StatefulWidget {
  final Function() notifyParent;
  const LoginPage({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool passwordVisibility = false;

  String emailAddress = '';
  String password = '';
  User? user;
  String? emailError;
  String? pwError;

  void createNewUser() {
    AuthService().registerEmailUser(emailAddress, password).catchError((e) {
      debugPrint(e);
      if (mounted) {
        setState(() {
          //reset the error messages
          emailError = null;
          pwError = null;

          if (e == 'user-not-found') {
            emailError = 'No user found for that email.';
          } else if (e == 'wrong-password') {
            pwError = 'Wrong password provided for that user.';
          } else if (e == "invalid-email") {
            emailError = "Not a proper email format";
          } else if (e == 'invalid-password') {
            pwError = "Password must be of length 6";
          }
        });
      }
    }).then((value) {
      user = AuthService().user;
      if (user != null) {
        widget.notifyParent();
      }
    });
  }

  void authenticateUser() {
    AuthService().emailPasswordLogin(emailAddress, password).catchError((e) {
      debugPrint(e);
      if (mounted) {
        setState(() {
          //reset the error messages
          emailError = null;
          pwError = null;

          if (e == 'user-not-found') {
            emailError = 'No user found for that email.';
          } else if (e == 'wrong-password') {
            pwError = 'Wrong password provided for that user.';
          } else if (e == "invalid-email") {
            emailError = "Not a proper email format";
          } else if (e == 'invalid-password') {
            pwError = "Password must be of length 6";
          }
        });
      } // This is only run if there is no error thrown
    }).then((value) {
      user = AuthService().user;
      // Checks if user exists / is authenticated
      if (user != null) {
        widget.notifyParent();
      }
    });
  }

  void signInWithGoogle() {
    AuthService().signInWithGoogle().catchError((e) {
      debugPrint(e);
      if (mounted) {
        setState(() {
          //reset the error messages
          emailError = null;
          pwError = null;

          if (e == 'user-not-found') {
            emailError = 'No user found for that email.';
          } else if (e == 'wrong-password') {
            pwError = 'Wrong password provided for that user.';
          } else if (e == "invalid-email") {
            emailError = "Not a proper email format";
          } else if (e == 'invalid-password') {
            pwError = "Password must be of length 6";
          }
        });
      } // This is only run if there is no error thrown
    }).then((value) {
      user = AuthService().user;
      // Checks if user exists / is authenticated
      if (user != null) {
        widget.notifyParent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'images/logo.png',
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Text(
                      'Want more from Poly Brewers?',
                      style: TextStyle(
                          fontSize: 50, color: Color.fromARGB(255, 16, 18, 19)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: Text(
                      'Sign in or create an account to unlock all functionality',
                      style: TextStyle(
                          fontSize: 25, color: Color.fromARGB(255, 16, 18, 19)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Container(
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x3416202A),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            errorText: emailError,
                            labelText: 'Your email address',
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 87, 99, 108),
                              fontSize: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          onChanged: (String value) {
                            emailAddress = value;
                          },
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Container(
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x3416202A),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: TextFormField(
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: pwError,
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 87, 99, 108),
                              fontSize: 14,
                            ),
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 87, 99, 108),
                              fontSize: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          onChanged: (String value) {
                            password = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(),
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 16, 0),
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return const Color.fromARGB(
                                            255, 16, 18, 19);
                                      return Colors.grey;
                                    }),
                                  ),
                                  onPressed: () {
                                    authenticateUser();
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return const Color.fromARGB(
                                            255, 16, 18, 19);
                                      return Colors.grey;
                                    }),
                                  ),
                                  onPressed: () {
                                    createNewUser();
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 8, 8, 8),
                                child: IconButton(
                                  icon: Image.asset(
                                    'images/google_logo.png',
                                    fit: BoxFit.fill,
                                  ),
                                  onPressed: () async {
                                    debugPrint("Sending to google log in");
                                    signInWithGoogle();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
