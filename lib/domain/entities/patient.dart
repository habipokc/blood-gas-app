import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String operatingRoomName,
    required String residentId,
    required DateTime surgeryStartTime,
    DateTime? surgeryEndTime,
    @Default(true) bool isActive,
    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
