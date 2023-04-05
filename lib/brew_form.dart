import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poly_brewers/category_list.dart';
import 'package:poly_brewers/filter_overlay.dart';
import 'package:poly_brewers/form_pages/form_page_3.dart';
import 'package:poly_brewers/form_pages/form_page_2.dart';
import 'package:poly_brewers/form_pages/form_page_1.dart';
import 'package:poly_brewers/services/auth.dart';
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
  final _formKey = GlobalKey<FormState>();

  String? difficultyValue;
  String? styleValue;
  bool isChecked = false;

  Map<String, dynamic> values = {};

  late Recipe recipe;

  int step = 1;

  processStep1(String name, String difficulty, String style, double bitterness, List<String> equip) {
    values.putIfAbsent('name', () => name);
    values.putIfAbsent('difficulty', () => difficulty);
    values.putIfAbsent('style', () => style);
    values.putIfAbsent('IBU', () => bitterness);
    values.putIfAbsent('equip', () => equip);
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
    // add notes and instructions
    values.putIfAbsent('notes', () => notes);
    values.putIfAbsent('instructions', () => inst);
    values.putIfAbsent('author', () => Provider.of<UserData>(context, listen: false).uid);

    recipe = Recipe.fromJson(values);
    // .then() is not working 
    // meant to refresh the "My Brews" category once a new one is added
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
    //print();
    print(MediaQuery.of(context).size.height);

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
