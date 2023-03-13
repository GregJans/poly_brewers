import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Recipie {
  final String difficulty;
  final String style;
  final double rating;
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

  Recipie(
      {this.difficulty = '',
      this.style = '',
      this.rating = 0.0,
      this.originalGravity = 0.0,
      this.finalGravity = 0.0,
      this.IBU = 0.0,
      this.brewTime = 0,
      this.yeast = '',
      this.grains = const [],
      this.hops = const [],
      this.hopsWeight = const [],
      this.extractName = const [],
      this.extractWeight = 0});

  factory Recipie.fromJson(Map<String, dynamic> json) =>
      _$RecipieFromJson(json);
  Map<String, dynamic> toJson() => _$RecipieToJson(this);
}

@JsonSerializable()
class UserData {
  final String uid;
  final String fname;
  final String lname;
  final List<String> recipies;

  UserData(
      {this.uid = '',
      this.fname = '',
      this.lname = '',
      this.recipies = const []});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
