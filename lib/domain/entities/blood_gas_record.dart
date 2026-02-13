import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_gas_record.freezed.dart';
part 'blood_gas_record.g.dart';

@freezed
class BloodGasRecord with _$BloodGasRecord {
  const factory BloodGasRecord({
    required String id,
    required String patientId,
    required DateTime timestamp,
    // BloodGasValues
    double? pH,
    double? pCO2, // mmHg
    double? pO2, // mmHg
    // Oximetry Values
    double? ctHb, // g/dL
    double? hctc, // %
    double? sO2, // %
    double? fO2Hb, // %
    double? fCOHb, // %
    double? fHHb, // %
    double? fMetHb, // %
    // Electrolyte Values
    double? cNa, // mmol/L
    double? cK, // mmol/L
    double? cCa, // mmol/L
    double? cCl, // mmol/L
    // Metabolite Values
    double? cGlu, // mmol/L
    double? cLac, // mmol/L
    double? ctBil, // mmol/L
    double? mOsmc, // mmol/kg
    // Temperature Corrected
    double? phT,
    double? pCO2T, // kPa
    double? pO2T, // kPa
    // Oxygen Status
    double? ctO2c, // vol%
    double? p50c, // kPa
    // Acid Base Status
    double? cBaseB, // mmol/L
    double? cBaseEcf, // mmol/L
    double? cHCO3Pst, // mmol/L
    double? cHCO3P, // mmol/L
  }) = _BloodGasRecord;

  factory BloodGasRecord.fromJson(Map<String, dynamic> json) => _$BloodGasRecordFromJson(json);
}
