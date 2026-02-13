import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Tables
class Patients extends Table {
  TextColumn get id => text()();
  TextColumn get operatingRoomName => text()();
  TextColumn get residentId => text().withDefault(const Constant('Unknown'))();
  DateTimeColumn get surgeryStartTime => dateTime()();
  DateTimeColumn get surgeryEndTime => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class BloodGasRecords extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text().references(Patients, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get timestamp => dateTime()();
  
  // BloodGasValues
  RealColumn get pH => real().nullable()();
  RealColumn get pCO2 => real().nullable()(); // mmHg
  RealColumn get pO2 => real().nullable()(); // mmHg
  
  // Oximetry Values
  RealColumn get ctHb => real().nullable()(); // g/dL
  RealColumn get hctc => real().nullable()(); // %
  RealColumn get sO2 => real().nullable()(); // %
  RealColumn get fO2Hb => real().nullable()(); // %
  RealColumn get fCOHb => real().nullable()(); // %
  RealColumn get fHHb => real().nullable()(); // %
  RealColumn get fMetHb => real().nullable()(); // %
  
  // Electrolyte Values
  RealColumn get cNa => real().nullable()(); // mmol/L
  RealColumn get cK => real().nullable()(); // mmol/L
  RealColumn get cCa => real().nullable()(); // mmol/L
  RealColumn get cCl => real().nullable()(); // mmol/L
  
  // Metabolite Values
  RealColumn get cGlu => real().nullable()(); // mmol/L
  RealColumn get cLac => real().nullable()(); // mmol/L
  RealColumn get ctBil => real().nullable()(); // mmol/L
  RealColumn get mOsmc => real().nullable()(); // mmol/kg
  
  // Temperature Corrected
  RealColumn get phT => real().nullable()();
  RealColumn get pCO2T => real().nullable()(); // kPa
  RealColumn get pO2T => real().nullable()(); // kPa
  
  // Oxygen Status
  RealColumn get ctO2c => real().nullable()(); // vol%
  RealColumn get p50c => real().nullable()(); // kPa
  
  // Acid Base Status
  RealColumn get cBaseB => real().nullable()(); // mmol/L
  RealColumn get cBaseEcf => real().nullable()(); // mmol/L
  RealColumn get cHCO3Pst => real().nullable()(); // mmol/L
  RealColumn get cHCO3P => real().nullable()(); // mmol/L

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Patients, BloodGasRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
       await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
       if (from < 2) {
          await m.addColumn(patients, patients.residentId);
       }
       if (from < 3) {
          await m.addColumn(patients, patients.isDeleted);
          await m.addColumn(patients, patients.deletedAt);
       }
    }
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // TODO: Implement encryption here later
    return NativeDatabase.createInBackground(file);
  });
}
