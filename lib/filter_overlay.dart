import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

double widgetWidth = 200;


class FilterOverlay extends StatefulWidget {
  const FilterOverlay({super.key});

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {

  static var equipList = [["1-Gal", false], ["2-Gal", false], ["5-Gal", false], ["Keg", false], ["Bottles", false]];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //height: 100,
      width: widgetWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(150, 255, 255, 255),
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
          Text("Equipment:"),
          Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children:List.generate(
              equipList.length,
              (index){
                return SizedBox(
                  width: 110,
                  child: CheckboxListTile(
                    title: Text(
                      equipList[index][0] as String,
                      style: TextStyle(fontSize: 10),
                      ),
                    value: equipList[index][1] as bool,
                    dense: true,
                    visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onChanged: (value) {
                      setState(() {
                        equipList[index][1] = value!;
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