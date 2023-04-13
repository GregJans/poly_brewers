/*
  Description: Individual card for a recipe. 
    Picture is hard-codded although ideally would be uploaded by user in the future
    Given an instance of a Recipe object to fill out the data
    Passes that instance to the individual page if the view button is clicked

  Used By: category_list.dart

  Created By: Gregory Jans

*/

import 'package:flutter/material.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/individual_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:poly_brewers/services/models.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({Key? key, required this.recipe})
      : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeCard> createState() => RecipeCardState();
}

class RecipeCardState extends State<RecipeCard> {
  Color buttonColor = const Color.fromARGB(255, 16, 18, 19);
  double rValue = 0;
  
  @override
  Widget build(BuildContext context) {
    // if there are no ratings yet then we cannot calculate a number
    // at that point we default it to 0
    rValue = (widget.recipe.ratingTotal / widget.recipe.ratingsNum).isNaN ? 0 : (widget.recipe.ratingTotal / widget.recipe.ratingsNum);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Container(
        width: 270,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x230F1113),
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                'images/beer-glasses-bartop.jpg',
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipe.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color.fromARGB(255, 16, 18, 19)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              RatingBar.builder(
                                initialRating: rValue,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 25,
                                allowHalfRating: true,
                                ignoreGestures: true,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFF7A5C17),
                                ),
                                onRatingUpdate: (value) {}, 
                              ),


                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  rValue.toStringAsPrecision(2),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 87, 99, 108),
                                    fontStyle: FontStyle.italic,
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
                    onTap: () {
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualPageWidget(
                                    recipe: widget.recipe,
                              )
                          )
                      ).then((value) {
                        cats.forEach((element) {element.initData();});
                        //widget.notifyParent();
                      });
                    },
                    onHover: (bool hovered) {
                      if (hovered) {
                        setState(() {
                          buttonColor = Colors.purple;
                        });
                      } else {
                        setState(() {
                          buttonColor = const Color.fromARGB(255, 16, 18, 19);
                        });
                      }
                    },
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Text(
                          'View',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
