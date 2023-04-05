import 'package:flutter/material.dart';

const List<String> difficultyList = <String>['Novice', 'Adept', 'Cicerone'];
const List<String> categoryList = <String>['Lager', 'IPA', 'Other'];

class FormPage1 extends StatefulWidget {
  final Function(String, String, String, double, List<String>) notifyParent;
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
  



  static String? difficultyValue;
  static String? styleValue;
  static var isChecked = [false, false, false, false, false];
  final equipValues = ['1-Gal', '2-Gal', '5-Gal', 'Keg', 'Bottles'];

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController(text: (widget.recData['name'] == null) ? '' : widget.recData['name'].toString());
    final bitternessController = TextEditingController(text: (widget.recData['IBU'] == null) ? '' : widget.recData['IBU'].toString());

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
                //height: 45,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
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
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
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
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(134, 218, 218, 218),
                          ),
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: DropdownButton<String>(
                            value: difficultyValue,
                            elevation: 4,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            hint: const Text("Please select one"),
                            focusColor: Colors.transparent,
                            //elevation: 16,
                            //style: const TextStyle(color: Colors.deepPurple),
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
                                  style: TextStyle(
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
                        Padding(
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
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(134, 218, 218, 218),
                          ),
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: DropdownButton<String>(
                            value: styleValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            hint: const Text("Please select one"),
                            //elevation: 16,
                            focusColor: Colors.transparent,
                            //style: const TextStyle(color: Colors.deepPurple),
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
                                  style: TextStyle(
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
                    //SizedBox(width: MediaQuery.of(context).size.width / 4,),
                    
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Padding(
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
                          contentPadding: EdgeInsets.all(12),
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
                          fillColor: Color.fromARGB(134, 218, 218, 218),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter IBU';
                          } 
                          else if (double.tryParse(value) == null) {
                            return 'IBU must be a decimal value';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
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
                        
                        List<String> equip = [];
                        for (int i=0; i < equipValues.length; i++) {
                          if (isChecked[i]){
                            equip.add(equipValues[i]);
                          }
                        }
                        
                        widget.notifyParent(
                          nameController.text,
                          difficultyValue!,
                          styleValue!, 
                          double.parse(bitternessController.text),
                          equip
                        );

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