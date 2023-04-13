/*
  Description: Displays a single row of recipe cards. 
    Can be given a specific name to distinguish each category
    Will be given a querey to call to the database in order to populate the list
    Will be refreshed when the database data changes
    can be marked as un-filterable, menaing that any filters will not impact the list (such as the lists in profile page)

  Used By: profile_page.dart and recipe_page.dart

  Created By: Gregory Jans

*/

import 'dart:ui';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/filter_overlay.dart';
import 'package:poly_brewers/recipe_page.dart';
import 'package:poly_brewers/recipe_widget.dart';
import 'package:poly_brewers/services/models.dart';

// public array of all category lists on the website
// used to refresh all when the database is changed (ex: a user adds or saves a recipe)
// lists can be removed from here when they are destroyed
List<CategoryListState> cats = [];

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, required this.name, required this.query, this.filterable = false})
      : super(key: key);
  final String name;
  final Future<QuerySnapshot<Map<String, dynamic>>> query;
  final bool filterable;

  @override
  State<CategoryList> createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  List<Recipe> recipeList = [];
  int amount = 0;
  ScrollController scrollController = ScrollController();

  // only called once when the list is built
  // queries the database and gets the results
  Future initData() async {
    var data = await widget.query;
    // initial results before filtering
    List<Recipe> temp = List.from(data.docs.map((doc) => Recipe.fromJson(doc.data())));

    if (widget.filterable) {
      temp = applyFilters(temp);
    }

    if (mounted) {
      setState(() {
        recipeList = temp;
        amount = recipeList.length;
      });
    }

  }

  // Will gradually remove values from the provided list based on filter properties
  List<Recipe> applyFilters(List<Recipe> temp) {
    List<String> diffFilters = [];
    List<String> equipFilters= [];
    List<String> styleFilters = [];
    String search = textController.text;

    // remove any that dont match keywords in search
    if (search != '') {
      temp.removeWhere((element) => 
        !element.name.toLowerCase().contains(search.toLowerCase()) &&
        !element.notes.toLowerCase().contains(search.toLowerCase())
      );
    }
    // get list of difficulties that are checked
    diffList.forEach((element) {
      if(element['checked'] as bool) {
        diffFilters.add(element['title'] as String);
      }
    });
    // get list of equipment that are checked
    equipList.forEach((element) {
      if(element['checked'] as bool) {
        equipFilters.add(element['title'] as String);
      }
    });
    // get list of styles that are checked
    styleList.forEach((element) {
      if(element['checked'] as bool) {
        styleFilters.add(element['title'] as String);
      }
    });
    // remove anything that does not have something in the list of checked items
    temp.removeWhere((element) => !diffFilters.contains(element.difficulty));
    temp.removeWhere((element) => !styleFilters.contains(element.style));
    temp.removeWhere((element) {
      bool val = false;
      element.equip.forEach((e) {
        if (!equipFilters.contains(e)) val = true;
      });
      return val;
    });
    
    return temp;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initData();
    cats.add(this);
  }

  @override
  void dispose() {
    cats.remove(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    int displayed = min(((MediaQuery.of(context).size.width - 40) / 302).floor(), amount);
  
    // If the query gives nothing, the category list is removed
    return (amount == 0)
    ? const SizedBox()
    : Column(
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
            'Found $amount brews',
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

// Custom Scroll Controller to allow for the horizontal scroll bar to work on non-touch screens
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
