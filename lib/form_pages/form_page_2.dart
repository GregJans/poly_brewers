import 'package:flutter/material.dart';


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
                child: LinearProgressIndicator(
                  value: 2 / 3,
                  semanticsLabel: "Progress of form completion",
                  backgroundColor: const Color(0xFFE7E7E7),
                  color: const Color(0xFF6FF163),
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