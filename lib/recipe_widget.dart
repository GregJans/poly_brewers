import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  State<Recipe> createState() => RecipeState();
} 

class RecipeState extends State<Recipe> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: const BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/beer-glasses-bartop.jpg',
                width: 244.8,
                height: 82,
                fit: BoxFit.cover,
              ),
              const Divider(
                thickness: 2,
                indent: 5,
                endIndent: 5,
                color: Color(0xFF191717),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Auzzie Chocolate lager',
                  //style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              const Text(
                'Est time 30 - 40 mins',
                style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.sports_bar,
                      color: Color(0xFF7A5C17),
                      size: 24,
                    ),
                    Icon(
                      Icons.sports_bar,
                      color: Color(0xFF7A5C17),
                      size: 24,
                    ),
                    Icon(
                      Icons.sports_bar,
                      color: Color(0xFF7A5C17),
                      size: 24,
                    ),
                    Icon(
                      Icons.sports_bar_outlined,
                      color: Color(0xFFABA6A6),
                      size: 24,
                    ),
                    Icon(
                      Icons.sports_bar_outlined,
                      color: Color(0xFFABA6A6),
                      size: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: TextButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  
                  child: const Text(
                    "View Recipe",
                    style: TextStyle(
                      color: Color(0xFFBE25AF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

