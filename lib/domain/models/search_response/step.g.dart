// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      number: json['number'] as int?,
      step: json['step'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => ShortIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      equipment: (json['equipment'] as List<dynamic>?)
          ?.map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      length: json['length'] == null
          ? null
          : Length.fromJson(json['length'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'ingredients': instance.ingredients,
      'equipment': instance.equipment,
      'length': instance.length,
    };
