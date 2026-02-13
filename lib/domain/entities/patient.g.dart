// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String,
      operatingRoomName: json['operatingRoomName'] as String,
      residentId: json['residentId'] as String,
      surgeryStartTime: DateTime.parse(json['surgeryStartTime'] as String),
      surgeryEndTime: json['surgeryEndTime'] == null
          ? null
          : DateTime.parse(json['surgeryEndTime'] as String),
      isActive: json['isActive'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operatingRoomName': instance.operatingRoomName,
      'residentId': instance.residentId,
      'surgeryStartTime': instance.surgeryStartTime.toIso8601String(),
      'surgeryEndTime': instance.surgeryEndTime?.toIso8601String(),
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
