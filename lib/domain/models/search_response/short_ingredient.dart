// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'short_ingredient.g.dart';

@JsonSerializable()
class ShortIngredient {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  ShortIngredient({this.id, this.name, this.localizedName, this.image});

  factory ShortIngredient.fromJson(Map<String, dynamic> json) =>
      _$ShortIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$ShortIngredientToJson(this);
}
