import 'dart:async';
import 'package:blood_gas_app/domain/entities/blood_gas_record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'blood_gas_state.dart';

part 'measurement_state.g.dart';

// Separate provider for the form state
@riverpod
class MeasurementForm extends _$MeasurementForm {
  @override
  BloodGasRecord build(String patientId) {
    return BloodGasRecord(
      id: const Uuid().v4(),
      patientId: patientId,
      timestamp: DateTime.now(),
    );
  }

  void updateField(String key, double? value) {
    switch (key) {
      case 'pH': state = state.copyWith(pH: value); break;
      case 'pCO2': state = state.copyWith(pCO2: value); break;
      case 'pO2': state = state.copyWith(pO2: value); break;
      case 'ctHb': state = state.copyWith(ctHb: value); break;
      case 'hctc': state = state.copyWith(hctc: value); break;
      case 'sO2': state = state.copyWith(sO2: value); break;
      case 'fO2Hb': state = state.copyWith(fO2Hb: value); break;
      case 'fCOHb': state = state.copyWith(fCOHb: value); break;
      case 'fHHb': state = state.copyWith(fHHb: value); break;
      case 'fMetHb': state = state.copyWith(fMetHb: value); break;
      case 'cNa': state = state.copyWith(cNa: value); break;
      case 'cK': state = state.copyWith(cK: value); break;
      case 'cCa': state = state.copyWith(cCa: value); break;
      case 'cCl': state = state.copyWith(cCl: value); break;
      case 'cGlu': state = state.copyWith(cGlu: value); break;
      case 'cLac': state = state.copyWith(cLac: value); break;
      case 'ctBil': state = state.copyWith(ctBil: value); break;
      case 'mOsmc': state = state.copyWith(mOsmc: value); break;
      case 'phT': state = state.copyWith(phT: value); break;
      case 'pCO2T': state = state.copyWith(pCO2T: value); break;
      case 'pO2T': state = state.copyWith(pO2T: value); break;
      case 'ctO2c': state = state.copyWith(ctO2c: value); break;
      case 'p50c': state = state.copyWith(p50c: value); break;
      case 'cBaseB': state = state.copyWith(cBaseB: value); break;
      case 'cBaseEcf': state = state.copyWith(cBaseEcf: value); break;
      case 'cHCO3Pst': state = state.copyWith(cHCO3Pst: value); break;
      case 'cHCO3P': state = state.copyWith(cHCO3P: value); break;
    }
  }

  void setFromRecord(BloodGasRecord record) {
    state = record;
  }

  void reset() {
    state = BloodGasRecord(
      id: const Uuid().v4(),
      patientId: patientId,
      timestamp: DateTime.now(),
    );
  }
  
  void setFromOcr(Map<String, double> values) {
    state = state.copyWith(
      pH: values['pH'] ?? state.pH,
      pCO2: values['pCO2'] ?? state.pCO2,
      pO2: values['pO2'] ?? state.pO2,
      cNa: values['cNa'] ?? state.cNa,
      cK: values['cK'] ?? state.cK,
      cCa: values['cCa'] ?? state.cCa,
      cCl: values['cCl'] ?? state.cCl,
      cLac: values['cLac'] ?? state.cLac,
      cGlu: values['cGlu'] ?? state.cGlu,
      hctc: values['hctc'] ?? state.hctc,
      ctHb: values['ctHb'] ?? state.ctHb,
      sO2: values['sO2'] ?? state.sO2,
      fO2Hb: values['fO2Hb'] ?? state.fO2Hb,
      fCOHb: values['fCOHb'] ?? state.fCOHb,
      fHHb: values['fHHb'] ?? state.fHHb,
      fMetHb: values['fMetHb'] ?? state.fMetHb,
      ctBil: values['ctBil'] ?? state.ctBil,
      mOsmc: values['mOsmc'] ?? state.mOsmc,
      phT: values['phT'] ?? state.phT,
      pCO2T: values['pCO2T'] ?? state.pCO2T,
      pO2T: values['pO2T'] ?? state.pO2T,
      ctO2c: values['ctO2c'] ?? state.ctO2c,
      p50c: values['p50c'] ?? state.p50c,
      cBaseB: values['cBaseB'] ?? state.cBaseB,
      cBaseEcf: values['cBaseEcf'] ?? state.cBaseEcf,
      cHCO3Pst: values['cHCO3Pst'] ?? state.cHCO3Pst,
      cHCO3P: values['cHCO3P'] ?? state.cHCO3P,
    );
  }

  Future<void> save() async {
     await ref.read(patientBloodGasRecordsProvider(patientId).notifier).addRecord(state);
  }

  Future<void> updateExistingRecord() async {
     await ref.read(patientBloodGasRecordsProvider(patientId).notifier).updateRecord(state);
  }
}
