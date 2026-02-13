import 'package:drift/drift.dart';
import '../../domain/entities/blood_gas_record.dart' as domain;
import '../../domain/repositories/i_blood_gas_repository.dart';
import '../datasources/local/database.dart';

class BloodGasRepositoryImpl implements IBloodGasRepository {
  final AppDatabase _db;

  BloodGasRepositoryImpl(this._db);

  @override
  Future<List<domain.BloodGasRecord>> getRecordsByPatientId(String patientId) async {
    final query = _db.select(_db.bloodGasRecords)..where((tbl) => tbl.patientId.equals(patientId));
    // Order by timestamp desc
    query.orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)]);
    
    final results = await query.get();
    return results.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<void> saveRecord(domain.BloodGasRecord record) async {
    await _db.into(_db.bloodGasRecords).insert(
          BloodGasRecordsCompanion(
            id: Value(record.id),
            patientId: Value(record.patientId),
            timestamp: Value(record.timestamp),
            pH: Value(record.pH),
            pCO2: Value(record.pCO2),
            pO2: Value(record.pO2),
            ctHb: Value(record.ctHb),
            hctc: Value(record.hctc),
            sO2: Value(record.sO2),
            fO2Hb: Value(record.fO2Hb),
            fCOHb: Value(record.fCOHb),
            fHHb: Value(record.fHHb),
            fMetHb: Value(record.fMetHb),
            cNa: Value(record.cNa),
            cK: Value(record.cK),
            cCa: Value(record.cCa),
            cCl: Value(record.cCl),
            cGlu: Value(record.cGlu),
            cLac: Value(record.cLac),
            ctBil: Value(record.ctBil),
            mOsmc: Value(record.mOsmc),
            phT: Value(record.phT),
            pCO2T: Value(record.pCO2T),
            pO2T: Value(record.pO2T),
            ctO2c: Value(record.ctO2c),
            p50c: Value(record.p50c),
            cBaseB: Value(record.cBaseB),
            cBaseEcf: Value(record.cBaseEcf),
            cHCO3Pst: Value(record.cHCO3Pst),
            cHCO3P: Value(record.cHCO3P),
          ),
          mode: InsertMode.insertOrReplace, // Support upsert just in case
        );
  }

  @override
  Future<void> updateRecord(domain.BloodGasRecord record) async {
      // Re-use save logic or explicit update
      await (_db.update(_db.bloodGasRecords)..where((tbl) => tbl.id.equals(record.id))).write(
          BloodGasRecordsCompanion(
            patientId: Value(record.patientId),
            // timestamp: Value(record.timestamp), // Keep original timestamp? User didn't specify, but usually edit keeps verify time. 
            // "her takip başlangıcına o anın tarihi ve saati atılsın" -> This is for creation.
            // For update, let's allow updating values but keep metadata if possible, but mapToDomain has all.
            // Let's just update all fields.
            timestamp: Value(record.timestamp),
            pH: Value(record.pH),
            pCO2: Value(record.pCO2),
            pO2: Value(record.pO2),
            ctHb: Value(record.ctHb),
            hctc: Value(record.hctc),
            sO2: Value(record.sO2),
            fO2Hb: Value(record.fO2Hb),
            fCOHb: Value(record.fCOHb),
            fHHb: Value(record.fHHb),
            fMetHb: Value(record.fMetHb),
            cNa: Value(record.cNa),
            cK: Value(record.cK),
            cCa: Value(record.cCa),
            cCl: Value(record.cCl),
            cGlu: Value(record.cGlu),
            cLac: Value(record.cLac),
            ctBil: Value(record.ctBil),
            mOsmc: Value(record.mOsmc),
            phT: Value(record.phT),
            pCO2T: Value(record.pCO2T),
            pO2T: Value(record.pO2T),
            ctO2c: Value(record.ctO2c),
            p50c: Value(record.p50c),
            cBaseB: Value(record.cBaseB),
            cBaseEcf: Value(record.cBaseEcf),
            cHCO3Pst: Value(record.cHCO3Pst),
            cHCO3P: Value(record.cHCO3P),
          ),
      );
  }

  @override
  Future<void> deleteRecord(String id) async {
    await (_db.delete(_db.bloodGasRecords)..where((tbl) => tbl.id.equals(id))).go();
  }

  domain.BloodGasRecord _mapToDomain(BloodGasRecord row) {
    return domain.BloodGasRecord(
      id: row.id,
      patientId: row.patientId,
      timestamp: row.timestamp,
      pH: row.pH,
      pCO2: row.pCO2,
      pO2: row.pO2,
      ctHb: row.ctHb,
      hctc: row.hctc,
      sO2: row.sO2,
      fO2Hb: row.fO2Hb,
      fCOHb: row.fCOHb,
      fHHb: row.fHHb,
      fMetHb: row.fMetHb,
      cNa: row.cNa,
      cK: row.cK,
      cCa: row.cCa,
      cCl: row.cCl,
      cGlu: row.cGlu,
      cLac: row.cLac,
      ctBil: row.ctBil,
      mOsmc: row.mOsmc,
      phT: row.phT,
      pCO2T: row.pCO2T,
      pO2T: row.pO2T,
      ctO2c: row.ctO2c,
      p50c: row.p50c,
      cBaseB: row.cBaseB,
      cBaseEcf: row.cBaseEcf,
      cHCO3Pst: row.cHCO3Pst,
      cHCO3P: row.cHCO3P,
    );
  }
}
