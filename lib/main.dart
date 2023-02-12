import 'package:flutter/material.dart';
import 'package:poly_brewers/home_page.dart';
import 'package:poly_brewers/recipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poly-Brewers',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}