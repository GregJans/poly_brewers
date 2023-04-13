/*
  Description: Main landing page and place to view recipes. 
    consists of three main categories which can be filtered

  Used By: home_page.dart

  Created By: Gregory Jans

*/


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/filter_overlay.dart';

TextEditingController textController = TextEditingController();

class MainRecipePageWidget extends StatefulWidget {
  const MainRecipePageWidget({Key? key}) : super(key: key);

  @override
  MainRecipePageWidgetState createState() => MainRecipePageWidgetState();
}

class MainRecipePageWidgetState extends State<MainRecipePageWidget> {
  
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          alignment: const AlignmentDirectional(0, -1),
          children: [
            Align(
              alignment: const AlignmentDirectional(0.05, -1),
              child: Image.asset(
                'images/beer-glasses-bartop.jpg',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                color: Color(0x8D090F13),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 60, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 50,
                              child: TextField(
                                controller: textController,
                                onChanged: (value) {
                                  cats.forEach((element) {element.initData();});
                                },
                                decoration: InputDecoration(
                                  labelText: 'Find brews...',
                                  labelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 87, 99, 108)),
                                  floatingLabelStyle: const TextStyle(
                                    color: Colors.transparent
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(16),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(16),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(255, 241, 244, 248),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 16, 18, 19),
                                    size: 16,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.filter_alt_rounded),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            alignment: AlignmentDirectional.topEnd,
                                            content: Stack(
                                              alignment: AlignmentDirectional.topCenter,
                                              children: [
                                                Positioned(
                                                  width: widgetWidth,
                                                  child: const FilterOverlay()
                                                ),
                                              ],
                                            )
                                          
                                          );
                                        }
                                      ).then((value) => cats.forEach((element) {element.initData();}));
                                    },
                                  ),
                                ),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 16, 18, 19)),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                        child: Text(
                          'Explore new brews from around the world.',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 241, 244, 248),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 244, 248),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: MediaQuery.of(context).size.height - 300
                              ),
                              child: Column(
                                children: [
                                  const Divider(
                                    height: 8,
                                    thickness: 4,
                                    indent: 140,
                                    endIndent: 140,
                                  ),
                                  CategoryList(
                                    name: "IPA",
                                    filterable: true,
                                    query: FirebaseFirestore.instance
                                    .collection('Recipe')
                                    .where('style', isEqualTo: 'IPA')
                                    .get(), 
                                  ),
                                  CategoryList(
                                    name: "Lagers",
                                    filterable: true,
                                    query: FirebaseFirestore.instance
                                    .collection('Recipe')
                                    .where('style', isEqualTo: 'Lager')
                                    .get()
                                    
                                  ),
                                  CategoryList(
                                    name: "Others",
                                    filterable: true,
                                    query: FirebaseFirestore.instance
                                    .collection('Recipe')
                                    .where('style', isEqualTo: 'Other')
                                    .get()
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}