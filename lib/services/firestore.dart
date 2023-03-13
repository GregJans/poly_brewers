import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<Recipie> getRecipie(String recipieId) async {
    //Here is the variable which will store the data of our recipie
    var ref = _db.collection('Recipies').doc(recipieId);

    //Awaiting for the data to safely get here, and stores it's "snapshot"
    var snapshot = await ref.get();

    //Finally, fromJson, which returns the class of recipie
    return Recipie.fromJson(snapshot.data() ?? {});
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
}
