import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';

class CategoryList extends StatelessWidget {
const CategoryList({ Key? key, required this.name}) : super(key: key);
final String name;

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
        const Padding(
          padding:
              EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
          child: Text(
            'Over 30 cattegories',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color.fromARGB(255, 87, 99, 108)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 206,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 244, 248),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => const Recipe(),
            ),
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