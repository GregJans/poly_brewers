// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipie _$RecipieFromJson(Map<String, dynamic> json) => Recipie(
      difficulty: json['difficulty'] as String? ?? '',
      style: json['style'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
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
    );

Map<String, dynamic> _$RecipieToJson(Recipie instance) => <String, dynamic>{
      'difficulty': instance.difficulty,
      'style': instance.style,
      'rating': instance.rating,
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
    };

UserData _$UserFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String? ?? '',
      fname: json['fname'] as String? ?? '',
      lname: json['lname'] as String? ?? '',
      recipies: (json['recipies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'fname': instance.fname,
      'lname': instance.lname,
      'recipies': instance.recipies,
    };
