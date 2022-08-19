// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'us_measure.g.dart';

@JsonSerializable(explicitToJson: true)
class Us {
  double? amount;
  String? unitShort;
  String? unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  factory Us.fromJson(Map<String, dynamic> json) => _$UsFromJson(json);
  
  Map<String, dynamic> toJson() => _$UsToJson(this);
}
