// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      id: json['id'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      unitLong: json['unitLong'] as String?,
      unitShort: json['unitShort'] as String?,
      aisle: json['aisle'] as String?,
      name: json['name'] as String?,
      original: json['original'] as String?,
      originalName: json['originalName'] as String?,
      meta: (json['meta'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'unit': instance.unit,
      'unitLong': instance.unitLong,
      'unitShort': instance.unitShort,
      'aisle': instance.aisle,
      'name': instance.name,
      'original': instance.original,
      'originalName': instance.originalName,
      'meta': instance.meta,
      'image': instance.image,
    };
