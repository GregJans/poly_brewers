
import 'dart:ui';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:poly_brewers/category_list.dart';


class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int _current = 0;
    //final CarouselController _controller = CarouselController();
    //List<Recipe> wlist = List.generate(10, (index) => const Recipe());

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              CategoryList(name: "Laggers"),
              CategoryList(name: "IPA's"),
              CategoryList(name: "Malts"),
              CategoryList(name: "Others"),

            ],
          ),
          
          
          
          /*Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Laggers:",
                style: TextStyle(
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

              CarouselSlider(
                items: wlist,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 300,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                ),
              ),
            
              
  
              
              /*
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: wlist.asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              */
              
            ],
            
          ),
          */
          
        ),
      );
  }
}





        

