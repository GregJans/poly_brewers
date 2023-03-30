import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/form_pages/form_page_3.dart';
import 'package:poly_brewers/form_pages/form_page_2.dart';
import 'package:poly_brewers/form_pages/form_page_1.dart';
import 'package:poly_brewers/services/models.dart';

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

  processStep1(
      String name, String difficulty, String style, double bitterness) {
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
      ),
      FormPage2(
        update: refresh,
        notifyParent: processStep2,
      ),
      FormPage3(
        update: refresh,
      )
    ];

    return SingleChildScrollView(child: steps[step - 1]);
  }
}
