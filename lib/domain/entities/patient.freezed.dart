// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get id => throw _privateConstructorUsedError;
  String get operatingRoomName => throw _privateConstructorUsedError;
  String get residentId => throw _privateConstructorUsedError;
  DateTime get surgeryStartTime => throw _privateConstructorUsedError;
  DateTime? get surgeryEndTime => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String id,
      String operatingRoomName,
      String residentId,
      DateTime surgeryStartTime,
      DateTime? surgeryEndTime,
      bool isActive,
      bool isDeleted,
      DateTime? deletedAt});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operatingRoomName = null,
    Object? residentId = null,
    Object? surgeryStartTime = null,
    Object? surgeryEndTime = freezed,
    Object? isActive = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      operatingRoomName: null == operatingRoomName
          ? _value.operatingRoomName
          : operatingRoomName // ignore: cast_nullable_to_non_nullable
              as String,
      residentId: null == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as String,
      surgeryStartTime: null == surgeryStartTime
          ? _value.surgeryStartTime
          : surgeryStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      surgeryEndTime: freezed == surgeryEndTime
          ? _value.surgeryEndTime
          : surgeryEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String operatingRoomName,
      String residentId,
      DateTime surgeryStartTime,
      DateTime? surgeryEndTime,
      bool isActive,
      bool isDeleted,
      DateTime? deletedAt});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operatingRoomName = null,
    Object? residentId = null,
    Object? surgeryStartTime = null,
    Object? surgeryEndTime = freezed,
    Object? isActive = null,
    Object? isDeleted = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$PatientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      operatingRoomName: null == operatingRoomName
          ? _value.operatingRoomName
          : operatingRoomName // ignore: cast_nullable_to_non_nullable
              as String,
      residentId: null == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as String,
      surgeryStartTime: null == surgeryStartTime
          ? _value.surgeryStartTime
          : surgeryStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      surgeryEndTime: freezed == surgeryEndTime
          ? _value.surgeryEndTime
          : surgeryEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {required this.id,
      required this.operatingRoomName,
      required this.residentId,
      required this.surgeryStartTime,
      this.surgeryEndTime,
      this.isActive = true,
      this.isDeleted = false,
      this.deletedAt});

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String id;
  @override
  final String operatingRoomName;
  @override
  final String residentId;
  @override
  final DateTime surgeryStartTime;
  @override
  final DateTime? surgeryEndTime;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Patient(id: $id, operatingRoomName: $operatingRoomName, residentId: $residentId, surgeryStartTime: $surgeryStartTime, surgeryEndTime: $surgeryEndTime, isActive: $isActive, isDeleted: $isDeleted, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.operatingRoomName, operatingRoomName) ||
                other.operatingRoomName == operatingRoomName) &&
            (identical(other.residentId, residentId) ||
                other.residentId == residentId) &&
            (identical(other.surgeryStartTime, surgeryStartTime) ||
                other.surgeryStartTime == surgeryStartTime) &&
            (identical(other.surgeryEndTime, surgeryEndTime) ||
                other.surgeryEndTime == surgeryEndTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      operatingRoomName,
      residentId,
      surgeryStartTime,
      surgeryEndTime,
      isActive,
      isDeleted,
      deletedAt);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final String id,
      required final String operatingRoomName,
      required final String residentId,
      required final DateTime surgeryStartTime,
      final DateTime? surgeryEndTime,
      final bool isActive,
      final bool isDeleted,
      final DateTime? deletedAt}) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String get id;
  @override
  String get operatingRoomName;
  @override
  String get residentId;
  @override
  DateTime get surgeryStartTime;
  @override
  DateTime? get surgeryEndTime;
  @override
  bool get isActive;
  @override
  bool get isDeleted;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
