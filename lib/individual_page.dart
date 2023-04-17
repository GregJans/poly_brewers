/*
  Description: Page to view each individual recipe. 
    Gets an instance of a Recipe object to populate the data
    Rating popup on bottom will only be visible if the recipe has not been rated yet by the user and will dissaper after
    Option to save recipe is only available when user is logged in
    This page is a seperate overlay on top of the rest of the website

  Called By: recipe_widget.dart, recipe_page.dart and profile_page.dart

  Created By: Gregory Jans

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';

class IndividualPageWidget extends StatefulWidget {
  const IndividualPageWidget({Key? key, required this.recipe})
      : super(key: key);
  final Recipe recipe;

  @override
  IndividualPageWidgetState createState() => IndividualPageWidgetState();
}

class IndividualPageWidgetState extends State<IndividualPageWidget> {
  
  bool rated = false;

  @override
  Widget build(BuildContext context) {
    bool saved = Provider.of<UserData>(context, listen: false).recipes.contains(widget.recipe.brewID);

    return Scaffold(
      floatingActionButton: Visibility(
        visible: !rated,
        child: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Text("Let others know what you thought"),
                      ),
              
                      RatingBar.builder(
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 36,
                        itemBuilder: (context, index) => const Icon(
                          Icons.sports_bar_rounded,
                          color: Color(0xFF7A5C17),
                        ),
                        onRatingUpdate: (rating) {
                          FirebaseFirestore.instance
                            .collection('Recipe')
                            .doc(widget.recipe.brewID)
                            .update({
                              'ratingTotal': (widget.recipe.ratingTotal + rating),
                              'ratingsNum': (widget.recipe.ratingsNum + 1)
                            });
                          setState(() {
                            rated = true;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              });
          },
          label: const Text("Leave a rating"),
          icon: const Icon(Icons.sports_bar_outlined),
        ),
      ),
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
                    child: Visibility(
                      visible: (AuthService().user != null),
                      child: InkWell(
                        onTap: () async {
                          if (saved) {
                            await FirebaseFirestore.instance
                            .collection('User')
                            .doc(AuthService().user!.uid)
                            .update({'recipies': FieldValue.arrayRemove([widget.recipe.brewID])})
                            .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Brew Removed')),
                              );
                              setState(() {saved = !saved;});
                            });
                          }
                          else {
                            await FirebaseFirestore.instance
                            .collection('User')
                            .doc(AuthService().user!.uid)
                            .update({'recipies': FieldValue.arrayUnion([widget.recipe.brewID])})
                            .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Brew Saved')),
                              );
                              setState(() {saved = !saved;});
                            });
                          }
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
                    ),
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
                    Expanded(
                      child: Column(
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
                              widget.recipe.originalGravity.toStringAsPrecision(4),
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
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
                                widget.recipe.finalGravity.toStringAsPrecision(4),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                widget.recipe.grains.join(', '),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
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
                      ),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                (widget.recipe.ratingTotal / widget.recipe.ratingsNum).isNaN 
                                ? '0' 
                                : (widget.recipe.ratingTotal / widget.recipe.ratingsNum).toStringAsPrecision(2),
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
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        widget.recipe.notes,
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
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      widget.recipe.equip.join(', '),
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 16, 18, 19)),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 50,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 50),
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
                    style: const TextStyle(
                      color: Color.fromARGB(255, 16, 18, 19),
                      fontSize: 14,
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

