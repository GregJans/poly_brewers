import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/profile_page.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:provider/provider.dart';

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
  var user = AuthService().user;

  @override
  Widget build(BuildContext context) {
    //Maybe use StreamProvider here instead since it is more prevalent for
    //data flow?
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: TextFormField(
                    //controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your email address',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 87, 99, 108),
                        fontSize: 14,
                      ),
                      //hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    //style: FlutterFlowTheme.of(context).bodyText1,
                    onChanged: (String value) {
                      emailAddress = value;
                    },
                    maxLines: null,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: TextFormField(
                    //controller: textController2,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
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
                    //style: FlutterFlowTheme.of(context).bodyText1,
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
                        decoration: const BoxDecoration(
                            //color: FlutterFlowTheme.of(context).primaryBackground,
                            ),
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Color.fromARGB(255, 16, 18, 19);
                                return Colors
                                    .grey; // null throus error in flutter 2.2+.
                              }),
                            ),
                            onPressed: () {
                              AuthService.emailPasswordLogin(
                                  emailAddress, password);
                              user = AuthService().user;
                              if (user != null) {
                                widget.notifyParent();
                              }
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
                        decoration: const BoxDecoration(
                            //color: FlutterFlowTheme.of(context).primaryBackground,
                            ),
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 0, 16, 0),
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Color.fromARGB(255, 16, 18, 19);
                                return Colors
                                    .grey; // null throus error in flutter 2.2+.
                              }),
                            ),
                            onPressed: () {
                              AuthService.registerEmailUser(
                                  emailAddress, password);
                              debugPrint("Sign Up");
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: IconButton(
                            icon: Image.asset(
                              'images/google_logo.png',
                              fit: BoxFit.fill,
                            ),

                            onPressed: () async {
                              debugPrint("Sending to google log in");
                              AuthService.signInWithGoogle();
                            },

                            //borderColor: Colors.transparent,
                            //borderRadius: 30,
                            //borderWidth: 1,
                            //buttonSize: 50,
                            //fillColor: FlutterFlowTheme.of(context).secondaryBackground,

                            //color: Colors.red,
                            //size: 24,
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
