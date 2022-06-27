// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'us_measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Us _$UsFromJson(Map<String, dynamic> json) => Us(
      amount: (json['amount'] as num?)?.toDouble(),
      unitShort: json['unitShort'] as String?,
      unitLong: json['unitLong'] as String?,
    );

Map<String, dynamic> _$UsToJson(Us instance) => <String, dynamic>{
      'amount': instance.amount,
      'unitShort': instance.unitShort,
      'unitLong': instance.unitLong,
    };
