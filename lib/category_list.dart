import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({ Key? key, required this.name, required this.amount}) : super(key: key);
  final String name;
  final int amount;

  @override
  Widget build(BuildContext context){

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Color.fromARGB(255, 87, 99, 108)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
          child: Text(
            'Over $amount brews',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color.fromARGB(255, 87, 99, 108)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 206,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 244, 248),
            ),
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: amount,
                itemBuilder: (context, index) => const Recipe(name: "Beer name", rating: 4.5,),
              ),
            )
          ),
        ),
      ],
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