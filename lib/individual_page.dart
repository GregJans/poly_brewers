import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/profile_page.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';

class IndividualPageWidget extends StatefulWidget {
  const IndividualPageWidget({Key? key, required this.recipe})
      : super(key: key);
  final Recipe recipe;

  @override
  _IndividualPageWidgetState createState() => _IndividualPageWidgetState();
}

class _IndividualPageWidgetState extends State<IndividualPageWidget> {
  //final scaffoldKey = GlobalKey<ScaffoldState>();
  //final categoryKey = GlobalKey<ProfilePageState>();

  @override
  Widget build(BuildContext context) {
    bool saved = Provider.of<UserData>(context, listen: false).recipes.contains(widget.recipe.brewID);

    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,
              child: Stack(
                alignment: const AlignmentDirectional(-0.95, -0.7),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Image.asset(
                      'images/beer-glasses-bartop.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.95, -0.55),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.purple,
                            size: 24,
                          ),
                        ),
                      ),
                    ),                    
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.9, -0.55),
                    child: (AuthService().user != null)
                    ? InkWell(
                      onTap: () async {
                        if (saved) {
                          await FirebaseFirestore.instance
                          .collection('User')
                          .doc(AuthService().user!.uid)
                          .update({'recipies': FieldValue.arrayRemove([widget.recipe.brewID])});

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Brew Removed')),
                          );
                          setState(() {saved = !saved;});
                        }
                        else {
                          await FirebaseFirestore.instance
                          .collection('User')
                          .doc(AuthService().user!.uid)
                          .update({'recipies': FieldValue.arrayUnion([widget.recipe.brewID])});

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Brew Saved')),
                          );
                          setState(() {saved = !saved;});
                        } 
                        //categoryKey.currentState!.refresh();
                        
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Icon(
                            (saved) ? Icons.add_to_photos_rounded : Icons.add_to_photos_outlined,
                            color: Colors.purple,
                            size: 24,
                          ),
                        ),
                      ),
                    )
                    : SizedBox(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      widget.recipe.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Difficulty',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.difficulty,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Divider(
                          height: 75,
                          thickness: 1,
                          color: Colors.transparent,
                        ),
                        const Text(
                          'Origional Gravity',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.originalGravity.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Estimated Brew Time',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            '${widget.recipe.brewTime} minutes',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Yeast',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.yeast.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Hops',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.hops.join(', '),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Extract',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.extractName.join(', '),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Style',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.style,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Divider(
                          height: 75,
                          thickness: 1,
                          color: Colors.transparent,
                        ),
                        const Text(
                          'Final Gravity',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.finalGravity.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            ' ',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            ' ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Specific Grains',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.grains.join(', '),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Hops Weight',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            '${widget.recipe.hopsWeight.join(', ')} oz',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Extract Weight',
                            style: TextStyle(
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            '${widget.recipe.extractWeight} lbs',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rating',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Text(
                                widget.recipe.rating.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 16, 18, 19)),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Icon(
                                Icons.sports_bar_rounded,
                                color: Color(0xFF7A5C17),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 75,
                          thickness: 1,
                          color: Colors.transparent,
                        ),
                        const Text(
                          'IBU',
                          style: TextStyle(
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            widget.recipe.IBU.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 18, 19)),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Brewer\'s Notes',
                      style: TextStyle(
                        //fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        //fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        widget.recipe.notes,
                        //'The brew was decent with notes of caramel, lemongrass, slight hit of berry.\n',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 16, 18, 19)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Required Equipment',
                    style: TextStyle(
                      //fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      //fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      widget.recipe.equip.join(', '),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 16, 18, 19)),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 50,
              color: Color(0x00F11818),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 36),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Text(
                        'Instructions',
                        style: TextStyle(
                          color: Color.fromARGB(255, 87, 99, 108),
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Text(
                      widget.recipe.instructions,
                      //'To achieve this brew, you first need to.....',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19),
                        fontSize: 14,
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

