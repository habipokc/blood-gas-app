import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/blood_gas_record.dart';
import 'providers.dart';

part 'blood_gas_state.g.dart';

@riverpod
class PatientBloodGasRecords extends _$PatientBloodGasRecords {
  @override
  Future<List<BloodGasRecord>> build(String patientId) async {
    final repo = ref.watch(bloodGasRepositoryProvider);
    return repo.getRecordsByPatientId(patientId);
  }

  Future<void> addRecord(BloodGasRecord record) async {
    final repo = ref.read(bloodGasRepositoryProvider);
    await repo.saveRecord(record);
    ref.invalidateSelf();
  }

  Future<void> updateRecord(BloodGasRecord record) async {
    final repo = ref.read(bloodGasRepositoryProvider);
    await repo.updateRecord(record);
    ref.invalidateSelf();
  }
}
