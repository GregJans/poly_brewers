import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:poly_brewers/services/auth.dart';
import 'package:poly_brewers/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Recipe> getRecipe(String recipieId) async {
    //Here is the variable which will store the data of our recipie
    var ref = _db.collection('Recipes').doc(recipieId);

    //Awaiting for the data to safely get here, and stores it's "snapshot"
    var snapshot = await ref.get();

    //Finally, fromJson, which returns the class of recipie
    return Recipe.fromJson(snapshot.data() ?? {});
  }

  Future sendRecipe(Recipe therec, UserData udata) async {
    var currentUser = AuthService().user!;

    String brewingNumber = _db.collection('Recipe').doc().id;
    therec.brewID = brewingNumber;
    await _db.collection('Recipe').doc(brewingNumber).set(therec.toJson());
    //udata.recipes.add(brewingNumber);
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

  void sendUserInfo() async {
    User? currUser = AuthService().user!;

    UserData newuser = UserData(uid: currUser.uid, fname: 'Nicholas III');

    await _db.collection('User').doc(currUser.uid).set(newuser.toJson());
  }
}
