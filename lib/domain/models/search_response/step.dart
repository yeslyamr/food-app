// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'equipment.dart';
import 'length.dart';
import 'short_ingredient.dart';

part 'step.g.dart';

@JsonSerializable()
class Step {
  int? number;
  String? step;
  List<ShortIngredient>? ingredients;
  List<Equipment>? equipment;
  Length? length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
  
  Map<String, dynamic> toJson() => _$StepToJson(this);
}
