import 'package:flutter/material.dart';
import 'package:poly_brewers/form_pages/form_page_3.dart';
import 'package:poly_brewers/form_pages/form_page_2.dart';
import 'package:poly_brewers/form_pages/form_page_1.dart';






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

  int step = 1;
  
  refresh({bool prev = false}) {
    if (step < 3 && !prev) {
      setState(() {
        step++;
      });
    }
    else if (step > 1 && prev) {
      setState(() {
        step--;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    var steps = [
      FormPage1(notifyParent: refresh,),
      FormPage2(notifyParent: refresh,),
      FormPage3(notifyParent: refresh,)
    ];
    
    return SingleChildScrollView(
      child: steps[step - 1]
    );
  }
}