import 'package:flutter/material.dart';

const List<String> difficultyList = <String>['Novice', 'Adept', 'Cicerone'];
const List<String> categoryList = <String>['Lager', 'IPA', 'Other'];

class FormPage3 extends StatefulWidget {
  final Function() notifyParent;
  const FormPage3({super.key, required this.notifyParent});
  

  @override
  FormPage3State createState() {
    return FormPage3State();
  }
}

class FormPage3State extends State<FormPage3> {

  final _formKey = GlobalKey<FormState>();
  String? difficultyValue;
  String? styleValue;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 13,
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: LinearProgressIndicator(
                  value: 3 / 3,
                  semanticsLabel: "Progress of form completion",
                  backgroundColor: const Color(0xFFE7E7E7),
                  color: const Color(0xFF6FF163),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Text(
                  "Step 3 of 3",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF95A1AC),
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),







              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 50,
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Brew Submitted')),
                        );
                        Navigator.pop(context);
                        
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),   
              ),  
            ],
          ),
        ),    
      );
  }
}