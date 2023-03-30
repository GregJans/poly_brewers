import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/form_pages/form_page_3.dart';
import 'package:poly_brewers/form_pages/form_page_2.dart';
import 'package:poly_brewers/form_pages/form_page_1.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';
import 'package:poly_brewers/services/firestore.dart';


class BrewForm extends StatefulWidget {
  const BrewForm({super.key});

  @override
  BrewFormState createState() {
    return BrewFormState();
  }
}

class BrewFormState extends State<BrewForm> {
  final _formKey = GlobalKey<FormState>();

  String? difficultyValue;
  String? styleValue;
  bool isChecked = false;

  Map<String, dynamic> values = {};

  late Recipe recipe;

  int step = 1;

  processStep1(String name, String difficulty, String style, double bitterness) {
    values.putIfAbsent('name', () => name);
    values.putIfAbsent('difficulty', () => difficulty);
    values.putIfAbsent('style', () => style);
    values.putIfAbsent('IBU', () => bitterness);
    //debugPrint(values.toString());
  }

  processStep2(double og, double fg, List<String> extracts, int eLbs,
      List<String> hops, List<int> hopsOz, String yeast, List<String> grains) {
    values.putIfAbsent('originalGravity', () => og);
    values.putIfAbsent('finalGravity', () => fg);
    values.putIfAbsent('extractName', () => extracts);
    values.putIfAbsent('extractWeight', () => eLbs);
    values.putIfAbsent('hops', () => hops);
    values.putIfAbsent('hopsWeight', () => hopsOz);
    values.putIfAbsent('yeast', () => yeast);
    values.putIfAbsent('grains', () => grains);
    //debugPrint(values.toString());

    recipe = Recipe.fromJson(values);
    debugPrint(recipe.toString());

    // need to add recipe to userData.recipies
    // currently have no way to get recipeID
    //Provider.of<UserData>(context).recipes.add(recipe);
    // do not currently have write permissions
    FirestoreService().sendRecipe(recipe, Provider.of<UserData>(context, listen: false));
  }

  processStep3(String notes, String inst) {
    // add notes and instructions
  }

  refresh({bool prev = false}) {
    if (step < 3 && !prev) {
      setState(() {
        step++;
      });
    } else if (step > 1 && prev) {
      setState(() {
        step--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var steps = [
      FormPage1(
        update: refresh,
        notifyParent: processStep1,
        recData: values,
      ),
      FormPage2(
        update: refresh,
        notifyParent: processStep2,
        recData: values,
      ),
      FormPage3(
        update: refresh,
        notifyParent: processStep3,
      )
    ];

    return SingleChildScrollView(child: steps[step - 1]);
  }
}
