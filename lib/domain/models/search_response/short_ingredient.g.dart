// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortIngredient _$ShortIngredientFromJson(Map<String, dynamic> json) =>
    ShortIngredient(
      id: json['id'] as int?,
      name: json['name'] as String?,
      localizedName: json['localizedName'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ShortIngredientToJson(ShortIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'localizedName': instance.localizedName,
      'image': instance.image,
    };
