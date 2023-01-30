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
            elevation: 5,
            color: Colors.white,
            margin: const EdgeInsets.all(8),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent),
            ),

            child: Container(
              padding: const EdgeInsets.all(20),
              width: 250,

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
                    height: 50,
                  ),

                  Text("This is a description"),
                ],
              ) ,
            )
          );
  }
}

