// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? image;

  Ingredient({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
