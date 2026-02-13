import '../entities/blood_gas_record.dart';

abstract class IBloodGasRepository {
  Future<List<BloodGasRecord>> getRecordsByPatientId(String patientId);
  Future<void> saveRecord(BloodGasRecord record);
  Future<void> updateRecord(BloodGasRecord record);
  Future<void> deleteRecord(String id);
  // Maybe more methods for comparison checks if needed, but simple CRUD is good for now.
}
