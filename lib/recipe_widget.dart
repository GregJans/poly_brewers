import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  State<Recipe> createState() => RecipeState();
} 

class RecipeState extends State<Recipe> {

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 50,
            color: Colors.green,

            child: SizedBox(
              width: 300,
              height: 300,

              child: Column(
                children: const [
                  Text(
                    "This is a beer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),

                  SizedBox(
                    height: 100,
                  ),

                  Text("This is a description"),
                ],
              ) ,
            )
          );
  }
}

