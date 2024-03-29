/*
  Description: The popup to submit a brew to the database 
    Consists of three child widgets (a seperate widget for each page of the form)
    After each stage is completed, the data is stored in a JSON object
    After the last page, the JSON is converted into a recipe and sent to the databse

  Used By: profile_page.dart

  Created By: Gregory Jans

*/

import 'package:flutter/material.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/form_pages/form_page_3.dart';
import 'package:poly_brewers/form_pages/form_page_2.dart';
import 'package:poly_brewers/form_pages/form_page_1.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/models.dart';
import 'package:provider/provider.dart';


class BrewForm extends StatefulWidget {
  const BrewForm({super.key});

  @override
  BrewFormState createState() {
    return BrewFormState();
  }
}

class BrewFormState extends State<BrewForm> {

  String? difficultyValue;
  String? styleValue;
  bool isChecked = false;

  Map<String, dynamic> values = {};

  late Recipe recipe;

  int step = 1;

  processStep1(String name, String difficulty, String style, double bitterness, List<String> equip, int time) {
    values.putIfAbsent('name', () => name);
    values.putIfAbsent('difficulty', () => difficulty);
    values.putIfAbsent('style', () => style);
    values.putIfAbsent('IBU', () => bitterness);
    values.putIfAbsent('equip', () => equip);
    values.putIfAbsent('brewTime', () => time);
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
  }

  processStep3(String notes, String inst) {
    values.putIfAbsent('notes', () => notes);
    values.putIfAbsent('instructions', () => inst);
    values.putIfAbsent('author', () => Provider.of<UserData>(context, listen: false).uid);

    recipe = Recipe.fromJson(values);
    
    FirestoreService().sendRecipe(recipe, Provider.of<UserData>(context, listen: false))
      .then((value) => cats.forEach((element) {element.initData();}));
    
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
        recData: values
      )
    ];
    return SingleChildScrollView(child: steps[step - 1]);
  }
}
