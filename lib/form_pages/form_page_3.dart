/*
  Description: The final page of the brew form. 
    Used to iput notes and instructions
    Has a callback to brew_form to send the data that is entered and a seperate callback to change the page
    Takes in a JSON object as the current data for when a user returns to this page from another form page

  Used By: brew_form.dart and profile_page.dart indirectly

  Created By: Gregory Jans

*/

import 'package:flutter/material.dart';

class FormPage3 extends StatefulWidget {
  final Function({bool prev}) update;
  final Function(String, String) notifyParent;
  final Map<String, dynamic> recData;
  const FormPage3({super.key, required this.update, required this.notifyParent, required this.recData});

  @override
  FormPage3State createState() {
    return FormPage3State();
  }
}

class FormPage3State extends State<FormPage3> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // controllers set the default values when the page loads and lets us get the data to send to parent
    final notesController = TextEditingController(text: (widget.recData['notes'] == null) ? '' : widget.recData['notes'].toString());
    final instController = TextEditingController(text: (widget.recData['instructions'] == null) ? '' : widget.recData['instructions'].toString());


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
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: const LinearProgressIndicator(
                value: 3 / 3,
                semanticsLabel: "Progress of form completion",
                backgroundColor: Color(0xFFE7E7E7),
                color: Color(0xFF6FF163),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Text(
                "Step 3 of 3",
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF95A1AC),
                    fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20),
              child: Row(
                children: const [
                  Text(
                    "Notes:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19), fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: TextFormField(
                controller: notesController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'ex: notes of chocolate and coconut',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)),
                  filled: true,
                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                ),
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20),
              child: Row(
                children: const [
                  Text(
                    "Instructions:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19), fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: TextFormField(
                controller: instController,
                maxLines: 100,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)),
                  filled: true,
                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please explain your process';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.update(prev: true);
                      },
                      child: const Text('Previous'),
                    ),
                  ),
                  const Padding(padding: EdgeInsetsDirectional.only(start: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          
                          widget.notifyParent(
                            notesController.text,
                            instController.text
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Brew Submitted')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
