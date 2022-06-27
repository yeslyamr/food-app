// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable()
class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Equipment({this.id, this.name, this.localizedName, this.image});

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
