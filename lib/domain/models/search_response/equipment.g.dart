// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'] as int?,
      name: json['name'] as String?,
      localizedName: json['localizedName'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'localizedName': instance.localizedName,
      'image': instance.image,
    };
