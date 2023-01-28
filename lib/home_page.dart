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
  final pages = [const RecipePage(), const ProfilePage()];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poly-Brewers"),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add a brew"),
        icon: const Icon(Icons.add),
        onPressed: (){
          debugPrint("Button pressed");
        },
        hoverColor: Colors.purple,
        
      ),

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