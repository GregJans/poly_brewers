import 'package:flutter/material.dart';


class FormPage2 extends StatefulWidget {
  final Function({bool prev}) notifyParent;
  const FormPage2({super.key, required this.notifyParent});
  

  @override
  FormPage2State createState() {
    return FormPage2State();
  }
}

class FormPage2State extends State<FormPage2> {

  final _formKey = GlobalKey<FormState>();

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
                  value: 2 / 3,
                  semanticsLabel: "Progress of form completion",
                  backgroundColor: const Color(0xFFE7E7E7),
                  color: const Color(0xFF6FF163),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Text(
                  "Step 2 of 3",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF95A1AC),
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            Padding(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gravity';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
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
                              width: 150,
                              child: TextFormField(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
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
                        padding: EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
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
                              width: 150,
                              child: TextFormField(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,

                          children: [
                            Padding(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gravity';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(
                              width: 50,
                              child: TextFormField(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
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
                        padding: EdgeInsetsDirectional.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(
                              width: 50,
                              child: TextFormField(
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
                                  fillColor: Color.fromARGB(134, 218, 218, 218),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
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
                padding: EdgeInsets.only(top: 100),
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
                          widget.notifyParent(prev: true); 
                        },
                        child: const Text('Previous'),
                      ),
                    ),
                    Padding(padding: EdgeInsetsDirectional.only(start: 10)),
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
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            /*
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Brew Submitted')),
                            );
                            Navigator.pop(context);
                            */
                            widget.notifyParent();
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