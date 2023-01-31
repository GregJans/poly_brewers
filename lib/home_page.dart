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
    //fieldText will store the data entered into search bar
    final fieldText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Text("Poly Brewers"),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // may remove constraints later
                // used so that search bar is adaptive to width but does not get small enough for icons to overlap
                constraints: const BoxConstraints(
                  minWidth: 150,
                  maxWidth: 500
                ),
                width: MediaQuery.of(context).size.width - 700,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    controller: fieldText,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          fieldText.clear();
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

              // this will be the filter button
              IconButton(
                onPressed: () {
                  //do stuff
                },
                icon: const Icon(Icons.filter_alt_outlined)
              ),
            ],
          ),
        ),
        
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add a brew"),
        icon: const Icon(Icons.add),
        onPressed: (){
          debugPrint("Button pressed");
        },
        hoverColor: const Color(0xFFBE25AF),
        
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