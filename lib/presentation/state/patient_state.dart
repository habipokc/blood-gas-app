import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/patient.dart';
import 'providers.dart';

part 'patient_state.g.dart';

@riverpod
class ActivePatients extends _$ActivePatients {
  @override
  Future<List<Patient>> build() async {
    final repository = ref.watch(patientRepositoryProvider);
    return repository.getActivePatients();
  }

  Future<void> addPatient(String operatingRoomName, String residentId) async {
     final repository = ref.read(patientRepositoryProvider);
     final newPatient = Patient(
       id: const Uuid().v4(),
       operatingRoomName: operatingRoomName,
       residentId: residentId,
       surgeryStartTime: DateTime.now(),
     );
     
     await repository.createPatient(newPatient);
     
     // Refresh the list
     ref.invalidateSelf();
     await future;
  }
}

@riverpod
class CompletedPatients extends _$CompletedPatients {
  @override
  Future<List<Patient>> build() async {
    final repository = ref.watch(patientRepositoryProvider);
    return repository.getCompletedPatients();
  }
}

@riverpod
class DeletedPatients extends _$DeletedPatients {
  @override
  Future<List<Patient>> build() async {
    final repository = ref.watch(patientRepositoryProvider);
    return repository.getDeletedPatients();
  }
}

@riverpod
Future<Patient?> patientDetails(PatientDetailsRef ref, String id) async {
  return ref.watch(patientRepositoryProvider).getPatientById(id);
}
