import 'package:flutter/material.dart';
import 'package:poly_brewers/individual_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/services/models.dart';

class RecipeCard extends StatefulWidget {
  //make parameters for name and rating
  const RecipeCard({Key? key, required this.recipe, required this.updateParent})
      : super(key: key);
  final Function updateParent;
  final Recipe recipe;

  @override
  State<RecipeCard> createState() => RecipeCardState();
}

class RecipeCardState extends State<RecipeCard> {
  Color buttonColor = const Color.fromARGB(255, 16, 18, 19);

  @override
  Widget build(BuildContext context) {
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipe.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromARGB(255, 16, 18, 19)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => const Icon(
                                Icons.sports_bar_rounded,
                                color: Color(0xFF7A5C17),
                              ),
                              direction: Axis.horizontal,
                              rating: widget.recipe.rating,
                              unratedColor: const Color(0xFFABA6A6),
                              itemCount: 5,
                              itemSize: 16,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: Text(
                                widget.recipe.rating.toString(),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualPageWidget(
                                    recipe: widget.recipe,
                                    updateParent: widget.updateParent,
                                  )));
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
