// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipieFromJson(Map<String, dynamic> json) => Recipe(
      brewID: json['brewID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      author: json['author'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? '',
      style: json['style'] as String? ?? '',
      ratingTotal: (json['ratingTotal'] as num?)?.toDouble() ?? 0.0,
      ratingsNum: (json['ratingsNum'] as num?)?.toInt() ?? 0,
      originalGravity: (json['originalGravity'] as num?)?.toDouble() ?? 0.0,
      finalGravity: (json['finalGravity'] as num?)?.toDouble() ?? 0.0,
      IBU: (json['IBU'] as num?)?.toDouble() ?? 0.0,
      brewTime: json['brewTime'] as int? ?? 0,
      yeast: json['yeast'] as String? ?? '',
      grains: (json['grains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hops:
          (json['hops'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      hopsWeight: (json['hopsWeight'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      extractName: (json['extractName'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      extractWeight: json['extractWeight'] as int? ?? 0,
      notes: json['notes'] as String? ?? '',
      instructions: json['instructions'] as String? ?? '',
      equip: (json['equip'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecipieToJson(Recipe instance) => <String, dynamic>{
      'brewID': instance.brewID,
      'name': instance.name,
      'author': instance.author,
      'difficulty': instance.difficulty,
      'style': instance.style,
      'ratingTotal': instance.ratingTotal,
      'ratingsNum': instance.ratingsNum,
      'originalGravity': instance.originalGravity,
      'finalGravity': instance.finalGravity,
      'IBU': instance.IBU,
      'brewTime': instance.brewTime,
      'yeast': instance.yeast,
      'grains': instance.grains,
      'hops': instance.hops,
      'hopsWeight': instance.hopsWeight,
      'extractName': instance.extractName,
      'extractWeight': instance.extractWeight,
      'notes': instance.notes,
      'instructions': instance.instructions,
      'equip': instance.equip
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String? ?? '',
      fname: json['fname'] as String? ?? '',
      lname: json['lname'] as String? ?? '',
      recipes: (json['recipies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'fname': instance.fname,
      'lname': instance.lname,
      'recipies': instance.recipes,
    };
