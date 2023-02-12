import 'package:flutter/material.dart';
import 'package:poly_brewers/profile_page.dart';
import 'package:poly_brewers/recipe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentPage = 0;
  final pages = [const MainRecipePageWidget(), const ProfilePage()];

  @override 
  Widget build(BuildContext context) {
    //fieldText will store the data entered into search bar
    //final fieldText = TextEditingController();

    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")],

        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}