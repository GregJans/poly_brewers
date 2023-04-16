/*
  Description: The FirestoreService class, the primary method of creating a
  communication channel between the front end and our firestore database.

  Used By: home_page.dart, profile_page.dart, recipe_page.dart, recipe_widget.dart

  Created By: Nicholas Porter

*/

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
    //Get user data from firestore auth
    var currentUser = AuthService().user!;

    //Generate unique recipe id
    String brewingNumber = _db.collection('Recipe').doc().id;

    //Set recipe id
    therec.brewID = brewingNumber;

    //Send recipe
    await _db.collection('Recipe').doc(brewingNumber).set(therec.toJson());
  }

  Stream<UserData> getUserInfo() {
    //Switch map, which takes the map model of the user and "switches" it to
    //an object
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        //Find user entry in database
        var ref = _db.collection('User').doc(user.uid);
        //Return the found datain the form of a map
        return ref.snapshots().map((doc) => UserData.fromJson(doc.data()!));
      } else {
        //If no user, then return an empty UserData.
        return Stream.fromIterable([UserData()]);
      }
    });
  }

  void sendUserInfo() async {
    //Get authentication service user data
    User? currUser = AuthService().user!;
    //Create new userData object
    UserData newuser = UserData(uid: currUser.uid);
    //create entry in database.
    await _db.collection('User').doc(currUser.uid).set(newuser.toJson());
  }
}
