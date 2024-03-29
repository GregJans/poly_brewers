import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Recipe {
  String brewID;
  final String name;
  final String author;
  final String difficulty;
  final String style;
  final double ratingTotal;
  final int ratingsNum;
  final double originalGravity;
  final double finalGravity;
  final double IBU;
  final int brewTime;
  final String yeast;
  final List<String> grains;
  final List<String> hops;
  final List<int> hopsWeight;
  final List<String> extractName;
  final int extractWeight;
  final String notes;
  final String instructions;
  final List<String> equip;

  Recipe(
      {this.brewID = '',
      this.name = '',
      this.author = '',
      this.difficulty = '',
      this.style = '',
      this.ratingTotal = 0.0,
      this.ratingsNum = 0,
      this.originalGravity = 0.0,
      this.finalGravity = 0.0,
      this.IBU = 0.0,
      this.brewTime = 0,
      this.yeast = '',
      this.grains = const [],
      this.hops = const [],
      this.hopsWeight = const [],
      this.extractName = const [],
      this.extractWeight = 0,
      this.notes = '',
      this.instructions = '',
      this.equip = const []
      });


  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipieFromJson(json);
  Map<String, dynamic> toJson() => _$RecipieToJson(this);
}

@JsonSerializable()
class UserData {
  final String uid;
  final String fname;
  final String lname;
  final List<String> recipes;

  UserData(
      {this.uid = '',
      this.fname = '',
      this.lname = '',
      this.recipes = const []});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
