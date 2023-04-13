/*
  Description: The second page of the brew form. 
    Used to iput OG, FG, extracts, extract lbs, hops, hops oz, yeast, and grains
    Has a callback to brew_form to send the data that is entered and a seperate callback to change the page
    Takes in a JSON object as the current data for when a user returns to this page from another form page

  Used By: brew_form.dart and profile_page.dart indirectly

  Created By: Gregory Jans

*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FormPage2 extends StatefulWidget {
  final Function(double, double, List<String>, int, List<String>, List<int>, String, List<String>) notifyParent;
  final Function({bool prev}) update;
  final Map<String, dynamic> recData;
  const FormPage2({super.key, required this.notifyParent, required this.update, required this.recData});
  

  @override
  FormPage2State createState() {
    return FormPage2State();
  }
}

class FormPage2State extends State<FormPage2> {

  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    // controllers set the default values when the page loads and lets us get the data to send to parent
    final ogController = TextEditingController(text: (widget.recData['originalGravity'] == null) ? '' : widget.recData['originalGravity'].toString());
    final fgController = TextEditingController(text: (widget.recData['finalGravity'] == null) ? '' : widget.recData['finalGravity'].toString());
    final extractController = TextEditingController(text: (widget.recData['extractName'] == null) ? '' : widget.recData['extractName'].join(', '));
    final eLbsController = TextEditingController(text: (widget.recData['extractWeight'] == null) ? '' : widget.recData['extractWeight'].toString());
    final hopsController = TextEditingController(text: (widget.recData['hops'] == null) ? '' : widget.recData['hops'].join(', '));
    final hopsOzController = TextEditingController(text: (widget.recData['hopsWeight'] == null) ? '' : widget.recData['hopsWeight'].join(', '));
    final yeastController = TextEditingController(text: (widget.recData['yeast'] == null) ? '' : widget.recData['yeast'].toString());
    final grainsController = TextEditingController(text: (widget.recData['grains'] == null) ? '' : widget.recData['grains'].join(', '));


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
                child: const LinearProgressIndicator(
                  value: 2 / 3,
                  semanticsLabel: "Progress of form completion",
                  backgroundColor: Color(0xFFE7E7E7),
                  color: Color(0xFF6FF163),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 32),
                child: Text(
                  "Step 2 of 3",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF95A1AC),
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                        padding: const EdgeInsetsDirectional.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "Original Gravity:",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: ogController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: 1.000',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gravity';
                                  } 
                                  else if (double.tryParse(value) == null) {
                                    return 'Gravity must be a decimal value';
                                  }
                                  else if (double.parse(value) < 1.000 || double.parse(value) > 1.190) {
                                    return 'Value out of range';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                  Padding(
                        padding: const EdgeInsetsDirectional.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "Final Gravity:",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: fgController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: 1.120',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gravity';
                                  } 
                                  else if (double.tryParse(value) == null) {
                                    return 'Gravity must be a decimal value';
                                  }
                                  else if (double.parse(value) < 1.000 || double.parse(value) > 1.190) {
                                    return 'Value out of range';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "Extract:",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                controller: extractController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: extract1, extract2',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter extracts';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "Hops:",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                controller: hopsController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: hops1, hops2',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter hops';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(
                              width: 65,
                              child: TextFormField(
                                controller: eLbsController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: 3',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter value';
                                  } 
                                  else if (int.tryParse(value) == null) {
                                    return 'Value must be a number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "lbs",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(
                              width: 130,
                              child: TextFormField(
                                controller: hopsOzController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ex: 1, 3',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.red)
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  else if (value.split(', ').length != hopsController.text.split(', ').length) {
                                    return 'Hops and weight list must be the same length';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "oz",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 16, 18, 19),
                                  fontSize: 14
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 30),
                child: Row(
                  children: const [
                    Text(
                      "Yeast:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19),
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ), 
              SizedBox(
                //height: 45,
                child: TextFormField(
                  controller: yeastController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'ex: yeast',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(134, 218, 218, 218),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter yeast';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(top: 30),
                child: Row(
                  children: const [
                    Text(
                      "Specific Grains:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19),
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ), 
              SizedBox(
                //height: 45,
                child: TextFormField(
                  controller: grainsController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'ex: grains1, grains2, ...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(134, 218, 218, 218),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter grains';
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
                      borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
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
                      borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            
                            widget.notifyParent(
                              double.parse(ogController.text),
                              double.parse(fgController.text),
                              extractController.text.split(', '),
                              int.parse(eLbsController.text),
                              hopsController.text.split(', '),
                              hopsOzController.text.split(', ').map(int.parse).toList(),
                              yeastController.text,
                              grainsController.text.split(', ')
                              );

                            widget.update();
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),      
                  ],
                )
                
                
              ),  
            ],
          ),
        ),    
      );
  }
}