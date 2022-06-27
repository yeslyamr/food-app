// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'length.g.dart';

@JsonSerializable()
class Length {
  int? number;
  String? unit;

  Length({this.number, this.unit});

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);

  Map<String, dynamic> toJson() => _$LengthToJson(this);
}
