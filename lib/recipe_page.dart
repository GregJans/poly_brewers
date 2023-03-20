import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/filter_overlay.dart';
import 'package:json_annotation/json_annotation.dart';

class MainRecipePageWidget extends StatefulWidget {
  const MainRecipePageWidget({Key? key}) : super(key: key);

  @override
  _MainRecipePageWidgetState createState() => _MainRecipePageWidgetState();
}

class _MainRecipePageWidgetState extends State<MainRecipePageWidget>
    with TickerProviderStateMixin {
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey _key = LabeledGlobalKey("button_icon");
  late OverlayEntry _overlayEntry;
  late Size buttonSize;
  late Offset buttonPosition;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset(-widgetWidth, 15));
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: buttonPosition.dy + buttonSize.height,
        left: buttonPosition.dx,
        width: widgetWidth,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipPath(
                  clipper: ArrowClipper(),
                  child: Container(
                    width: 17,
                    height: 17,
                    color: Color.fromARGB(150, 255, 255, 255),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 17.0),
                  child: FilterOverlay()),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                height: 500,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 60, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: TextField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Find brews...',
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 87, 99, 108)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 241, 244, 248),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color:
                                              Color.fromARGB(255, 16, 18, 19),
                                          size: 16,
                                        ),
                                        suffixIcon: IconButton(
                                          key: _key,
                                          icon: const Icon(
                                              Icons.filter_alt_rounded),
                                          onPressed: () {
                                            if (isMenuOpen) {
                                              _overlayEntry.remove();
                                              isMenuOpen = !isMenuOpen;
                                            } else {
                                              findButton();
                                              _overlayEntry =
                                                  _overlayEntryBuilder();
                                              Overlay.of(context)!
                                                  .insert(_overlayEntry);
                                              isMenuOpen = !isMenuOpen;
                                            }
                                          },
                                        ),
                                      ),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 16, 18, 19)),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 24, 16, 44),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 32, 0, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 16),
                                  child: Column(
                                    children: const [
                                      Divider(
                                        height: 8,
                                        thickness: 4,
                                        indent: 140,
                                        endIndent: 140,
                                        //color: FlutterFlowTheme.of(context).lineColor,
                                      ),
                                      CategoryList(
                                        name: "IPA",
                                        amount: 4,
                                      ),
                                      CategoryList(
                                        name: "Lagers",
                                        amount: 7,
                                      ),
                                      CategoryList(
                                        name: "Others",
                                        amount: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
