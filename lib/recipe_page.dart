
import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Row(
        children: const [
          Recipe(),
          Recipe(),
          Recipe(),
          Recipe(),
        ],
      ),
      );
  }
}