// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_gas_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodGasRecordImpl _$$BloodGasRecordImplFromJson(Map<String, dynamic> json) =>
    _$BloodGasRecordImpl(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      pH: (json['pH'] as num?)?.toDouble(),
      pCO2: (json['pCO2'] as num?)?.toDouble(),
      pO2: (json['pO2'] as num?)?.toDouble(),
      ctHb: (json['ctHb'] as num?)?.toDouble(),
      hctc: (json['hctc'] as num?)?.toDouble(),
      sO2: (json['sO2'] as num?)?.toDouble(),
      fO2Hb: (json['fO2Hb'] as num?)?.toDouble(),
      fCOHb: (json['fCOHb'] as num?)?.toDouble(),
      fHHb: (json['fHHb'] as num?)?.toDouble(),
      fMetHb: (json['fMetHb'] as num?)?.toDouble(),
      cNa: (json['cNa'] as num?)?.toDouble(),
      cK: (json['cK'] as num?)?.toDouble(),
      cCa: (json['cCa'] as num?)?.toDouble(),
      cCl: (json['cCl'] as num?)?.toDouble(),
      cGlu: (json['cGlu'] as num?)?.toDouble(),
      cLac: (json['cLac'] as num?)?.toDouble(),
      ctBil: (json['ctBil'] as num?)?.toDouble(),
      mOsmc: (json['mOsmc'] as num?)?.toDouble(),
      phT: (json['phT'] as num?)?.toDouble(),
      pCO2T: (json['pCO2T'] as num?)?.toDouble(),
      pO2T: (json['pO2T'] as num?)?.toDouble(),
      ctO2c: (json['ctO2c'] as num?)?.toDouble(),
      p50c: (json['p50c'] as num?)?.toDouble(),
      cBaseB: (json['cBaseB'] as num?)?.toDouble(),
      cBaseEcf: (json['cBaseEcf'] as num?)?.toDouble(),
      cHCO3Pst: (json['cHCO3Pst'] as num?)?.toDouble(),
      cHCO3P: (json['cHCO3P'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BloodGasRecordImplToJson(
        _$BloodGasRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'timestamp': instance.timestamp.toIso8601String(),
      'pH': instance.pH,
      'pCO2': instance.pCO2,
      'pO2': instance.pO2,
      'ctHb': instance.ctHb,
      'hctc': instance.hctc,
      'sO2': instance.sO2,
      'fO2Hb': instance.fO2Hb,
      'fCOHb': instance.fCOHb,
      'fHHb': instance.fHHb,
      'fMetHb': instance.fMetHb,
      'cNa': instance.cNa,
      'cK': instance.cK,
      'cCa': instance.cCa,
      'cCl': instance.cCl,
      'cGlu': instance.cGlu,
      'cLac': instance.cLac,
      'ctBil': instance.ctBil,
      'mOsmc': instance.mOsmc,
      'phT': instance.phT,
      'pCO2T': instance.pCO2T,
      'pO2T': instance.pO2T,
      'ctO2c': instance.ctO2c,
      'p50c': instance.p50c,
      'cBaseB': instance.cBaseB,
      'cBaseEcf': instance.cBaseEcf,
      'cHCO3Pst': instance.cHCO3Pst,
      'cHCO3P': instance.cHCO3P,
    };
