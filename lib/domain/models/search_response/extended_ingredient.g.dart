// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    ExtendedIngredient(
      id: json['id'] as int?,
      aisle: json['aisle'] as String?,
      image: json['image'] as String?,
      consistency: json['consistency'] as String?,
      name: json['name'] as String?,
      nameClean: json['nameClean'] as String?,
      original: json['original'] as String?,
      originalName: json['originalName'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      meta: (json['meta'] as List<dynamic>?)?.map((e) => e as String).toList(),
      measures: json['measures'] == null
          ? null
          : Measures.fromJson(json['measures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedIngredientToJson(ExtendedIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aisle': instance.aisle,
      'image': instance.image,
      'consistency': instance.consistency,
      'name': instance.name,
      'nameClean': instance.nameClean,
      'original': instance.original,
      'originalName': instance.originalName,
      'amount': instance.amount,
      'unit': instance.unit,
      'meta': instance.meta,
      'measures': instance.measures?.toJson(),
    };
