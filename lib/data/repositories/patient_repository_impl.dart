import 'package:drift/drift.dart';
import '../../domain/entities/patient.dart' as domain;
import '../../domain/repositories/i_patient_repository.dart';
import '../datasources/local/database.dart';

class PatientRepositoryImpl implements IPatientRepository {
  final AppDatabase _db;

  PatientRepositoryImpl(this._db);

  @override
  Future<List<domain.Patient>> getAllPatients() async {
    final query = _db.select(_db.patients);
    final results = await query.get();
    return results.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<domain.Patient?> getPatientById(String id) async {
    final query = _db.select(_db.patients)..where((tbl) => tbl.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null ? _mapToDomain(result) : null;
  }

  @override
  Future<void> createPatient(domain.Patient patient) async {
    await _db.into(_db.patients).insert(
          PatientsCompanion(
            id: Value(patient.id),
            operatingRoomName: Value(patient.operatingRoomName),
            residentId: Value(patient.residentId),
            surgeryStartTime: Value(patient.surgeryStartTime),
            surgeryEndTime: Value(patient.surgeryEndTime),
            isActive: Value(patient.isActive),
            isDeleted: Value(patient.isDeleted),
            deletedAt: Value(patient.deletedAt),
          ),
        );
  }

  @override
  Future<void> updatePatient(domain.Patient patient) async {
    await (_db.update(_db.patients)..where((tbl) => tbl.id.equals(patient.id))).write(
      PatientsCompanion(
        operatingRoomName: Value(patient.operatingRoomName),
        residentId: Value(patient.residentId),
        surgeryStartTime: Value(patient.surgeryStartTime),
        surgeryEndTime: Value(patient.surgeryEndTime),
        isActive: Value(patient.isActive),
        isDeleted: Value(patient.isDeleted),
        deletedAt: Value(patient.deletedAt),
      ),
    );
  }

  @override
  Future<void> deletePatient(String id) async {
    await (_db.delete(_db.patients)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> softDeletePatient(String id) async {
    await (_db.update(_db.patients)..where((tbl) => tbl.id.equals(id))).write(
      PatientsCompanion(
        isDeleted: const Value(true),
        deletedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> restorePatient(String id) async {
    await (_db.update(_db.patients)..where((tbl) => tbl.id.equals(id))).write(
      const PatientsCompanion(
        isDeleted: Value(false),
        deletedAt: Value(null),
      ),
    );
  }

  @override
  Future<List<domain.Patient>> getActivePatients() async {
    final query = _db.select(_db.patients)
      ..where((tbl) => tbl.isActive.equals(true) & tbl.isDeleted.equals(false));
    final results = await query.get();
    return results.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<List<domain.Patient>> getCompletedPatients() async {
    final query = _db.select(_db.patients)
      ..where((tbl) => tbl.isActive.equals(false) & tbl.isDeleted.equals(false));
    final results = await query.get();
    return results.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<List<domain.Patient>> getDeletedPatients() async {
    final query = _db.select(_db.patients)..where((tbl) => tbl.isDeleted.equals(true));
    final results = await query.get();
    return results.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<void> deleteOldPatients(Duration retentionPeriod) async {
    final cutoff = DateTime.now().subtract(retentionPeriod);
    
    // Rule 1: Hard-delete completed patients older than retention period
    await (_db.delete(_db.patients)
          ..where((tbl) => tbl.isActive.equals(false) & 
                           tbl.isDeleted.equals(false) & 
                           tbl.surgeryEndTime.isNotNull() & 
                           tbl.surgeryEndTime.isSmallerThanValue(cutoff)))
        .go();
        
    // Rule 2: Hard-delete trash items older than 30 days
    final trashCutoff = DateTime.now().subtract(const Duration(days: 30));
    await (_db.delete(_db.patients)
          ..where((tbl) => tbl.isDeleted.equals(true) & 
                           tbl.deletedAt.isNotNull() & 
                           tbl.deletedAt.isSmallerThanValue(trashCutoff)))
        .go();
  }

  domain.Patient _mapToDomain(Patient row) {
    return domain.Patient(
      id: row.id,
      operatingRoomName: row.operatingRoomName,
      residentId: row.residentId,
      surgeryStartTime: row.surgeryStartTime,
      surgeryEndTime: row.surgeryEndTime,
      isActive: row.isActive,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
    );
  }
}
