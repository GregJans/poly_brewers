import 'dart:ui';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/recipe_widget.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/models.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, required this.name, required this.query})
      : super(key: key);
  final String name;
  final Future<QuerySnapshot<Map<String, dynamic>>> query;

  @override
  State<CategoryList> createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  List<Recipe> recipeList = [];
  int amount = 0;
  ScrollController scrollController = ScrollController();


  Future initData() async {
    var data = await widget.query;

    setState(() {
      recipeList = List.from(data.docs.map((doc) => Recipe.fromJson(doc.data())));
      amount = recipeList.length;
    });
  }

  void refresh() {
    print("refreshing " + widget.name);
    initData();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initData();
  }

  @override
  Widget build(BuildContext context) {

    int displayed = min(((MediaQuery.of(context).size.width - 40) / 302).floor(), amount);
  
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Text(
            widget.name,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Color.fromARGB(255, 87, 99, 108)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
          child: Text(
            'Found ${amount} brews',
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromARGB(255, 87, 99, 108)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 244, 248),
            ),
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: (displayed < amount),
                child: ListView.builder(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: amount,
                  itemBuilder: (context, index) => RecipeCard(
                      recipe: recipeList[index],
                  ),
                ),
              ), 
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
