// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'step.dart';

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'analyzed_instructions.g.dart';

@JsonSerializable(explicitToJson: true)
class AnalyzedInstruction {
  String? name;
  List<Step>? steps;
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzedInstructionToJson(this);
}
