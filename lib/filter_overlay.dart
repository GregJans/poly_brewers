import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_annotation/json_annotation.dart';

double widgetWidth = 200;

class FilterOverlay extends StatefulWidget {
  const FilterOverlay({super.key});

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {
  
  static var equipList = [
    {'title': "1-Gal", 'checked': false},
    {'title': '2-Gal', 'checked': false},
    {'title': '5-Gal', 'checked': false},
    {'title': 'Keg', 'checked': false},
    {'title': 'Bottles', 'checked': false},
  ];

  static var diffList = [
    {'title': "Novice", 'checked': false},
    {'title': 'Adept', 'checked': false},
    {'title': 'Cicerone', 'checked': false},
  ];

  static var styleList = [
    {'title': "Lager", 'checked': false},
    {'title': 'IPA', 'checked': false},
    {'title': 'Other', 'checked': false},
  ];
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: widgetWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
          topLeft: Radius.circular(4),
          topRight: Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text("Equipment"),
            children: List.generate(
              equipList.length,
              (index) {
                return SizedBox(
                  width: widgetWidth,
                  child: CheckboxListTile(
                    title: Text(
                      equipList[index]['title'] as String,
                    ),
                    value: equipList[index]['checked'] as bool,
                    dense: true,
                    onChanged: (value) {
                      setState(() {
                        equipList[index]['checked'] = value!;
                      });
                    },
                  ),
                );
              },
            ), 
          ),

          ExpansionTile(
            title: Text("Difficulty"),
            children: List.generate(
              diffList.length,
              (index) {
                return SizedBox(
                  width: widgetWidth,
                  child: CheckboxListTile(
                    title: Text(
                      diffList[index]['title'] as String,
                    ),
                    value: diffList[index]['checked'] as bool,
                    dense: true,
                    onChanged: (value) {
                      setState(() {
                        diffList[index]['checked'] = value!;
                      });
                    },
                  ),
                );
              },
            ), 
          ),

          ExpansionTile(
            title: Text("Style"),
            children: List.generate(
              styleList.length,
              (index) {
                return SizedBox(
                  width: widgetWidth,
                  child: CheckboxListTile(
                    title: Text(
                      styleList[index]['title'] as String,
                    ),
                    value: styleList[index]['checked'] as bool,
                    dense: true,
                    onChanged: (value) {
                      setState(() {
                        styleList[index]['checked'] = value!;
                      });
                    },
                  ),
                );
              },
            ), 
          ),
        ],
      ),
    );
  }
}
