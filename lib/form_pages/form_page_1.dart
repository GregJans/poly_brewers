/*
  Description: The first page of the brew form. 
    Used to iput name, difficulty, style, bitterness, brew time, required equipment
    Has a callback to brew_form to send the data that is entered and a seperate callback to change the page
    Takes in a JSON object as the current data for when a user returns to the first page from another form page

  Used By: brew_form.dart and profile_page.dart indirectly

  Created By: Gregory Jans

*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// left outside of a class to be public
const List<String> difficultyList = <String>['Novice', 'Adept', 'Cicerone'];
const List<String> categoryList = <String>['Lager', 'IPA', 'Other'];

class FormPage1 extends StatefulWidget {
  final Function(String, String, String, double, List<String>, int) notifyParent;
  final Function({bool prev}) update;
  final Map<String, dynamic> recData;
  const FormPage1({super.key, required this.notifyParent, required this.update, required this.recData});
  

  @override
  FormPage1State createState() {
    return FormPage1State();
  }
}

class FormPage1State extends State<FormPage1> {

  final _formKey = GlobalKey<FormState>();
  


  // static variables are used to remember what the user entered in case they want to go back from another page
  static String? difficultyValue;
  static String? styleValue;
  static var isChecked = [false, false, false, false, false];
  final equipValues = ['1-Gal', '2-Gal', '5-Gal', 'Keg', 'Bottles'];

  // controllers set the default values when the page loads and lets us get the data to send to parent
  late TextEditingController nameController;
  late TextEditingController bitternessController;
  late TextEditingController timeController;

  // function is only ever run on the first build, not subsequent builds
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    nameController = TextEditingController(text: (widget.recData['name'] == null) ? '' : widget.recData['name'].toString());
    bitternessController = TextEditingController(text: (widget.recData['IBU'] == null) ? '' : widget.recData['IBU'].toString());
    timeController = TextEditingController(text: (widget.recData['brewTime'] == null) ? '' : widget.recData['brewTime'].toString());
  }
  

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
                width: MediaQuery.of(context).size.width / 3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: const LinearProgressIndicator(
                  value: 1 / 3,
                  semanticsLabel: "Progress of form completion",
                  backgroundColor: Color(0xFFE7E7E7),
                  color: Color(0xFF6FF163),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Text(
                  "Step 1 of 3",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF95A1AC),
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: Row(
                  children: const [
                    Text(
                      "Name:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19),
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ), 
              SizedBox(
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    isDense: true,
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
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "Difficulty:",
                            style: TextStyle(
                              color: Color.fromARGB(255, 16, 18, 19),
                              fontSize: 14
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(134, 218, 218, 218),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: DropdownButton<String>(
                            value: difficultyValue,
                            elevation: 4,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            hint: const Text("Please select one"),
                            focusColor: Colors.transparent,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                difficultyValue = value!;
                              });
                            },
                            items: difficultyList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value, 
                                  style: const TextStyle(
                                    fontSize: 14
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),  
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "Style:",
                            style: TextStyle(
                              color: Color.fromARGB(255, 16, 18, 19),
                              fontSize: 14
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(134, 218, 218, 218),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: DropdownButton<String>(
                            value: styleValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            hint: const Text("Please select one"),
                            focusColor: Colors.transparent,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                styleValue = value!;
                              });
                            },
                            items: categoryList.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value, 
                                  style: const TextStyle(
                                    fontSize: 14
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ), 
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Bitterness:",
                        style: TextStyle(
                          color: Color.fromARGB(255, 16, 18, 19),
                          fontSize: 14
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        controller: bitternessController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'ex: 20',
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
                            return 'Please enter IBU';
                          } 
                          else if (double.tryParse(value) == null) {
                            return 'IBU must be a decimal value';
                          }
                          else if (double.parse(value) < 0 || double.parse(value) > 60) {
                            return 'Value out of range';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "IBU",
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
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Brew Time:",
                        style: TextStyle(
                          color: Color.fromARGB(255, 16, 18, 19),
                          fontSize: 14
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: TextFormField(
                        controller: timeController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'ex: 90',
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
                            return 'Please enter time';
                          } 
                          else if (int.tryParse(value) == null) {
                            return 'time must be an integer value';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "mins",
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
                    
              
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
                child: Row(
                  children: const [
                    Text(
                      "Required Equipment:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 18, 19),
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked[0], 
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[0] = value!;
                          });
                        }
                      ),
                      Text(equipValues[0]),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: isChecked[1], 
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[1] = value!;
                          });
                        }
                      ),
                      Text(equipValues[1]),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: isChecked[2], 
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[2] = value!;
                          });
                        }
                      ),
                      Text(equipValues[2]),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: isChecked[3], 
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[3] = value!;
                          });
                        }
                      ),
                      Text(equipValues[3]),
                    ]
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: isChecked[4], 
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[4] = value!;
                          });
                        }
                      ),
                      Text(equipValues[4]),
                    ]
                  ),  
                ],
              ),

            
              Padding(
                padding: const EdgeInsets.only(top: 100),
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
                        
                        List<String> equip = [];
                        for (int i=0; i < equipValues.length; i++) {
                          if (isChecked[i]){
                            equip.add(equipValues[i]);
                          }
                        }
                        // send the data to the parent
                        widget.notifyParent(
                          nameController.text,
                          difficultyValue!,
                          styleValue!, 
                          double.parse(bitternessController.text),
                          equip,
                          int.parse(timeController.text)
                        );
                        // refresh the page
                        widget.update();
                      }
                    },
                    child: const Text('Next'),
                  ),
                ),   
              ),  
            ],
          ),
        ),    
      );
  }
}