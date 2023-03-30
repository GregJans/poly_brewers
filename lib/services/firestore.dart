import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all recipies for display on home screen
  /*Future<List<Recipie>> getRecipies() async {
    var ref = _db.collection('Recipies');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var recipies = data.map((d) => Recipie.fromJson(d));
    return recipies.toList();
  }*/

  /// Retrieves a single recipie
  Future<Recipe> getRecipie(String recipieId) async {
    //Here is the variable which will store the data of our recipie
    var ref = _db.collection('Recipes').doc(recipieId);

    //Awaiting for the data to safely get here, and stores it's "snapshot"
    var snapshot = await ref.get();

    //Finally, fromJson, which returns the class of recipie
    return Recipe.fromJson(snapshot.data() ?? {});
  }

  void sendRecipe(Recipe therec, UserData currentUser) async {
    var user = AuthService().user!;

    String brewingNumber = _db.collection('Recipes').doc().id;
    therec.brewID = brewingNumber;
    await _db.collection('Recipes').doc(brewingNumber).set(therec.toJson());
    currentUser.recipes.add(brewingNumber);
  }

  Stream<UserData> getUserInfo() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('User').doc(user.uid);
        return ref.snapshots().map((doc) => UserData.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([UserData()]);
      }
    });
  }

  void sendUserInfo() {
    var user = AuthService().user!;
    var ref = _db.collection('User').doc(user.uid);

    UserData newUser = UserData(uid: user.uid, fname: 'Nicholas II');

    ref.set(newUser.toJson());
  }
}
