import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';

class CategoryList extends StatelessWidget {
const CategoryList({ Key? key, required this.name}) : super(key: key);
final String name;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Divider(
              color: Colors.black,
              height: 25,
              thickness: 2,
              indent: 5,
              endIndent: 5,
          ),

          Row(
            children: [
              InkWell(
                onTap: () { 
                  //_animateToIndex(5);
                  // here when i press this i want to make horizontal list of specific index to scroll
                },
                child: const SizedBox(
                  height: 140,
                  width: 40,
                  child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey
                  ),
                ),
              ),

              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width - 110, //removing 110 to accomodate arrows
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index ) {
                      return const Recipe();
                    }
                  ),
                ),
              ),

              InkWell(
                onTap: () { 
                  //_animateToIndex(5);
                  // here when i press this i want to make horizontal list of specific index to scroll
                },
                child: const SizedBox(
                  height: 140,
                  width: 40,
                  child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey
                  ),
                ),
              ),
            ],
          ), 
        ]
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}