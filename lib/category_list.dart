import 'dart:ui';
import 'dart:math';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.name, required this.amount})
      : super(key: key);
  final String name;
  final int amount;

  @override
  Widget build(BuildContext context) {
    int displayed =
        min(((MediaQuery.of(context).size.width - 40) / 302).floor(), amount);

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
                color: Color.fromARGB(255, 87, 99, 108)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
          child: Text(
            'Found $amount brews',
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromARGB(255, 87, 99, 108)),
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
            child: Row(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: displayed,
                  itemBuilder: (context, index) => const Recipe(
                    name: "Beer name",
                    rating: 4.5,
                  ),
                ),
                if (amount > displayed)
                  IconButton(
                    onPressed: () {
                      // when pressed, wipe screen and only show these (same as if they searched in the bar for this category)
                      debugPrint("viewing all");
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
