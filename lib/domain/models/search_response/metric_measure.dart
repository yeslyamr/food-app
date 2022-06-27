// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'metric_measure.g.dart';

@JsonSerializable()
class Metric {
  double? amount;
  String? unitShort;
  String? unitLong;

  Metric({this.amount, this.unitShort, this.unitLong});

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
  
  Map<String, dynamic> toJson() => _$MetricToJson(this);

}
