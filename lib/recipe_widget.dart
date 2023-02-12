import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  //make parameters for name and rating
  const Recipe({Key? key, required}) : super(key: key);

  @override
  State<Recipe> createState() => RecipeState();
} 

class RecipeState extends State<Recipe> {

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
                'assets/beer-glasses-bartop.jpg',
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
                      const Text(
                        'Beer Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 18, 19)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            /*
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.sports_bar_rounded,
                                color: Color(0xFF7A5C17),
                              ),
                              direction: Axis.horizontal,
                              rating: 4,
                              unratedColor: Color(0xFFABA6A6),
                              itemCount: 5,
                              itemSize: 16,
                            ),
                            */
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFF7A5C17),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFF7A5C17),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFF7A5C17),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFFABA6A6),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.sports_bar_rounded,
                                  color: Color(0xFFABA6A6),
                                  size: 16,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                '4.7',
                                style: TextStyle(
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
                      debugPrint("View");
                    },
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 16, 18, 19),
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

