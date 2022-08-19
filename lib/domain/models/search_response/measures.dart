// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'metric_measure.dart';
import 'us_measure.dart';

part 'measures.g.dart';

@JsonSerializable(explicitToJson: true)
class Measures {
  Us? us;
  Metric? metric;

  Measures({this.us, this.metric});

  factory Measures.fromJson(Map<String, dynamic> json) =>
      _$MeasuresFromJson(json);

  Map<String, dynamic> toJson() => _$MeasuresToJson(this);
}
