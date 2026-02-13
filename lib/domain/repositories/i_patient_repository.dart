import '../entities/patient.dart';

abstract class IPatientRepository {
  Future<List<Patient>> getAllPatients();
  Future<Patient?> getPatientById(String id);
  Future<void> createPatient(Patient patient);
  Future<void> updatePatient(Patient patient);
  Future<void> deletePatient(String id); // Hard delete
  Future<void> softDeletePatient(String id);
  Future<void> restorePatient(String id);
  Future<List<Patient>> getActivePatients();
  Future<List<Patient>> getCompletedPatients();
  Future<List<Patient>> getDeletedPatients();
  Future<void> deleteOldPatients(Duration retentionPeriod);
}
