// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_gas_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodGasRecord _$BloodGasRecordFromJson(Map<String, dynamic> json) {
  return _BloodGasRecord.fromJson(json);
}

/// @nodoc
mixin _$BloodGasRecord {
  String get id => throw _privateConstructorUsedError;
  String get patientId => throw _privateConstructorUsedError;
  DateTime get timestamp =>
      throw _privateConstructorUsedError; // BloodGasValues
  double? get pH => throw _privateConstructorUsedError;
  double? get pCO2 => throw _privateConstructorUsedError; // mmHg
  double? get pO2 => throw _privateConstructorUsedError; // mmHg
// Oximetry Values
  double? get ctHb => throw _privateConstructorUsedError; // g/dL
  double? get hctc => throw _privateConstructorUsedError; // %
  double? get sO2 => throw _privateConstructorUsedError; // %
  double? get fO2Hb => throw _privateConstructorUsedError; // %
  double? get fCOHb => throw _privateConstructorUsedError; // %
  double? get fHHb => throw _privateConstructorUsedError; // %
  double? get fMetHb => throw _privateConstructorUsedError; // %
// Electrolyte Values
  double? get cNa => throw _privateConstructorUsedError; // mmol/L
  double? get cK => throw _privateConstructorUsedError; // mmol/L
  double? get cCa => throw _privateConstructorUsedError; // mmol/L
  double? get cCl => throw _privateConstructorUsedError; // mmol/L
// Metabolite Values
  double? get cGlu => throw _privateConstructorUsedError; // mmol/L
  double? get cLac => throw _privateConstructorUsedError; // mmol/L
  double? get ctBil => throw _privateConstructorUsedError; // mmol/L
  double? get mOsmc => throw _privateConstructorUsedError; // mmol/kg
// Temperature Corrected
  double? get phT => throw _privateConstructorUsedError;
  double? get pCO2T => throw _privateConstructorUsedError; // kPa
  double? get pO2T => throw _privateConstructorUsedError; // kPa
// Oxygen Status
  double? get ctO2c => throw _privateConstructorUsedError; // vol%
  double? get p50c => throw _privateConstructorUsedError; // kPa
// Acid Base Status
  double? get cBaseB => throw _privateConstructorUsedError; // mmol/L
  double? get cBaseEcf => throw _privateConstructorUsedError; // mmol/L
  double? get cHCO3Pst => throw _privateConstructorUsedError; // mmol/L
  double? get cHCO3P => throw _privateConstructorUsedError;

  /// Serializes this BloodGasRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodGasRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodGasRecordCopyWith<BloodGasRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodGasRecordCopyWith<$Res> {
  factory $BloodGasRecordCopyWith(
          BloodGasRecord value, $Res Function(BloodGasRecord) then) =
      _$BloodGasRecordCopyWithImpl<$Res, BloodGasRecord>;
  @useResult
  $Res call(
      {String id,
      String patientId,
      DateTime timestamp,
      double? pH,
      double? pCO2,
      double? pO2,
      double? ctHb,
      double? hctc,
      double? sO2,
      double? fO2Hb,
      double? fCOHb,
      double? fHHb,
      double? fMetHb,
      double? cNa,
      double? cK,
      double? cCa,
      double? cCl,
      double? cGlu,
      double? cLac,
      double? ctBil,
      double? mOsmc,
      double? phT,
      double? pCO2T,
      double? pO2T,
      double? ctO2c,
      double? p50c,
      double? cBaseB,
      double? cBaseEcf,
      double? cHCO3Pst,
      double? cHCO3P});
}

/// @nodoc
class _$BloodGasRecordCopyWithImpl<$Res, $Val extends BloodGasRecord>
    implements $BloodGasRecordCopyWith<$Res> {
  _$BloodGasRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodGasRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? timestamp = null,
    Object? pH = freezed,
    Object? pCO2 = freezed,
    Object? pO2 = freezed,
    Object? ctHb = freezed,
    Object? hctc = freezed,
    Object? sO2 = freezed,
    Object? fO2Hb = freezed,
    Object? fCOHb = freezed,
    Object? fHHb = freezed,
    Object? fMetHb = freezed,
    Object? cNa = freezed,
    Object? cK = freezed,
    Object? cCa = freezed,
    Object? cCl = freezed,
    Object? cGlu = freezed,
    Object? cLac = freezed,
    Object? ctBil = freezed,
    Object? mOsmc = freezed,
    Object? phT = freezed,
    Object? pCO2T = freezed,
    Object? pO2T = freezed,
    Object? ctO2c = freezed,
    Object? p50c = freezed,
    Object? cBaseB = freezed,
    Object? cBaseEcf = freezed,
    Object? cHCO3Pst = freezed,
    Object? cHCO3P = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pH: freezed == pH
          ? _value.pH
          : pH // ignore: cast_nullable_to_non_nullable
              as double?,
      pCO2: freezed == pCO2
          ? _value.pCO2
          : pCO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      pO2: freezed == pO2
          ? _value.pO2
          : pO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      ctHb: freezed == ctHb
          ? _value.ctHb
          : ctHb // ignore: cast_nullable_to_non_nullable
              as double?,
      hctc: freezed == hctc
          ? _value.hctc
          : hctc // ignore: cast_nullable_to_non_nullable
              as double?,
      sO2: freezed == sO2
          ? _value.sO2
          : sO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      fO2Hb: freezed == fO2Hb
          ? _value.fO2Hb
          : fO2Hb // ignore: cast_nullable_to_non_nullable
              as double?,
      fCOHb: freezed == fCOHb
          ? _value.fCOHb
          : fCOHb // ignore: cast_nullable_to_non_nullable
              as double?,
      fHHb: freezed == fHHb
          ? _value.fHHb
          : fHHb // ignore: cast_nullable_to_non_nullable
              as double?,
      fMetHb: freezed == fMetHb
          ? _value.fMetHb
          : fMetHb // ignore: cast_nullable_to_non_nullable
              as double?,
      cNa: freezed == cNa
          ? _value.cNa
          : cNa // ignore: cast_nullable_to_non_nullable
              as double?,
      cK: freezed == cK
          ? _value.cK
          : cK // ignore: cast_nullable_to_non_nullable
              as double?,
      cCa: freezed == cCa
          ? _value.cCa
          : cCa // ignore: cast_nullable_to_non_nullable
              as double?,
      cCl: freezed == cCl
          ? _value.cCl
          : cCl // ignore: cast_nullable_to_non_nullable
              as double?,
      cGlu: freezed == cGlu
          ? _value.cGlu
          : cGlu // ignore: cast_nullable_to_non_nullable
              as double?,
      cLac: freezed == cLac
          ? _value.cLac
          : cLac // ignore: cast_nullable_to_non_nullable
              as double?,
      ctBil: freezed == ctBil
          ? _value.ctBil
          : ctBil // ignore: cast_nullable_to_non_nullable
              as double?,
      mOsmc: freezed == mOsmc
          ? _value.mOsmc
          : mOsmc // ignore: cast_nullable_to_non_nullable
              as double?,
      phT: freezed == phT
          ? _value.phT
          : phT // ignore: cast_nullable_to_non_nullable
              as double?,
      pCO2T: freezed == pCO2T
          ? _value.pCO2T
          : pCO2T // ignore: cast_nullable_to_non_nullable
              as double?,
      pO2T: freezed == pO2T
          ? _value.pO2T
          : pO2T // ignore: cast_nullable_to_non_nullable
              as double?,
      ctO2c: freezed == ctO2c
          ? _value.ctO2c
          : ctO2c // ignore: cast_nullable_to_non_nullable
              as double?,
      p50c: freezed == p50c
          ? _value.p50c
          : p50c // ignore: cast_nullable_to_non_nullable
              as double?,
      cBaseB: freezed == cBaseB
          ? _value.cBaseB
          : cBaseB // ignore: cast_nullable_to_non_nullable
              as double?,
      cBaseEcf: freezed == cBaseEcf
          ? _value.cBaseEcf
          : cBaseEcf // ignore: cast_nullable_to_non_nullable
              as double?,
      cHCO3Pst: freezed == cHCO3Pst
          ? _value.cHCO3Pst
          : cHCO3Pst // ignore: cast_nullable_to_non_nullable
              as double?,
      cHCO3P: freezed == cHCO3P
          ? _value.cHCO3P
          : cHCO3P // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodGasRecordImplCopyWith<$Res>
    implements $BloodGasRecordCopyWith<$Res> {
  factory _$$BloodGasRecordImplCopyWith(_$BloodGasRecordImpl value,
          $Res Function(_$BloodGasRecordImpl) then) =
      __$$BloodGasRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String patientId,
      DateTime timestamp,
      double? pH,
      double? pCO2,
      double? pO2,
      double? ctHb,
      double? hctc,
      double? sO2,
      double? fO2Hb,
      double? fCOHb,
      double? fHHb,
      double? fMetHb,
      double? cNa,
      double? cK,
      double? cCa,
      double? cCl,
      double? cGlu,
      double? cLac,
      double? ctBil,
      double? mOsmc,
      double? phT,
      double? pCO2T,
      double? pO2T,
      double? ctO2c,
      double? p50c,
      double? cBaseB,
      double? cBaseEcf,
      double? cHCO3Pst,
      double? cHCO3P});
}

/// @nodoc
class __$$BloodGasRecordImplCopyWithImpl<$Res>
    extends _$BloodGasRecordCopyWithImpl<$Res, _$BloodGasRecordImpl>
    implements _$$BloodGasRecordImplCopyWith<$Res> {
  __$$BloodGasRecordImplCopyWithImpl(
      _$BloodGasRecordImpl _value, $Res Function(_$BloodGasRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodGasRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? timestamp = null,
    Object? pH = freezed,
    Object? pCO2 = freezed,
    Object? pO2 = freezed,
    Object? ctHb = freezed,
    Object? hctc = freezed,
    Object? sO2 = freezed,
    Object? fO2Hb = freezed,
    Object? fCOHb = freezed,
    Object? fHHb = freezed,
    Object? fMetHb = freezed,
    Object? cNa = freezed,
    Object? cK = freezed,
    Object? cCa = freezed,
    Object? cCl = freezed,
    Object? cGlu = freezed,
    Object? cLac = freezed,
    Object? ctBil = freezed,
    Object? mOsmc = freezed,
    Object? phT = freezed,
    Object? pCO2T = freezed,
    Object? pO2T = freezed,
    Object? ctO2c = freezed,
    Object? p50c = freezed,
    Object? cBaseB = freezed,
    Object? cBaseEcf = freezed,
    Object? cHCO3Pst = freezed,
    Object? cHCO3P = freezed,
  }) {
    return _then(_$BloodGasRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pH: freezed == pH
          ? _value.pH
          : pH // ignore: cast_nullable_to_non_nullable
              as double?,
      pCO2: freezed == pCO2
          ? _value.pCO2
          : pCO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      pO2: freezed == pO2
          ? _value.pO2
          : pO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      ctHb: freezed == ctHb
          ? _value.ctHb
          : ctHb // ignore: cast_nullable_to_non_nullable
              as double?,
      hctc: freezed == hctc
          ? _value.hctc
          : hctc // ignore: cast_nullable_to_non_nullable
              as double?,
      sO2: freezed == sO2
          ? _value.sO2
          : sO2 // ignore: cast_nullable_to_non_nullable
              as double?,
      fO2Hb: freezed == fO2Hb
          ? _value.fO2Hb
          : fO2Hb // ignore: cast_nullable_to_non_nullable
              as double?,
      fCOHb: freezed == fCOHb
          ? _value.fCOHb
          : fCOHb // ignore: cast_nullable_to_non_nullable
              as double?,
      fHHb: freezed == fHHb
          ? _value.fHHb
          : fHHb // ignore: cast_nullable_to_non_nullable
              as double?,
      fMetHb: freezed == fMetHb
          ? _value.fMetHb
          : fMetHb // ignore: cast_nullable_to_non_nullable
              as double?,
      cNa: freezed == cNa
          ? _value.cNa
          : cNa // ignore: cast_nullable_to_non_nullable
              as double?,
      cK: freezed == cK
          ? _value.cK
          : cK // ignore: cast_nullable_to_non_nullable
              as double?,
      cCa: freezed == cCa
          ? _value.cCa
          : cCa // ignore: cast_nullable_to_non_nullable
              as double?,
      cCl: freezed == cCl
          ? _value.cCl
          : cCl // ignore: cast_nullable_to_non_nullable
              as double?,
      cGlu: freezed == cGlu
          ? _value.cGlu
          : cGlu // ignore: cast_nullable_to_non_nullable
              as double?,
      cLac: freezed == cLac
          ? _value.cLac
          : cLac // ignore: cast_nullable_to_non_nullable
              as double?,
      ctBil: freezed == ctBil
          ? _value.ctBil
          : ctBil // ignore: cast_nullable_to_non_nullable
              as double?,
      mOsmc: freezed == mOsmc
          ? _value.mOsmc
          : mOsmc // ignore: cast_nullable_to_non_nullable
              as double?,
      phT: freezed == phT
          ? _value.phT
          : phT // ignore: cast_nullable_to_non_nullable
              as double?,
      pCO2T: freezed == pCO2T
          ? _value.pCO2T
          : pCO2T // ignore: cast_nullable_to_non_nullable
              as double?,
      pO2T: freezed == pO2T
          ? _value.pO2T
          : pO2T // ignore: cast_nullable_to_non_nullable
              as double?,
      ctO2c: freezed == ctO2c
          ? _value.ctO2c
          : ctO2c // ignore: cast_nullable_to_non_nullable
              as double?,
      p50c: freezed == p50c
          ? _value.p50c
          : p50c // ignore: cast_nullable_to_non_nullable
              as double?,
      cBaseB: freezed == cBaseB
          ? _value.cBaseB
          : cBaseB // ignore: cast_nullable_to_non_nullable
              as double?,
      cBaseEcf: freezed == cBaseEcf
          ? _value.cBaseEcf
          : cBaseEcf // ignore: cast_nullable_to_non_nullable
              as double?,
      cHCO3Pst: freezed == cHCO3Pst
          ? _value.cHCO3Pst
          : cHCO3Pst // ignore: cast_nullable_to_non_nullable
              as double?,
      cHCO3P: freezed == cHCO3P
          ? _value.cHCO3P
          : cHCO3P // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodGasRecordImpl implements _BloodGasRecord {
  const _$BloodGasRecordImpl(
      {required this.id,
      required this.patientId,
      required this.timestamp,
      this.pH,
      this.pCO2,
      this.pO2,
      this.ctHb,
      this.hctc,
      this.sO2,
      this.fO2Hb,
      this.fCOHb,
      this.fHHb,
      this.fMetHb,
      this.cNa,
      this.cK,
      this.cCa,
      this.cCl,
      this.cGlu,
      this.cLac,
      this.ctBil,
      this.mOsmc,
      this.phT,
      this.pCO2T,
      this.pO2T,
      this.ctO2c,
      this.p50c,
      this.cBaseB,
      this.cBaseEcf,
      this.cHCO3Pst,
      this.cHCO3P});

  factory _$BloodGasRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodGasRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String patientId;
  @override
  final DateTime timestamp;
// BloodGasValues
  @override
  final double? pH;
  @override
  final double? pCO2;
// mmHg
  @override
  final double? pO2;
// mmHg
// Oximetry Values
  @override
  final double? ctHb;
// g/dL
  @override
  final double? hctc;
// %
  @override
  final double? sO2;
// %
  @override
  final double? fO2Hb;
// %
  @override
  final double? fCOHb;
// %
  @override
  final double? fHHb;
// %
  @override
  final double? fMetHb;
// %
// Electrolyte Values
  @override
  final double? cNa;
// mmol/L
  @override
  final double? cK;
// mmol/L
  @override
  final double? cCa;
// mmol/L
  @override
  final double? cCl;
// mmol/L
// Metabolite Values
  @override
  final double? cGlu;
// mmol/L
  @override
  final double? cLac;
// mmol/L
  @override
  final double? ctBil;
// mmol/L
  @override
  final double? mOsmc;
// mmol/kg
// Temperature Corrected
  @override
  final double? phT;
  @override
  final double? pCO2T;
// kPa
  @override
  final double? pO2T;
// kPa
// Oxygen Status
  @override
  final double? ctO2c;
// vol%
  @override
  final double? p50c;
// kPa
// Acid Base Status
  @override
  final double? cBaseB;
// mmol/L
  @override
  final double? cBaseEcf;
// mmol/L
  @override
  final double? cHCO3Pst;
// mmol/L
  @override
  final double? cHCO3P;

  @override
  String toString() {
    return 'BloodGasRecord(id: $id, patientId: $patientId, timestamp: $timestamp, pH: $pH, pCO2: $pCO2, pO2: $pO2, ctHb: $ctHb, hctc: $hctc, sO2: $sO2, fO2Hb: $fO2Hb, fCOHb: $fCOHb, fHHb: $fHHb, fMetHb: $fMetHb, cNa: $cNa, cK: $cK, cCa: $cCa, cCl: $cCl, cGlu: $cGlu, cLac: $cLac, ctBil: $ctBil, mOsmc: $mOsmc, phT: $phT, pCO2T: $pCO2T, pO2T: $pO2T, ctO2c: $ctO2c, p50c: $p50c, cBaseB: $cBaseB, cBaseEcf: $cBaseEcf, cHCO3Pst: $cHCO3Pst, cHCO3P: $cHCO3P)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodGasRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.pH, pH) || other.pH == pH) &&
            (identical(other.pCO2, pCO2) || other.pCO2 == pCO2) &&
            (identical(other.pO2, pO2) || other.pO2 == pO2) &&
            (identical(other.ctHb, ctHb) || other.ctHb == ctHb) &&
            (identical(other.hctc, hctc) || other.hctc == hctc) &&
            (identical(other.sO2, sO2) || other.sO2 == sO2) &&
            (identical(other.fO2Hb, fO2Hb) || other.fO2Hb == fO2Hb) &&
            (identical(other.fCOHb, fCOHb) || other.fCOHb == fCOHb) &&
            (identical(other.fHHb, fHHb) || other.fHHb == fHHb) &&
            (identical(other.fMetHb, fMetHb) || other.fMetHb == fMetHb) &&
            (identical(other.cNa, cNa) || other.cNa == cNa) &&
            (identical(other.cK, cK) || other.cK == cK) &&
            (identical(other.cCa, cCa) || other.cCa == cCa) &&
            (identical(other.cCl, cCl) || other.cCl == cCl) &&
            (identical(other.cGlu, cGlu) || other.cGlu == cGlu) &&
            (identical(other.cLac, cLac) || other.cLac == cLac) &&
            (identical(other.ctBil, ctBil) || other.ctBil == ctBil) &&
            (identical(other.mOsmc, mOsmc) || other.mOsmc == mOsmc) &&
            (identical(other.phT, phT) || other.phT == phT) &&
            (identical(other.pCO2T, pCO2T) || other.pCO2T == pCO2T) &&
            (identical(other.pO2T, pO2T) || other.pO2T == pO2T) &&
            (identical(other.ctO2c, ctO2c) || other.ctO2c == ctO2c) &&
            (identical(other.p50c, p50c) || other.p50c == p50c) &&
            (identical(other.cBaseB, cBaseB) || other.cBaseB == cBaseB) &&
            (identical(other.cBaseEcf, cBaseEcf) ||
                other.cBaseEcf == cBaseEcf) &&
            (identical(other.cHCO3Pst, cHCO3Pst) ||
                other.cHCO3Pst == cHCO3Pst) &&
            (identical(other.cHCO3P, cHCO3P) || other.cHCO3P == cHCO3P));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        patientId,
        timestamp,
        pH,
        pCO2,
        pO2,
        ctHb,
        hctc,
        sO2,
        fO2Hb,
        fCOHb,
        fHHb,
        fMetHb,
        cNa,
        cK,
        cCa,
        cCl,
        cGlu,
        cLac,
        ctBil,
        mOsmc,
        phT,
        pCO2T,
        pO2T,
        ctO2c,
        p50c,
        cBaseB,
        cBaseEcf,
        cHCO3Pst,
        cHCO3P
      ]);

  /// Create a copy of BloodGasRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodGasRecordImplCopyWith<_$BloodGasRecordImpl> get copyWith =>
      __$$BloodGasRecordImplCopyWithImpl<_$BloodGasRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodGasRecordImplToJson(
      this,
    );
  }
}

abstract class _BloodGasRecord implements BloodGasRecord {
  const factory _BloodGasRecord(
      {required final String id,
      required final String patientId,
      required final DateTime timestamp,
      final double? pH,
      final double? pCO2,
      final double? pO2,
      final double? ctHb,
      final double? hctc,
      final double? sO2,
      final double? fO2Hb,
      final double? fCOHb,
      final double? fHHb,
      final double? fMetHb,
      final double? cNa,
      final double? cK,
      final double? cCa,
      final double? cCl,
      final double? cGlu,
      final double? cLac,
      final double? ctBil,
      final double? mOsmc,
      final double? phT,
      final double? pCO2T,
      final double? pO2T,
      final double? ctO2c,
      final double? p50c,
      final double? cBaseB,
      final double? cBaseEcf,
      final double? cHCO3Pst,
      final double? cHCO3P}) = _$BloodGasRecordImpl;

  factory _BloodGasRecord.fromJson(Map<String, dynamic> json) =
      _$BloodGasRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get patientId;
  @override
  DateTime get timestamp; // BloodGasValues
  @override
  double? get pH;
  @override
  double? get pCO2; // mmHg
  @override
  double? get pO2; // mmHg
// Oximetry Values
  @override
  double? get ctHb; // g/dL
  @override
  double? get hctc; // %
  @override
  double? get sO2; // %
  @override
  double? get fO2Hb; // %
  @override
  double? get fCOHb; // %
  @override
  double? get fHHb; // %
  @override
  double? get fMetHb; // %
// Electrolyte Values
  @override
  double? get cNa; // mmol/L
  @override
  double? get cK; // mmol/L
  @override
  double? get cCa; // mmol/L
  @override
  double? get cCl; // mmol/L
// Metabolite Values
  @override
  double? get cGlu; // mmol/L
  @override
  double? get cLac; // mmol/L
  @override
  double? get ctBil; // mmol/L
  @override
  double? get mOsmc; // mmol/kg
// Temperature Corrected
  @override
  double? get phT;
  @override
  double? get pCO2T; // kPa
  @override
  double? get pO2T; // kPa
// Oxygen Status
  @override
  double? get ctO2c; // vol%
  @override
  double? get p50c; // kPa
// Acid Base Status
  @override
  double? get cBaseB; // mmol/L
  @override
  double? get cBaseEcf; // mmol/L
  @override
  double? get cHCO3Pst; // mmol/L
  @override
  double? get cHCO3P;

  /// Create a copy of BloodGasRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodGasRecordImplCopyWith<_$BloodGasRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
