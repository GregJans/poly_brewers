import 'package:flutter/material.dart';
import 'package:poly_brewers/home_page.dart';
import 'package:poly_brewers/recipe_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:poly_brewers/services/firestore.dart';
import 'package:poly_brewers/services/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text(
            'error',
            textDirection: TextDirection.ltr,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //Stream provider hands data about current user stream to the rest of
          //app down the tree

          //Add multiprovider here, particularly for FutureProvider!
          return MultiProvider(
              providers: [
                StreamProvider<UserData>(
                  create: (_) => FirestoreService().getUserInfo(),
                  initialData: UserData(),
                ),
                FutureProvider<Recipe>(
                    create: (_) =>
                        FirestoreService().getRecipe(Recipe().brewID),
                    initialData: Recipe())
              ],
              //maybe add checker widget here, then add material app to checker?
              child: MaterialApp(
                title: 'Poly-Brewers',
                theme: ThemeData(
                  primarySwatch: Colors.brown,
                  fontFamily: 'Poppins',
                ),
                debugShowCheckedModeBanner: false,
                home: const HomePage(),
              ));

          //maybe add checker widget here, then add material app to checker?
          // ignore: dead_code
          /*MaterialApp(
            title: 'Poly-Brewers',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              fontFamily: 'Poppins',
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );*/
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text(
          'loading...',
          textDirection: TextDirection.ltr,
        );
      },
    );
  }

/*class MyApp extends StatelessWidget {
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
      home: const CheckLoggedIn(),
    );
  }*/
}
