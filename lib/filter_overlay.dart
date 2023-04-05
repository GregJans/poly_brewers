import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_annotation/json_annotation.dart';

double widgetWidth = 200;

var diffList = [
    {'title': "Novice", 'checked': true},
    {'title': 'Adept', 'checked': true},
    {'title': 'Cicerone', 'checked': true},
  ];

var equipList = [
    {'title': "1-Gal", 'checked': true},
    {'title': '2-Gal', 'checked': true},
    {'title': '5-Gal', 'checked': true},
    {'title': 'Keg', 'checked': true},
    {'title': 'Bottles', 'checked': true},
  ];

  var styleList = [
    {'title': "Lager", 'checked': true},
    {'title': 'IPA', 'checked': true},
    {'title': 'Other', 'checked': true},
  ];

class FilterOverlay extends StatefulWidget {
  const FilterOverlay({super.key});

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {

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
