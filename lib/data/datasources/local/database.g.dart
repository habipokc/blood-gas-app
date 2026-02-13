// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operatingRoomNameMeta =
      const VerificationMeta('operatingRoomName');
  @override
  late final GeneratedColumn<String> operatingRoomName =
      GeneratedColumn<String>('operating_room_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _residentIdMeta =
      const VerificationMeta('residentId');
  @override
  late final GeneratedColumn<String> residentId = GeneratedColumn<String>(
      'resident_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Unknown'));
  static const VerificationMeta _surgeryStartTimeMeta =
      const VerificationMeta('surgeryStartTime');
  @override
  late final GeneratedColumn<DateTime> surgeryStartTime =
      GeneratedColumn<DateTime>('surgery_start_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _surgeryEndTimeMeta =
      const VerificationMeta('surgeryEndTime');
  @override
  late final GeneratedColumn<DateTime> surgeryEndTime =
      GeneratedColumn<DateTime>('surgery_end_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operatingRoomName,
        residentId,
        surgeryStartTime,
        surgeryEndTime,
        isActive,
        isDeleted,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('operating_room_name')) {
      context.handle(
          _operatingRoomNameMeta,
          operatingRoomName.isAcceptableOrUnknown(
              data['operating_room_name']!, _operatingRoomNameMeta));
    } else if (isInserting) {
      context.missing(_operatingRoomNameMeta);
    }
    if (data.containsKey('resident_id')) {
      context.handle(
          _residentIdMeta,
          residentId.isAcceptableOrUnknown(
              data['resident_id']!, _residentIdMeta));
    }
    if (data.containsKey('surgery_start_time')) {
      context.handle(
          _surgeryStartTimeMeta,
          surgeryStartTime.isAcceptableOrUnknown(
              data['surgery_start_time']!, _surgeryStartTimeMeta));
    } else if (isInserting) {
      context.missing(_surgeryStartTimeMeta);
    }
    if (data.containsKey('surgery_end_time')) {
      context.handle(
          _surgeryEndTimeMeta,
          surgeryEndTime.isAcceptableOrUnknown(
              data['surgery_end_time']!, _surgeryEndTimeMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      operatingRoomName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}operating_room_name'])!,
      residentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resident_id'])!,
      surgeryStartTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}surgery_start_time'])!,
      surgeryEndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}surgery_end_time']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final String id;
  final String operatingRoomName;
  final String residentId;
  final DateTime surgeryStartTime;
  final DateTime? surgeryEndTime;
  final bool isActive;
  final bool isDeleted;
  final DateTime? deletedAt;
  const Patient(
      {required this.id,
      required this.operatingRoomName,
      required this.residentId,
      required this.surgeryStartTime,
      this.surgeryEndTime,
      required this.isActive,
      required this.isDeleted,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['operating_room_name'] = Variable<String>(operatingRoomName);
    map['resident_id'] = Variable<String>(residentId);
    map['surgery_start_time'] = Variable<DateTime>(surgeryStartTime);
    if (!nullToAbsent || surgeryEndTime != null) {
      map['surgery_end_time'] = Variable<DateTime>(surgeryEndTime);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      operatingRoomName: Value(operatingRoomName),
      residentId: Value(residentId),
      surgeryStartTime: Value(surgeryStartTime),
      surgeryEndTime: surgeryEndTime == null && nullToAbsent
          ? const Value.absent()
          : Value(surgeryEndTime),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<String>(json['id']),
      operatingRoomName: serializer.fromJson<String>(json['operatingRoomName']),
      residentId: serializer.fromJson<String>(json['residentId']),
      surgeryStartTime: serializer.fromJson<DateTime>(json['surgeryStartTime']),
      surgeryEndTime: serializer.fromJson<DateTime?>(json['surgeryEndTime']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'operatingRoomName': serializer.toJson<String>(operatingRoomName),
      'residentId': serializer.toJson<String>(residentId),
      'surgeryStartTime': serializer.toJson<DateTime>(surgeryStartTime),
      'surgeryEndTime': serializer.toJson<DateTime?>(surgeryEndTime),
      'isActive': serializer.toJson<bool>(isActive),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Patient copyWith(
          {String? id,
          String? operatingRoomName,
          String? residentId,
          DateTime? surgeryStartTime,
          Value<DateTime?> surgeryEndTime = const Value.absent(),
          bool? isActive,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Patient(
        id: id ?? this.id,
        operatingRoomName: operatingRoomName ?? this.operatingRoomName,
        residentId: residentId ?? this.residentId,
        surgeryStartTime: surgeryStartTime ?? this.surgeryStartTime,
        surgeryEndTime:
            surgeryEndTime.present ? surgeryEndTime.value : this.surgeryEndTime,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      operatingRoomName: data.operatingRoomName.present
          ? data.operatingRoomName.value
          : this.operatingRoomName,
      residentId:
          data.residentId.present ? data.residentId.value : this.residentId,
      surgeryStartTime: data.surgeryStartTime.present
          ? data.surgeryStartTime.value
          : this.surgeryStartTime,
      surgeryEndTime: data.surgeryEndTime.present
          ? data.surgeryEndTime.value
          : this.surgeryEndTime,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('operatingRoomName: $operatingRoomName, ')
          ..write('residentId: $residentId, ')
          ..write('surgeryStartTime: $surgeryStartTime, ')
          ..write('surgeryEndTime: $surgeryEndTime, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, operatingRoomName, residentId,
      surgeryStartTime, surgeryEndTime, isActive, isDeleted, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.operatingRoomName == this.operatingRoomName &&
          other.residentId == this.residentId &&
          other.surgeryStartTime == this.surgeryStartTime &&
          other.surgeryEndTime == this.surgeryEndTime &&
          other.isActive == this.isActive &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<String> id;
  final Value<String> operatingRoomName;
  final Value<String> residentId;
  final Value<DateTime> surgeryStartTime;
  final Value<DateTime?> surgeryEndTime;
  final Value<bool> isActive;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.operatingRoomName = const Value.absent(),
    this.residentId = const Value.absent(),
    this.surgeryStartTime = const Value.absent(),
    this.surgeryEndTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String id,
    required String operatingRoomName,
    this.residentId = const Value.absent(),
    required DateTime surgeryStartTime,
    this.surgeryEndTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        operatingRoomName = Value(operatingRoomName),
        surgeryStartTime = Value(surgeryStartTime);
  static Insertable<Patient> custom({
    Expression<String>? id,
    Expression<String>? operatingRoomName,
    Expression<String>? residentId,
    Expression<DateTime>? surgeryStartTime,
    Expression<DateTime>? surgeryEndTime,
    Expression<bool>? isActive,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operatingRoomName != null) 'operating_room_name': operatingRoomName,
      if (residentId != null) 'resident_id': residentId,
      if (surgeryStartTime != null) 'surgery_start_time': surgeryStartTime,
      if (surgeryEndTime != null) 'surgery_end_time': surgeryEndTime,
      if (isActive != null) 'is_active': isActive,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith(
      {Value<String>? id,
      Value<String>? operatingRoomName,
      Value<String>? residentId,
      Value<DateTime>? surgeryStartTime,
      Value<DateTime?>? surgeryEndTime,
      Value<bool>? isActive,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return PatientsCompanion(
      id: id ?? this.id,
      operatingRoomName: operatingRoomName ?? this.operatingRoomName,
      residentId: residentId ?? this.residentId,
      surgeryStartTime: surgeryStartTime ?? this.surgeryStartTime,
      surgeryEndTime: surgeryEndTime ?? this.surgeryEndTime,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (operatingRoomName.present) {
      map['operating_room_name'] = Variable<String>(operatingRoomName.value);
    }
    if (residentId.present) {
      map['resident_id'] = Variable<String>(residentId.value);
    }
    if (surgeryStartTime.present) {
      map['surgery_start_time'] = Variable<DateTime>(surgeryStartTime.value);
    }
    if (surgeryEndTime.present) {
      map['surgery_end_time'] = Variable<DateTime>(surgeryEndTime.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('operatingRoomName: $operatingRoomName, ')
          ..write('residentId: $residentId, ')
          ..write('surgeryStartTime: $surgeryStartTime, ')
          ..write('surgeryEndTime: $surgeryEndTime, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BloodGasRecordsTable extends BloodGasRecords
    with TableInfo<$BloodGasRecordsTable, BloodGasRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BloodGasRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patients (id) ON DELETE CASCADE'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _pHMeta = const VerificationMeta('pH');
  @override
  late final GeneratedColumn<double> pH = GeneratedColumn<double>(
      'p_h', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pCO2Meta = const VerificationMeta('pCO2');
  @override
  late final GeneratedColumn<double> pCO2 = GeneratedColumn<double>(
      'p_c_o2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pO2Meta = const VerificationMeta('pO2');
  @override
  late final GeneratedColumn<double> pO2 = GeneratedColumn<double>(
      'p_o2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ctHbMeta = const VerificationMeta('ctHb');
  @override
  late final GeneratedColumn<double> ctHb = GeneratedColumn<double>(
      'ct_hb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hctcMeta = const VerificationMeta('hctc');
  @override
  late final GeneratedColumn<double> hctc = GeneratedColumn<double>(
      'hctc', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sO2Meta = const VerificationMeta('sO2');
  @override
  late final GeneratedColumn<double> sO2 = GeneratedColumn<double>(
      's_o2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fO2HbMeta = const VerificationMeta('fO2Hb');
  @override
  late final GeneratedColumn<double> fO2Hb = GeneratedColumn<double>(
      'f_o2_hb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fCOHbMeta = const VerificationMeta('fCOHb');
  @override
  late final GeneratedColumn<double> fCOHb = GeneratedColumn<double>(
      'f_c_o_hb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fHHbMeta = const VerificationMeta('fHHb');
  @override
  late final GeneratedColumn<double> fHHb = GeneratedColumn<double>(
      'f_h_hb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fMetHbMeta = const VerificationMeta('fMetHb');
  @override
  late final GeneratedColumn<double> fMetHb = GeneratedColumn<double>(
      'f_met_hb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cNaMeta = const VerificationMeta('cNa');
  @override
  late final GeneratedColumn<double> cNa = GeneratedColumn<double>(
      'c_na', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cKMeta = const VerificationMeta('cK');
  @override
  late final GeneratedColumn<double> cK = GeneratedColumn<double>(
      'c_k', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cCaMeta = const VerificationMeta('cCa');
  @override
  late final GeneratedColumn<double> cCa = GeneratedColumn<double>(
      'c_ca', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cClMeta = const VerificationMeta('cCl');
  @override
  late final GeneratedColumn<double> cCl = GeneratedColumn<double>(
      'c_cl', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cGluMeta = const VerificationMeta('cGlu');
  @override
  late final GeneratedColumn<double> cGlu = GeneratedColumn<double>(
      'c_glu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cLacMeta = const VerificationMeta('cLac');
  @override
  late final GeneratedColumn<double> cLac = GeneratedColumn<double>(
      'c_lac', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ctBilMeta = const VerificationMeta('ctBil');
  @override
  late final GeneratedColumn<double> ctBil = GeneratedColumn<double>(
      'ct_bil', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _mOsmcMeta = const VerificationMeta('mOsmc');
  @override
  late final GeneratedColumn<double> mOsmc = GeneratedColumn<double>(
      'm_osmc', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _phTMeta = const VerificationMeta('phT');
  @override
  late final GeneratedColumn<double> phT = GeneratedColumn<double>(
      'ph_t', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pCO2TMeta = const VerificationMeta('pCO2T');
  @override
  late final GeneratedColumn<double> pCO2T = GeneratedColumn<double>(
      'p_c_o2_t', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pO2TMeta = const VerificationMeta('pO2T');
  @override
  late final GeneratedColumn<double> pO2T = GeneratedColumn<double>(
      'p_o2_t', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _ctO2cMeta = const VerificationMeta('ctO2c');
  @override
  late final GeneratedColumn<double> ctO2c = GeneratedColumn<double>(
      'ct_o2c', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _p50cMeta = const VerificationMeta('p50c');
  @override
  late final GeneratedColumn<double> p50c = GeneratedColumn<double>(
      'p50c', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cBaseBMeta = const VerificationMeta('cBaseB');
  @override
  late final GeneratedColumn<double> cBaseB = GeneratedColumn<double>(
      'c_base_b', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cBaseEcfMeta =
      const VerificationMeta('cBaseEcf');
  @override
  late final GeneratedColumn<double> cBaseEcf = GeneratedColumn<double>(
      'c_base_ecf', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cHCO3PstMeta =
      const VerificationMeta('cHCO3Pst');
  @override
  late final GeneratedColumn<double> cHCO3Pst = GeneratedColumn<double>(
      'c_h_c_o3_pst', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _cHCO3PMeta = const VerificationMeta('cHCO3P');
  @override
  late final GeneratedColumn<double> cHCO3P = GeneratedColumn<double>(
      'c_h_c_o3_p', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        timestamp,
        pH,
        pCO2,
        pO2,
        ctHb,
        hctc,
        sO2,
        fO2Hb,
        fCOHb,
        fHHb,
        fMetHb,
        cNa,
        cK,
        cCa,
        cCl,
        cGlu,
        cLac,
        ctBil,
        mOsmc,
        phT,
        pCO2T,
        pO2T,
        ctO2c,
        p50c,
        cBaseB,
        cBaseEcf,
        cHCO3Pst,
        cHCO3P
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blood_gas_records';
  @override
  VerificationContext validateIntegrity(Insertable<BloodGasRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('p_h')) {
      context.handle(_pHMeta, pH.isAcceptableOrUnknown(data['p_h']!, _pHMeta));
    }
    if (data.containsKey('p_c_o2')) {
      context.handle(
          _pCO2Meta, pCO2.isAcceptableOrUnknown(data['p_c_o2']!, _pCO2Meta));
    }
    if (data.containsKey('p_o2')) {
      context.handle(
          _pO2Meta, pO2.isAcceptableOrUnknown(data['p_o2']!, _pO2Meta));
    }
    if (data.containsKey('ct_hb')) {
      context.handle(
          _ctHbMeta, ctHb.isAcceptableOrUnknown(data['ct_hb']!, _ctHbMeta));
    }
    if (data.containsKey('hctc')) {
      context.handle(
          _hctcMeta, hctc.isAcceptableOrUnknown(data['hctc']!, _hctcMeta));
    }
    if (data.containsKey('s_o2')) {
      context.handle(
          _sO2Meta, sO2.isAcceptableOrUnknown(data['s_o2']!, _sO2Meta));
    }
    if (data.containsKey('f_o2_hb')) {
      context.handle(_fO2HbMeta,
          fO2Hb.isAcceptableOrUnknown(data['f_o2_hb']!, _fO2HbMeta));
    }
    if (data.containsKey('f_c_o_hb')) {
      context.handle(_fCOHbMeta,
          fCOHb.isAcceptableOrUnknown(data['f_c_o_hb']!, _fCOHbMeta));
    }
    if (data.containsKey('f_h_hb')) {
      context.handle(
          _fHHbMeta, fHHb.isAcceptableOrUnknown(data['f_h_hb']!, _fHHbMeta));
    }
    if (data.containsKey('f_met_hb')) {
      context.handle(_fMetHbMeta,
          fMetHb.isAcceptableOrUnknown(data['f_met_hb']!, _fMetHbMeta));
    }
    if (data.containsKey('c_na')) {
      context.handle(
          _cNaMeta, cNa.isAcceptableOrUnknown(data['c_na']!, _cNaMeta));
    }
    if (data.containsKey('c_k')) {
      context.handle(_cKMeta, cK.isAcceptableOrUnknown(data['c_k']!, _cKMeta));
    }
    if (data.containsKey('c_ca')) {
      context.handle(
          _cCaMeta, cCa.isAcceptableOrUnknown(data['c_ca']!, _cCaMeta));
    }
    if (data.containsKey('c_cl')) {
      context.handle(
          _cClMeta, cCl.isAcceptableOrUnknown(data['c_cl']!, _cClMeta));
    }
    if (data.containsKey('c_glu')) {
      context.handle(
          _cGluMeta, cGlu.isAcceptableOrUnknown(data['c_glu']!, _cGluMeta));
    }
    if (data.containsKey('c_lac')) {
      context.handle(
          _cLacMeta, cLac.isAcceptableOrUnknown(data['c_lac']!, _cLacMeta));
    }
    if (data.containsKey('ct_bil')) {
      context.handle(
          _ctBilMeta, ctBil.isAcceptableOrUnknown(data['ct_bil']!, _ctBilMeta));
    }
    if (data.containsKey('m_osmc')) {
      context.handle(
          _mOsmcMeta, mOsmc.isAcceptableOrUnknown(data['m_osmc']!, _mOsmcMeta));
    }
    if (data.containsKey('ph_t')) {
      context.handle(
          _phTMeta, phT.isAcceptableOrUnknown(data['ph_t']!, _phTMeta));
    }
    if (data.containsKey('p_c_o2_t')) {
      context.handle(_pCO2TMeta,
          pCO2T.isAcceptableOrUnknown(data['p_c_o2_t']!, _pCO2TMeta));
    }
    if (data.containsKey('p_o2_t')) {
      context.handle(
          _pO2TMeta, pO2T.isAcceptableOrUnknown(data['p_o2_t']!, _pO2TMeta));
    }
    if (data.containsKey('ct_o2c')) {
      context.handle(
          _ctO2cMeta, ctO2c.isAcceptableOrUnknown(data['ct_o2c']!, _ctO2cMeta));
    }
    if (data.containsKey('p50c')) {
      context.handle(
          _p50cMeta, p50c.isAcceptableOrUnknown(data['p50c']!, _p50cMeta));
    }
    if (data.containsKey('c_base_b')) {
      context.handle(_cBaseBMeta,
          cBaseB.isAcceptableOrUnknown(data['c_base_b']!, _cBaseBMeta));
    }
    if (data.containsKey('c_base_ecf')) {
      context.handle(_cBaseEcfMeta,
          cBaseEcf.isAcceptableOrUnknown(data['c_base_ecf']!, _cBaseEcfMeta));
    }
    if (data.containsKey('c_h_c_o3_pst')) {
      context.handle(_cHCO3PstMeta,
          cHCO3Pst.isAcceptableOrUnknown(data['c_h_c_o3_pst']!, _cHCO3PstMeta));
    }
    if (data.containsKey('c_h_c_o3_p')) {
      context.handle(_cHCO3PMeta,
          cHCO3P.isAcceptableOrUnknown(data['c_h_c_o3_p']!, _cHCO3PMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BloodGasRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BloodGasRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      pH: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_h']),
      pCO2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_c_o2']),
      pO2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_o2']),
      ctHb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ct_hb']),
      hctc: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hctc']),
      sO2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}s_o2']),
      fO2Hb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}f_o2_hb']),
      fCOHb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}f_c_o_hb']),
      fHHb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}f_h_hb']),
      fMetHb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}f_met_hb']),
      cNa: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_na']),
      cK: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_k']),
      cCa: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_ca']),
      cCl: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_cl']),
      cGlu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_glu']),
      cLac: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_lac']),
      ctBil: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ct_bil']),
      mOsmc: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}m_osmc']),
      phT: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ph_t']),
      pCO2T: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_c_o2_t']),
      pO2T: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_o2_t']),
      ctO2c: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ct_o2c']),
      p50c: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p50c']),
      cBaseB: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_base_b']),
      cBaseEcf: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_base_ecf']),
      cHCO3Pst: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_h_c_o3_pst']),
      cHCO3P: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}c_h_c_o3_p']),
    );
  }

  @override
  $BloodGasRecordsTable createAlias(String alias) {
    return $BloodGasRecordsTable(attachedDatabase, alias);
  }
}

class BloodGasRecord extends DataClass implements Insertable<BloodGasRecord> {
  final String id;
  final String patientId;
  final DateTime timestamp;
  final double? pH;
  final double? pCO2;
  final double? pO2;
  final double? ctHb;
  final double? hctc;
  final double? sO2;
  final double? fO2Hb;
  final double? fCOHb;
  final double? fHHb;
  final double? fMetHb;
  final double? cNa;
  final double? cK;
  final double? cCa;
  final double? cCl;
  final double? cGlu;
  final double? cLac;
  final double? ctBil;
  final double? mOsmc;
  final double? phT;
  final double? pCO2T;
  final double? pO2T;
  final double? ctO2c;
  final double? p50c;
  final double? cBaseB;
  final double? cBaseEcf;
  final double? cHCO3Pst;
  final double? cHCO3P;
  const BloodGasRecord(
      {required this.id,
      required this.patientId,
      required this.timestamp,
      this.pH,
      this.pCO2,
      this.pO2,
      this.ctHb,
      this.hctc,
      this.sO2,
      this.fO2Hb,
      this.fCOHb,
      this.fHHb,
      this.fMetHb,
      this.cNa,
      this.cK,
      this.cCa,
      this.cCl,
      this.cGlu,
      this.cLac,
      this.ctBil,
      this.mOsmc,
      this.phT,
      this.pCO2T,
      this.pO2T,
      this.ctO2c,
      this.p50c,
      this.cBaseB,
      this.cBaseEcf,
      this.cHCO3Pst,
      this.cHCO3P});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || pH != null) {
      map['p_h'] = Variable<double>(pH);
    }
    if (!nullToAbsent || pCO2 != null) {
      map['p_c_o2'] = Variable<double>(pCO2);
    }
    if (!nullToAbsent || pO2 != null) {
      map['p_o2'] = Variable<double>(pO2);
    }
    if (!nullToAbsent || ctHb != null) {
      map['ct_hb'] = Variable<double>(ctHb);
    }
    if (!nullToAbsent || hctc != null) {
      map['hctc'] = Variable<double>(hctc);
    }
    if (!nullToAbsent || sO2 != null) {
      map['s_o2'] = Variable<double>(sO2);
    }
    if (!nullToAbsent || fO2Hb != null) {
      map['f_o2_hb'] = Variable<double>(fO2Hb);
    }
    if (!nullToAbsent || fCOHb != null) {
      map['f_c_o_hb'] = Variable<double>(fCOHb);
    }
    if (!nullToAbsent || fHHb != null) {
      map['f_h_hb'] = Variable<double>(fHHb);
    }
    if (!nullToAbsent || fMetHb != null) {
      map['f_met_hb'] = Variable<double>(fMetHb);
    }
    if (!nullToAbsent || cNa != null) {
      map['c_na'] = Variable<double>(cNa);
    }
    if (!nullToAbsent || cK != null) {
      map['c_k'] = Variable<double>(cK);
    }
    if (!nullToAbsent || cCa != null) {
      map['c_ca'] = Variable<double>(cCa);
    }
    if (!nullToAbsent || cCl != null) {
      map['c_cl'] = Variable<double>(cCl);
    }
    if (!nullToAbsent || cGlu != null) {
      map['c_glu'] = Variable<double>(cGlu);
    }
    if (!nullToAbsent || cLac != null) {
      map['c_lac'] = Variable<double>(cLac);
    }
    if (!nullToAbsent || ctBil != null) {
      map['ct_bil'] = Variable<double>(ctBil);
    }
    if (!nullToAbsent || mOsmc != null) {
      map['m_osmc'] = Variable<double>(mOsmc);
    }
    if (!nullToAbsent || phT != null) {
      map['ph_t'] = Variable<double>(phT);
    }
    if (!nullToAbsent || pCO2T != null) {
      map['p_c_o2_t'] = Variable<double>(pCO2T);
    }
    if (!nullToAbsent || pO2T != null) {
      map['p_o2_t'] = Variable<double>(pO2T);
    }
    if (!nullToAbsent || ctO2c != null) {
      map['ct_o2c'] = Variable<double>(ctO2c);
    }
    if (!nullToAbsent || p50c != null) {
      map['p50c'] = Variable<double>(p50c);
    }
    if (!nullToAbsent || cBaseB != null) {
      map['c_base_b'] = Variable<double>(cBaseB);
    }
    if (!nullToAbsent || cBaseEcf != null) {
      map['c_base_ecf'] = Variable<double>(cBaseEcf);
    }
    if (!nullToAbsent || cHCO3Pst != null) {
      map['c_h_c_o3_pst'] = Variable<double>(cHCO3Pst);
    }
    if (!nullToAbsent || cHCO3P != null) {
      map['c_h_c_o3_p'] = Variable<double>(cHCO3P);
    }
    return map;
  }

  BloodGasRecordsCompanion toCompanion(bool nullToAbsent) {
    return BloodGasRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      timestamp: Value(timestamp),
      pH: pH == null && nullToAbsent ? const Value.absent() : Value(pH),
      pCO2: pCO2 == null && nullToAbsent ? const Value.absent() : Value(pCO2),
      pO2: pO2 == null && nullToAbsent ? const Value.absent() : Value(pO2),
      ctHb: ctHb == null && nullToAbsent ? const Value.absent() : Value(ctHb),
      hctc: hctc == null && nullToAbsent ? const Value.absent() : Value(hctc),
      sO2: sO2 == null && nullToAbsent ? const Value.absent() : Value(sO2),
      fO2Hb:
          fO2Hb == null && nullToAbsent ? const Value.absent() : Value(fO2Hb),
      fCOHb:
          fCOHb == null && nullToAbsent ? const Value.absent() : Value(fCOHb),
      fHHb: fHHb == null && nullToAbsent ? const Value.absent() : Value(fHHb),
      fMetHb:
          fMetHb == null && nullToAbsent ? const Value.absent() : Value(fMetHb),
      cNa: cNa == null && nullToAbsent ? const Value.absent() : Value(cNa),
      cK: cK == null && nullToAbsent ? const Value.absent() : Value(cK),
      cCa: cCa == null && nullToAbsent ? const Value.absent() : Value(cCa),
      cCl: cCl == null && nullToAbsent ? const Value.absent() : Value(cCl),
      cGlu: cGlu == null && nullToAbsent ? const Value.absent() : Value(cGlu),
      cLac: cLac == null && nullToAbsent ? const Value.absent() : Value(cLac),
      ctBil:
          ctBil == null && nullToAbsent ? const Value.absent() : Value(ctBil),
      mOsmc:
          mOsmc == null && nullToAbsent ? const Value.absent() : Value(mOsmc),
      phT: phT == null && nullToAbsent ? const Value.absent() : Value(phT),
      pCO2T:
          pCO2T == null && nullToAbsent ? const Value.absent() : Value(pCO2T),
      pO2T: pO2T == null && nullToAbsent ? const Value.absent() : Value(pO2T),
      ctO2c:
          ctO2c == null && nullToAbsent ? const Value.absent() : Value(ctO2c),
      p50c: p50c == null && nullToAbsent ? const Value.absent() : Value(p50c),
      cBaseB:
          cBaseB == null && nullToAbsent ? const Value.absent() : Value(cBaseB),
      cBaseEcf: cBaseEcf == null && nullToAbsent
          ? const Value.absent()
          : Value(cBaseEcf),
      cHCO3Pst: cHCO3Pst == null && nullToAbsent
          ? const Value.absent()
          : Value(cHCO3Pst),
      cHCO3P:
          cHCO3P == null && nullToAbsent ? const Value.absent() : Value(cHCO3P),
    );
  }

  factory BloodGasRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BloodGasRecord(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      pH: serializer.fromJson<double?>(json['pH']),
      pCO2: serializer.fromJson<double?>(json['pCO2']),
      pO2: serializer.fromJson<double?>(json['pO2']),
      ctHb: serializer.fromJson<double?>(json['ctHb']),
      hctc: serializer.fromJson<double?>(json['hctc']),
      sO2: serializer.fromJson<double?>(json['sO2']),
      fO2Hb: serializer.fromJson<double?>(json['fO2Hb']),
      fCOHb: serializer.fromJson<double?>(json['fCOHb']),
      fHHb: serializer.fromJson<double?>(json['fHHb']),
      fMetHb: serializer.fromJson<double?>(json['fMetHb']),
      cNa: serializer.fromJson<double?>(json['cNa']),
      cK: serializer.fromJson<double?>(json['cK']),
      cCa: serializer.fromJson<double?>(json['cCa']),
      cCl: serializer.fromJson<double?>(json['cCl']),
      cGlu: serializer.fromJson<double?>(json['cGlu']),
      cLac: serializer.fromJson<double?>(json['cLac']),
      ctBil: serializer.fromJson<double?>(json['ctBil']),
      mOsmc: serializer.fromJson<double?>(json['mOsmc']),
      phT: serializer.fromJson<double?>(json['phT']),
      pCO2T: serializer.fromJson<double?>(json['pCO2T']),
      pO2T: serializer.fromJson<double?>(json['pO2T']),
      ctO2c: serializer.fromJson<double?>(json['ctO2c']),
      p50c: serializer.fromJson<double?>(json['p50c']),
      cBaseB: serializer.fromJson<double?>(json['cBaseB']),
      cBaseEcf: serializer.fromJson<double?>(json['cBaseEcf']),
      cHCO3Pst: serializer.fromJson<double?>(json['cHCO3Pst']),
      cHCO3P: serializer.fromJson<double?>(json['cHCO3P']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'pH': serializer.toJson<double?>(pH),
      'pCO2': serializer.toJson<double?>(pCO2),
      'pO2': serializer.toJson<double?>(pO2),
      'ctHb': serializer.toJson<double?>(ctHb),
      'hctc': serializer.toJson<double?>(hctc),
      'sO2': serializer.toJson<double?>(sO2),
      'fO2Hb': serializer.toJson<double?>(fO2Hb),
      'fCOHb': serializer.toJson<double?>(fCOHb),
      'fHHb': serializer.toJson<double?>(fHHb),
      'fMetHb': serializer.toJson<double?>(fMetHb),
      'cNa': serializer.toJson<double?>(cNa),
      'cK': serializer.toJson<double?>(cK),
      'cCa': serializer.toJson<double?>(cCa),
      'cCl': serializer.toJson<double?>(cCl),
      'cGlu': serializer.toJson<double?>(cGlu),
      'cLac': serializer.toJson<double?>(cLac),
      'ctBil': serializer.toJson<double?>(ctBil),
      'mOsmc': serializer.toJson<double?>(mOsmc),
      'phT': serializer.toJson<double?>(phT),
      'pCO2T': serializer.toJson<double?>(pCO2T),
      'pO2T': serializer.toJson<double?>(pO2T),
      'ctO2c': serializer.toJson<double?>(ctO2c),
      'p50c': serializer.toJson<double?>(p50c),
      'cBaseB': serializer.toJson<double?>(cBaseB),
      'cBaseEcf': serializer.toJson<double?>(cBaseEcf),
      'cHCO3Pst': serializer.toJson<double?>(cHCO3Pst),
      'cHCO3P': serializer.toJson<double?>(cHCO3P),
    };
  }

  BloodGasRecord copyWith(
          {String? id,
          String? patientId,
          DateTime? timestamp,
          Value<double?> pH = const Value.absent(),
          Value<double?> pCO2 = const Value.absent(),
          Value<double?> pO2 = const Value.absent(),
          Value<double?> ctHb = const Value.absent(),
          Value<double?> hctc = const Value.absent(),
          Value<double?> sO2 = const Value.absent(),
          Value<double?> fO2Hb = const Value.absent(),
          Value<double?> fCOHb = const Value.absent(),
          Value<double?> fHHb = const Value.absent(),
          Value<double?> fMetHb = const Value.absent(),
          Value<double?> cNa = const Value.absent(),
          Value<double?> cK = const Value.absent(),
          Value<double?> cCa = const Value.absent(),
          Value<double?> cCl = const Value.absent(),
          Value<double?> cGlu = const Value.absent(),
          Value<double?> cLac = const Value.absent(),
          Value<double?> ctBil = const Value.absent(),
          Value<double?> mOsmc = const Value.absent(),
          Value<double?> phT = const Value.absent(),
          Value<double?> pCO2T = const Value.absent(),
          Value<double?> pO2T = const Value.absent(),
          Value<double?> ctO2c = const Value.absent(),
          Value<double?> p50c = const Value.absent(),
          Value<double?> cBaseB = const Value.absent(),
          Value<double?> cBaseEcf = const Value.absent(),
          Value<double?> cHCO3Pst = const Value.absent(),
          Value<double?> cHCO3P = const Value.absent()}) =>
      BloodGasRecord(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        timestamp: timestamp ?? this.timestamp,
        pH: pH.present ? pH.value : this.pH,
        pCO2: pCO2.present ? pCO2.value : this.pCO2,
        pO2: pO2.present ? pO2.value : this.pO2,
        ctHb: ctHb.present ? ctHb.value : this.ctHb,
        hctc: hctc.present ? hctc.value : this.hctc,
        sO2: sO2.present ? sO2.value : this.sO2,
        fO2Hb: fO2Hb.present ? fO2Hb.value : this.fO2Hb,
        fCOHb: fCOHb.present ? fCOHb.value : this.fCOHb,
        fHHb: fHHb.present ? fHHb.value : this.fHHb,
        fMetHb: fMetHb.present ? fMetHb.value : this.fMetHb,
        cNa: cNa.present ? cNa.value : this.cNa,
        cK: cK.present ? cK.value : this.cK,
        cCa: cCa.present ? cCa.value : this.cCa,
        cCl: cCl.present ? cCl.value : this.cCl,
        cGlu: cGlu.present ? cGlu.value : this.cGlu,
        cLac: cLac.present ? cLac.value : this.cLac,
        ctBil: ctBil.present ? ctBil.value : this.ctBil,
        mOsmc: mOsmc.present ? mOsmc.value : this.mOsmc,
        phT: phT.present ? phT.value : this.phT,
        pCO2T: pCO2T.present ? pCO2T.value : this.pCO2T,
        pO2T: pO2T.present ? pO2T.value : this.pO2T,
        ctO2c: ctO2c.present ? ctO2c.value : this.ctO2c,
        p50c: p50c.present ? p50c.value : this.p50c,
        cBaseB: cBaseB.present ? cBaseB.value : this.cBaseB,
        cBaseEcf: cBaseEcf.present ? cBaseEcf.value : this.cBaseEcf,
        cHCO3Pst: cHCO3Pst.present ? cHCO3Pst.value : this.cHCO3Pst,
        cHCO3P: cHCO3P.present ? cHCO3P.value : this.cHCO3P,
      );
  BloodGasRecord copyWithCompanion(BloodGasRecordsCompanion data) {
    return BloodGasRecord(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      pH: data.pH.present ? data.pH.value : this.pH,
      pCO2: data.pCO2.present ? data.pCO2.value : this.pCO2,
      pO2: data.pO2.present ? data.pO2.value : this.pO2,
      ctHb: data.ctHb.present ? data.ctHb.value : this.ctHb,
      hctc: data.hctc.present ? data.hctc.value : this.hctc,
      sO2: data.sO2.present ? data.sO2.value : this.sO2,
      fO2Hb: data.fO2Hb.present ? data.fO2Hb.value : this.fO2Hb,
      fCOHb: data.fCOHb.present ? data.fCOHb.value : this.fCOHb,
      fHHb: data.fHHb.present ? data.fHHb.value : this.fHHb,
      fMetHb: data.fMetHb.present ? data.fMetHb.value : this.fMetHb,
      cNa: data.cNa.present ? data.cNa.value : this.cNa,
      cK: data.cK.present ? data.cK.value : this.cK,
      cCa: data.cCa.present ? data.cCa.value : this.cCa,
      cCl: data.cCl.present ? data.cCl.value : this.cCl,
      cGlu: data.cGlu.present ? data.cGlu.value : this.cGlu,
      cLac: data.cLac.present ? data.cLac.value : this.cLac,
      ctBil: data.ctBil.present ? data.ctBil.value : this.ctBil,
      mOsmc: data.mOsmc.present ? data.mOsmc.value : this.mOsmc,
      phT: data.phT.present ? data.phT.value : this.phT,
      pCO2T: data.pCO2T.present ? data.pCO2T.value : this.pCO2T,
      pO2T: data.pO2T.present ? data.pO2T.value : this.pO2T,
      ctO2c: data.ctO2c.present ? data.ctO2c.value : this.ctO2c,
      p50c: data.p50c.present ? data.p50c.value : this.p50c,
      cBaseB: data.cBaseB.present ? data.cBaseB.value : this.cBaseB,
      cBaseEcf: data.cBaseEcf.present ? data.cBaseEcf.value : this.cBaseEcf,
      cHCO3Pst: data.cHCO3Pst.present ? data.cHCO3Pst.value : this.cHCO3Pst,
      cHCO3P: data.cHCO3P.present ? data.cHCO3P.value : this.cHCO3P,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BloodGasRecord(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('timestamp: $timestamp, ')
          ..write('pH: $pH, ')
          ..write('pCO2: $pCO2, ')
          ..write('pO2: $pO2, ')
          ..write('ctHb: $ctHb, ')
          ..write('hctc: $hctc, ')
          ..write('sO2: $sO2, ')
          ..write('fO2Hb: $fO2Hb, ')
          ..write('fCOHb: $fCOHb, ')
          ..write('fHHb: $fHHb, ')
          ..write('fMetHb: $fMetHb, ')
          ..write('cNa: $cNa, ')
          ..write('cK: $cK, ')
          ..write('cCa: $cCa, ')
          ..write('cCl: $cCl, ')
          ..write('cGlu: $cGlu, ')
          ..write('cLac: $cLac, ')
          ..write('ctBil: $ctBil, ')
          ..write('mOsmc: $mOsmc, ')
          ..write('phT: $phT, ')
          ..write('pCO2T: $pCO2T, ')
          ..write('pO2T: $pO2T, ')
          ..write('ctO2c: $ctO2c, ')
          ..write('p50c: $p50c, ')
          ..write('cBaseB: $cBaseB, ')
          ..write('cBaseEcf: $cBaseEcf, ')
          ..write('cHCO3Pst: $cHCO3Pst, ')
          ..write('cHCO3P: $cHCO3P')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        patientId,
        timestamp,
        pH,
        pCO2,
        pO2,
        ctHb,
        hctc,
        sO2,
        fO2Hb,
        fCOHb,
        fHHb,
        fMetHb,
        cNa,
        cK,
        cCa,
        cCl,
        cGlu,
        cLac,
        ctBil,
        mOsmc,
        phT,
        pCO2T,
        pO2T,
        ctO2c,
        p50c,
        cBaseB,
        cBaseEcf,
        cHCO3Pst,
        cHCO3P
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BloodGasRecord &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.timestamp == this.timestamp &&
          other.pH == this.pH &&
          other.pCO2 == this.pCO2 &&
          other.pO2 == this.pO2 &&
          other.ctHb == this.ctHb &&
          other.hctc == this.hctc &&
          other.sO2 == this.sO2 &&
          other.fO2Hb == this.fO2Hb &&
          other.fCOHb == this.fCOHb &&
          other.fHHb == this.fHHb &&
          other.fMetHb == this.fMetHb &&
          other.cNa == this.cNa &&
          other.cK == this.cK &&
          other.cCa == this.cCa &&
          other.cCl == this.cCl &&
          other.cGlu == this.cGlu &&
          other.cLac == this.cLac &&
          other.ctBil == this.ctBil &&
          other.mOsmc == this.mOsmc &&
          other.phT == this.phT &&
          other.pCO2T == this.pCO2T &&
          other.pO2T == this.pO2T &&
          other.ctO2c == this.ctO2c &&
          other.p50c == this.p50c &&
          other.cBaseB == this.cBaseB &&
          other.cBaseEcf == this.cBaseEcf &&
          other.cHCO3Pst == this.cHCO3Pst &&
          other.cHCO3P == this.cHCO3P);
}

class BloodGasRecordsCompanion extends UpdateCompanion<BloodGasRecord> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<DateTime> timestamp;
  final Value<double?> pH;
  final Value<double?> pCO2;
  final Value<double?> pO2;
  final Value<double?> ctHb;
  final Value<double?> hctc;
  final Value<double?> sO2;
  final Value<double?> fO2Hb;
  final Value<double?> fCOHb;
  final Value<double?> fHHb;
  final Value<double?> fMetHb;
  final Value<double?> cNa;
  final Value<double?> cK;
  final Value<double?> cCa;
  final Value<double?> cCl;
  final Value<double?> cGlu;
  final Value<double?> cLac;
  final Value<double?> ctBil;
  final Value<double?> mOsmc;
  final Value<double?> phT;
  final Value<double?> pCO2T;
  final Value<double?> pO2T;
  final Value<double?> ctO2c;
  final Value<double?> p50c;
  final Value<double?> cBaseB;
  final Value<double?> cBaseEcf;
  final Value<double?> cHCO3Pst;
  final Value<double?> cHCO3P;
  final Value<int> rowid;
  const BloodGasRecordsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.pH = const Value.absent(),
    this.pCO2 = const Value.absent(),
    this.pO2 = const Value.absent(),
    this.ctHb = const Value.absent(),
    this.hctc = const Value.absent(),
    this.sO2 = const Value.absent(),
    this.fO2Hb = const Value.absent(),
    this.fCOHb = const Value.absent(),
    this.fHHb = const Value.absent(),
    this.fMetHb = const Value.absent(),
    this.cNa = const Value.absent(),
    this.cK = const Value.absent(),
    this.cCa = const Value.absent(),
    this.cCl = const Value.absent(),
    this.cGlu = const Value.absent(),
    this.cLac = const Value.absent(),
    this.ctBil = const Value.absent(),
    this.mOsmc = const Value.absent(),
    this.phT = const Value.absent(),
    this.pCO2T = const Value.absent(),
    this.pO2T = const Value.absent(),
    this.ctO2c = const Value.absent(),
    this.p50c = const Value.absent(),
    this.cBaseB = const Value.absent(),
    this.cBaseEcf = const Value.absent(),
    this.cHCO3Pst = const Value.absent(),
    this.cHCO3P = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BloodGasRecordsCompanion.insert({
    required String id,
    required String patientId,
    required DateTime timestamp,
    this.pH = const Value.absent(),
    this.pCO2 = const Value.absent(),
    this.pO2 = const Value.absent(),
    this.ctHb = const Value.absent(),
    this.hctc = const Value.absent(),
    this.sO2 = const Value.absent(),
    this.fO2Hb = const Value.absent(),
    this.fCOHb = const Value.absent(),
    this.fHHb = const Value.absent(),
    this.fMetHb = const Value.absent(),
    this.cNa = const Value.absent(),
    this.cK = const Value.absent(),
    this.cCa = const Value.absent(),
    this.cCl = const Value.absent(),
    this.cGlu = const Value.absent(),
    this.cLac = const Value.absent(),
    this.ctBil = const Value.absent(),
    this.mOsmc = const Value.absent(),
    this.phT = const Value.absent(),
    this.pCO2T = const Value.absent(),
    this.pO2T = const Value.absent(),
    this.ctO2c = const Value.absent(),
    this.p50c = const Value.absent(),
    this.cBaseB = const Value.absent(),
    this.cBaseEcf = const Value.absent(),
    this.cHCO3Pst = const Value.absent(),
    this.cHCO3P = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        timestamp = Value(timestamp);
  static Insertable<BloodGasRecord> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<DateTime>? timestamp,
    Expression<double>? pH,
    Expression<double>? pCO2,
    Expression<double>? pO2,
    Expression<double>? ctHb,
    Expression<double>? hctc,
    Expression<double>? sO2,
    Expression<double>? fO2Hb,
    Expression<double>? fCOHb,
    Expression<double>? fHHb,
    Expression<double>? fMetHb,
    Expression<double>? cNa,
    Expression<double>? cK,
    Expression<double>? cCa,
    Expression<double>? cCl,
    Expression<double>? cGlu,
    Expression<double>? cLac,
    Expression<double>? ctBil,
    Expression<double>? mOsmc,
    Expression<double>? phT,
    Expression<double>? pCO2T,
    Expression<double>? pO2T,
    Expression<double>? ctO2c,
    Expression<double>? p50c,
    Expression<double>? cBaseB,
    Expression<double>? cBaseEcf,
    Expression<double>? cHCO3Pst,
    Expression<double>? cHCO3P,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (timestamp != null) 'timestamp': timestamp,
      if (pH != null) 'p_h': pH,
      if (pCO2 != null) 'p_c_o2': pCO2,
      if (pO2 != null) 'p_o2': pO2,
      if (ctHb != null) 'ct_hb': ctHb,
      if (hctc != null) 'hctc': hctc,
      if (sO2 != null) 's_o2': sO2,
      if (fO2Hb != null) 'f_o2_hb': fO2Hb,
      if (fCOHb != null) 'f_c_o_hb': fCOHb,
      if (fHHb != null) 'f_h_hb': fHHb,
      if (fMetHb != null) 'f_met_hb': fMetHb,
      if (cNa != null) 'c_na': cNa,
      if (cK != null) 'c_k': cK,
      if (cCa != null) 'c_ca': cCa,
      if (cCl != null) 'c_cl': cCl,
      if (cGlu != null) 'c_glu': cGlu,
      if (cLac != null) 'c_lac': cLac,
      if (ctBil != null) 'ct_bil': ctBil,
      if (mOsmc != null) 'm_osmc': mOsmc,
      if (phT != null) 'ph_t': phT,
      if (pCO2T != null) 'p_c_o2_t': pCO2T,
      if (pO2T != null) 'p_o2_t': pO2T,
      if (ctO2c != null) 'ct_o2c': ctO2c,
      if (p50c != null) 'p50c': p50c,
      if (cBaseB != null) 'c_base_b': cBaseB,
      if (cBaseEcf != null) 'c_base_ecf': cBaseEcf,
      if (cHCO3Pst != null) 'c_h_c_o3_pst': cHCO3Pst,
      if (cHCO3P != null) 'c_h_c_o3_p': cHCO3P,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BloodGasRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<DateTime>? timestamp,
      Value<double?>? pH,
      Value<double?>? pCO2,
      Value<double?>? pO2,
      Value<double?>? ctHb,
      Value<double?>? hctc,
      Value<double?>? sO2,
      Value<double?>? fO2Hb,
      Value<double?>? fCOHb,
      Value<double?>? fHHb,
      Value<double?>? fMetHb,
      Value<double?>? cNa,
      Value<double?>? cK,
      Value<double?>? cCa,
      Value<double?>? cCl,
      Value<double?>? cGlu,
      Value<double?>? cLac,
      Value<double?>? ctBil,
      Value<double?>? mOsmc,
      Value<double?>? phT,
      Value<double?>? pCO2T,
      Value<double?>? pO2T,
      Value<double?>? ctO2c,
      Value<double?>? p50c,
      Value<double?>? cBaseB,
      Value<double?>? cBaseEcf,
      Value<double?>? cHCO3Pst,
      Value<double?>? cHCO3P,
      Value<int>? rowid}) {
    return BloodGasRecordsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      timestamp: timestamp ?? this.timestamp,
      pH: pH ?? this.pH,
      pCO2: pCO2 ?? this.pCO2,
      pO2: pO2 ?? this.pO2,
      ctHb: ctHb ?? this.ctHb,
      hctc: hctc ?? this.hctc,
      sO2: sO2 ?? this.sO2,
      fO2Hb: fO2Hb ?? this.fO2Hb,
      fCOHb: fCOHb ?? this.fCOHb,
      fHHb: fHHb ?? this.fHHb,
      fMetHb: fMetHb ?? this.fMetHb,
      cNa: cNa ?? this.cNa,
      cK: cK ?? this.cK,
      cCa: cCa ?? this.cCa,
      cCl: cCl ?? this.cCl,
      cGlu: cGlu ?? this.cGlu,
      cLac: cLac ?? this.cLac,
      ctBil: ctBil ?? this.ctBil,
      mOsmc: mOsmc ?? this.mOsmc,
      phT: phT ?? this.phT,
      pCO2T: pCO2T ?? this.pCO2T,
      pO2T: pO2T ?? this.pO2T,
      ctO2c: ctO2c ?? this.ctO2c,
      p50c: p50c ?? this.p50c,
      cBaseB: cBaseB ?? this.cBaseB,
      cBaseEcf: cBaseEcf ?? this.cBaseEcf,
      cHCO3Pst: cHCO3Pst ?? this.cHCO3Pst,
      cHCO3P: cHCO3P ?? this.cHCO3P,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (pH.present) {
      map['p_h'] = Variable<double>(pH.value);
    }
    if (pCO2.present) {
      map['p_c_o2'] = Variable<double>(pCO2.value);
    }
    if (pO2.present) {
      map['p_o2'] = Variable<double>(pO2.value);
    }
    if (ctHb.present) {
      map['ct_hb'] = Variable<double>(ctHb.value);
    }
    if (hctc.present) {
      map['hctc'] = Variable<double>(hctc.value);
    }
    if (sO2.present) {
      map['s_o2'] = Variable<double>(sO2.value);
    }
    if (fO2Hb.present) {
      map['f_o2_hb'] = Variable<double>(fO2Hb.value);
    }
    if (fCOHb.present) {
      map['f_c_o_hb'] = Variable<double>(fCOHb.value);
    }
    if (fHHb.present) {
      map['f_h_hb'] = Variable<double>(fHHb.value);
    }
    if (fMetHb.present) {
      map['f_met_hb'] = Variable<double>(fMetHb.value);
    }
    if (cNa.present) {
      map['c_na'] = Variable<double>(cNa.value);
    }
    if (cK.present) {
      map['c_k'] = Variable<double>(cK.value);
    }
    if (cCa.present) {
      map['c_ca'] = Variable<double>(cCa.value);
    }
    if (cCl.present) {
      map['c_cl'] = Variable<double>(cCl.value);
    }
    if (cGlu.present) {
      map['c_glu'] = Variable<double>(cGlu.value);
    }
    if (cLac.present) {
      map['c_lac'] = Variable<double>(cLac.value);
    }
    if (ctBil.present) {
      map['ct_bil'] = Variable<double>(ctBil.value);
    }
    if (mOsmc.present) {
      map['m_osmc'] = Variable<double>(mOsmc.value);
    }
    if (phT.present) {
      map['ph_t'] = Variable<double>(phT.value);
    }
    if (pCO2T.present) {
      map['p_c_o2_t'] = Variable<double>(pCO2T.value);
    }
    if (pO2T.present) {
      map['p_o2_t'] = Variable<double>(pO2T.value);
    }
    if (ctO2c.present) {
      map['ct_o2c'] = Variable<double>(ctO2c.value);
    }
    if (p50c.present) {
      map['p50c'] = Variable<double>(p50c.value);
    }
    if (cBaseB.present) {
      map['c_base_b'] = Variable<double>(cBaseB.value);
    }
    if (cBaseEcf.present) {
      map['c_base_ecf'] = Variable<double>(cBaseEcf.value);
    }
    if (cHCO3Pst.present) {
      map['c_h_c_o3_pst'] = Variable<double>(cHCO3Pst.value);
    }
    if (cHCO3P.present) {
      map['c_h_c_o3_p'] = Variable<double>(cHCO3P.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodGasRecordsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('timestamp: $timestamp, ')
          ..write('pH: $pH, ')
          ..write('pCO2: $pCO2, ')
          ..write('pO2: $pO2, ')
          ..write('ctHb: $ctHb, ')
          ..write('hctc: $hctc, ')
          ..write('sO2: $sO2, ')
          ..write('fO2Hb: $fO2Hb, ')
          ..write('fCOHb: $fCOHb, ')
          ..write('fHHb: $fHHb, ')
          ..write('fMetHb: $fMetHb, ')
          ..write('cNa: $cNa, ')
          ..write('cK: $cK, ')
          ..write('cCa: $cCa, ')
          ..write('cCl: $cCl, ')
          ..write('cGlu: $cGlu, ')
          ..write('cLac: $cLac, ')
          ..write('ctBil: $ctBil, ')
          ..write('mOsmc: $mOsmc, ')
          ..write('phT: $phT, ')
          ..write('pCO2T: $pCO2T, ')
          ..write('pO2T: $pO2T, ')
          ..write('ctO2c: $ctO2c, ')
          ..write('p50c: $p50c, ')
          ..write('cBaseB: $cBaseB, ')
          ..write('cBaseEcf: $cBaseEcf, ')
          ..write('cHCO3Pst: $cHCO3Pst, ')
          ..write('cHCO3P: $cHCO3P, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $BloodGasRecordsTable bloodGasRecords =
      $BloodGasRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [patients, bloodGasRecords];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('patients',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('blood_gas_records', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$PatientsTableCreateCompanionBuilder = PatientsCompanion Function({
  required String id,
  required String operatingRoomName,
  Value<String> residentId,
  required DateTime surgeryStartTime,
  Value<DateTime?> surgeryEndTime,
  Value<bool> isActive,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$PatientsTableUpdateCompanionBuilder = PatientsCompanion Function({
  Value<String> id,
  Value<String> operatingRoomName,
  Value<String> residentId,
  Value<DateTime> surgeryStartTime,
  Value<DateTime?> surgeryEndTime,
  Value<bool> isActive,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BloodGasRecordsTable, List<BloodGasRecord>>
      _bloodGasRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.bloodGasRecords,
              aliasName: $_aliasNameGenerator(
                  db.patients.id, db.bloodGasRecords.patientId));

  $$BloodGasRecordsTableProcessedTableManager get bloodGasRecordsRefs {
    final manager = $$BloodGasRecordsTableTableManager(
            $_db, $_db.bloodGasRecords)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_bloodGasRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operatingRoomName => $composableBuilder(
      column: $table.operatingRoomName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get residentId => $composableBuilder(
      column: $table.residentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get surgeryStartTime => $composableBuilder(
      column: $table.surgeryStartTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get surgeryEndTime => $composableBuilder(
      column: $table.surgeryEndTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> bloodGasRecordsRefs(
      Expression<bool> Function($$BloodGasRecordsTableFilterComposer f) f) {
    final $$BloodGasRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bloodGasRecords,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BloodGasRecordsTableFilterComposer(
              $db: $db,
              $table: $db.bloodGasRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operatingRoomName => $composableBuilder(
      column: $table.operatingRoomName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get residentId => $composableBuilder(
      column: $table.residentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get surgeryStartTime => $composableBuilder(
      column: $table.surgeryStartTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get surgeryEndTime => $composableBuilder(
      column: $table.surgeryEndTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operatingRoomName => $composableBuilder(
      column: $table.operatingRoomName, builder: (column) => column);

  GeneratedColumn<String> get residentId => $composableBuilder(
      column: $table.residentId, builder: (column) => column);

  GeneratedColumn<DateTime> get surgeryStartTime => $composableBuilder(
      column: $table.surgeryStartTime, builder: (column) => column);

  GeneratedColumn<DateTime> get surgeryEndTime => $composableBuilder(
      column: $table.surgeryEndTime, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> bloodGasRecordsRefs<T extends Object>(
      Expression<T> Function($$BloodGasRecordsTableAnnotationComposer a) f) {
    final $$BloodGasRecordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.bloodGasRecords,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BloodGasRecordsTableAnnotationComposer(
              $db: $db,
              $table: $db.bloodGasRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PatientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, $$PatientsTableReferences),
    Patient,
    PrefetchHooks Function({bool bloodGasRecordsRefs})> {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> operatingRoomName = const Value.absent(),
            Value<String> residentId = const Value.absent(),
            Value<DateTime> surgeryStartTime = const Value.absent(),
            Value<DateTime?> surgeryEndTime = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion(
            id: id,
            operatingRoomName: operatingRoomName,
            residentId: residentId,
            surgeryStartTime: surgeryStartTime,
            surgeryEndTime: surgeryEndTime,
            isActive: isActive,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String operatingRoomName,
            Value<String> residentId = const Value.absent(),
            required DateTime surgeryStartTime,
            Value<DateTime?> surgeryEndTime = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion.insert(
            id: id,
            operatingRoomName: operatingRoomName,
            residentId: residentId,
            surgeryStartTime: surgeryStartTime,
            surgeryEndTime: surgeryEndTime,
            isActive: isActive,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PatientsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({bloodGasRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bloodGasRecordsRefs) db.bloodGasRecords
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bloodGasRecordsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            BloodGasRecord>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._bloodGasRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .bloodGasRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PatientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, $$PatientsTableReferences),
    Patient,
    PrefetchHooks Function({bool bloodGasRecordsRefs})>;
typedef $$BloodGasRecordsTableCreateCompanionBuilder = BloodGasRecordsCompanion
    Function({
  required String id,
  required String patientId,
  required DateTime timestamp,
  Value<double?> pH,
  Value<double?> pCO2,
  Value<double?> pO2,
  Value<double?> ctHb,
  Value<double?> hctc,
  Value<double?> sO2,
  Value<double?> fO2Hb,
  Value<double?> fCOHb,
  Value<double?> fHHb,
  Value<double?> fMetHb,
  Value<double?> cNa,
  Value<double?> cK,
  Value<double?> cCa,
  Value<double?> cCl,
  Value<double?> cGlu,
  Value<double?> cLac,
  Value<double?> ctBil,
  Value<double?> mOsmc,
  Value<double?> phT,
  Value<double?> pCO2T,
  Value<double?> pO2T,
  Value<double?> ctO2c,
  Value<double?> p50c,
  Value<double?> cBaseB,
  Value<double?> cBaseEcf,
  Value<double?> cHCO3Pst,
  Value<double?> cHCO3P,
  Value<int> rowid,
});
typedef $$BloodGasRecordsTableUpdateCompanionBuilder = BloodGasRecordsCompanion
    Function({
  Value<String> id,
  Value<String> patientId,
  Value<DateTime> timestamp,
  Value<double?> pH,
  Value<double?> pCO2,
  Value<double?> pO2,
  Value<double?> ctHb,
  Value<double?> hctc,
  Value<double?> sO2,
  Value<double?> fO2Hb,
  Value<double?> fCOHb,
  Value<double?> fHHb,
  Value<double?> fMetHb,
  Value<double?> cNa,
  Value<double?> cK,
  Value<double?> cCa,
  Value<double?> cCl,
  Value<double?> cGlu,
  Value<double?> cLac,
  Value<double?> ctBil,
  Value<double?> mOsmc,
  Value<double?> phT,
  Value<double?> pCO2T,
  Value<double?> pO2T,
  Value<double?> ctO2c,
  Value<double?> p50c,
  Value<double?> cBaseB,
  Value<double?> cBaseEcf,
  Value<double?> cHCO3Pst,
  Value<double?> cHCO3P,
  Value<int> rowid,
});

final class $$BloodGasRecordsTableReferences extends BaseReferences<
    _$AppDatabase, $BloodGasRecordsTable, BloodGasRecord> {
  $$BloodGasRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias(
          $_aliasNameGenerator(db.bloodGasRecords.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BloodGasRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $BloodGasRecordsTable> {
  $$BloodGasRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pH => $composableBuilder(
      column: $table.pH, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pCO2 => $composableBuilder(
      column: $table.pCO2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pO2 => $composableBuilder(
      column: $table.pO2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get ctHb => $composableBuilder(
      column: $table.ctHb, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hctc => $composableBuilder(
      column: $table.hctc, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sO2 => $composableBuilder(
      column: $table.sO2, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fO2Hb => $composableBuilder(
      column: $table.fO2Hb, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fCOHb => $composableBuilder(
      column: $table.fCOHb, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fHHb => $composableBuilder(
      column: $table.fHHb, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fMetHb => $composableBuilder(
      column: $table.fMetHb, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cNa => $composableBuilder(
      column: $table.cNa, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cK => $composableBuilder(
      column: $table.cK, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cCa => $composableBuilder(
      column: $table.cCa, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cCl => $composableBuilder(
      column: $table.cCl, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cGlu => $composableBuilder(
      column: $table.cGlu, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cLac => $composableBuilder(
      column: $table.cLac, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get ctBil => $composableBuilder(
      column: $table.ctBil, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get mOsmc => $composableBuilder(
      column: $table.mOsmc, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get phT => $composableBuilder(
      column: $table.phT, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pCO2T => $composableBuilder(
      column: $table.pCO2T, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pO2T => $composableBuilder(
      column: $table.pO2T, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get ctO2c => $composableBuilder(
      column: $table.ctO2c, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get p50c => $composableBuilder(
      column: $table.p50c, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cBaseB => $composableBuilder(
      column: $table.cBaseB, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cBaseEcf => $composableBuilder(
      column: $table.cBaseEcf, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cHCO3Pst => $composableBuilder(
      column: $table.cHCO3Pst, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cHCO3P => $composableBuilder(
      column: $table.cHCO3P, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BloodGasRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $BloodGasRecordsTable> {
  $$BloodGasRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pH => $composableBuilder(
      column: $table.pH, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pCO2 => $composableBuilder(
      column: $table.pCO2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pO2 => $composableBuilder(
      column: $table.pO2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get ctHb => $composableBuilder(
      column: $table.ctHb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hctc => $composableBuilder(
      column: $table.hctc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sO2 => $composableBuilder(
      column: $table.sO2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fO2Hb => $composableBuilder(
      column: $table.fO2Hb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fCOHb => $composableBuilder(
      column: $table.fCOHb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fHHb => $composableBuilder(
      column: $table.fHHb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fMetHb => $composableBuilder(
      column: $table.fMetHb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cNa => $composableBuilder(
      column: $table.cNa, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cK => $composableBuilder(
      column: $table.cK, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cCa => $composableBuilder(
      column: $table.cCa, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cCl => $composableBuilder(
      column: $table.cCl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cGlu => $composableBuilder(
      column: $table.cGlu, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cLac => $composableBuilder(
      column: $table.cLac, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get ctBil => $composableBuilder(
      column: $table.ctBil, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get mOsmc => $composableBuilder(
      column: $table.mOsmc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get phT => $composableBuilder(
      column: $table.phT, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pCO2T => $composableBuilder(
      column: $table.pCO2T, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pO2T => $composableBuilder(
      column: $table.pO2T, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get ctO2c => $composableBuilder(
      column: $table.ctO2c, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get p50c => $composableBuilder(
      column: $table.p50c, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cBaseB => $composableBuilder(
      column: $table.cBaseB, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cBaseEcf => $composableBuilder(
      column: $table.cBaseEcf, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cHCO3Pst => $composableBuilder(
      column: $table.cHCO3Pst, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cHCO3P => $composableBuilder(
      column: $table.cHCO3P, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BloodGasRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BloodGasRecordsTable> {
  $$BloodGasRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get pH =>
      $composableBuilder(column: $table.pH, builder: (column) => column);

  GeneratedColumn<double> get pCO2 =>
      $composableBuilder(column: $table.pCO2, builder: (column) => column);

  GeneratedColumn<double> get pO2 =>
      $composableBuilder(column: $table.pO2, builder: (column) => column);

  GeneratedColumn<double> get ctHb =>
      $composableBuilder(column: $table.ctHb, builder: (column) => column);

  GeneratedColumn<double> get hctc =>
      $composableBuilder(column: $table.hctc, builder: (column) => column);

  GeneratedColumn<double> get sO2 =>
      $composableBuilder(column: $table.sO2, builder: (column) => column);

  GeneratedColumn<double> get fO2Hb =>
      $composableBuilder(column: $table.fO2Hb, builder: (column) => column);

  GeneratedColumn<double> get fCOHb =>
      $composableBuilder(column: $table.fCOHb, builder: (column) => column);

  GeneratedColumn<double> get fHHb =>
      $composableBuilder(column: $table.fHHb, builder: (column) => column);

  GeneratedColumn<double> get fMetHb =>
      $composableBuilder(column: $table.fMetHb, builder: (column) => column);

  GeneratedColumn<double> get cNa =>
      $composableBuilder(column: $table.cNa, builder: (column) => column);

  GeneratedColumn<double> get cK =>
      $composableBuilder(column: $table.cK, builder: (column) => column);

  GeneratedColumn<double> get cCa =>
      $composableBuilder(column: $table.cCa, builder: (column) => column);

  GeneratedColumn<double> get cCl =>
      $composableBuilder(column: $table.cCl, builder: (column) => column);

  GeneratedColumn<double> get cGlu =>
      $composableBuilder(column: $table.cGlu, builder: (column) => column);

  GeneratedColumn<double> get cLac =>
      $composableBuilder(column: $table.cLac, builder: (column) => column);

  GeneratedColumn<double> get ctBil =>
      $composableBuilder(column: $table.ctBil, builder: (column) => column);

  GeneratedColumn<double> get mOsmc =>
      $composableBuilder(column: $table.mOsmc, builder: (column) => column);

  GeneratedColumn<double> get phT =>
      $composableBuilder(column: $table.phT, builder: (column) => column);

  GeneratedColumn<double> get pCO2T =>
      $composableBuilder(column: $table.pCO2T, builder: (column) => column);

  GeneratedColumn<double> get pO2T =>
      $composableBuilder(column: $table.pO2T, builder: (column) => column);

  GeneratedColumn<double> get ctO2c =>
      $composableBuilder(column: $table.ctO2c, builder: (column) => column);

  GeneratedColumn<double> get p50c =>
      $composableBuilder(column: $table.p50c, builder: (column) => column);

  GeneratedColumn<double> get cBaseB =>
      $composableBuilder(column: $table.cBaseB, builder: (column) => column);

  GeneratedColumn<double> get cBaseEcf =>
      $composableBuilder(column: $table.cBaseEcf, builder: (column) => column);

  GeneratedColumn<double> get cHCO3Pst =>
      $composableBuilder(column: $table.cHCO3Pst, builder: (column) => column);

  GeneratedColumn<double> get cHCO3P =>
      $composableBuilder(column: $table.cHCO3P, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BloodGasRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BloodGasRecordsTable,
    BloodGasRecord,
    $$BloodGasRecordsTableFilterComposer,
    $$BloodGasRecordsTableOrderingComposer,
    $$BloodGasRecordsTableAnnotationComposer,
    $$BloodGasRecordsTableCreateCompanionBuilder,
    $$BloodGasRecordsTableUpdateCompanionBuilder,
    (BloodGasRecord, $$BloodGasRecordsTableReferences),
    BloodGasRecord,
    PrefetchHooks Function({bool patientId})> {
  $$BloodGasRecordsTableTableManager(
      _$AppDatabase db, $BloodGasRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BloodGasRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BloodGasRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BloodGasRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<double?> pH = const Value.absent(),
            Value<double?> pCO2 = const Value.absent(),
            Value<double?> pO2 = const Value.absent(),
            Value<double?> ctHb = const Value.absent(),
            Value<double?> hctc = const Value.absent(),
            Value<double?> sO2 = const Value.absent(),
            Value<double?> fO2Hb = const Value.absent(),
            Value<double?> fCOHb = const Value.absent(),
            Value<double?> fHHb = const Value.absent(),
            Value<double?> fMetHb = const Value.absent(),
            Value<double?> cNa = const Value.absent(),
            Value<double?> cK = const Value.absent(),
            Value<double?> cCa = const Value.absent(),
            Value<double?> cCl = const Value.absent(),
            Value<double?> cGlu = const Value.absent(),
            Value<double?> cLac = const Value.absent(),
            Value<double?> ctBil = const Value.absent(),
            Value<double?> mOsmc = const Value.absent(),
            Value<double?> phT = const Value.absent(),
            Value<double?> pCO2T = const Value.absent(),
            Value<double?> pO2T = const Value.absent(),
            Value<double?> ctO2c = const Value.absent(),
            Value<double?> p50c = const Value.absent(),
            Value<double?> cBaseB = const Value.absent(),
            Value<double?> cBaseEcf = const Value.absent(),
            Value<double?> cHCO3Pst = const Value.absent(),
            Value<double?> cHCO3P = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BloodGasRecordsCompanion(
            id: id,
            patientId: patientId,
            timestamp: timestamp,
            pH: pH,
            pCO2: pCO2,
            pO2: pO2,
            ctHb: ctHb,
            hctc: hctc,
            sO2: sO2,
            fO2Hb: fO2Hb,
            fCOHb: fCOHb,
            fHHb: fHHb,
            fMetHb: fMetHb,
            cNa: cNa,
            cK: cK,
            cCa: cCa,
            cCl: cCl,
            cGlu: cGlu,
            cLac: cLac,
            ctBil: ctBil,
            mOsmc: mOsmc,
            phT: phT,
            pCO2T: pCO2T,
            pO2T: pO2T,
            ctO2c: ctO2c,
            p50c: p50c,
            cBaseB: cBaseB,
            cBaseEcf: cBaseEcf,
            cHCO3Pst: cHCO3Pst,
            cHCO3P: cHCO3P,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required DateTime timestamp,
            Value<double?> pH = const Value.absent(),
            Value<double?> pCO2 = const Value.absent(),
            Value<double?> pO2 = const Value.absent(),
            Value<double?> ctHb = const Value.absent(),
            Value<double?> hctc = const Value.absent(),
            Value<double?> sO2 = const Value.absent(),
            Value<double?> fO2Hb = const Value.absent(),
            Value<double?> fCOHb = const Value.absent(),
            Value<double?> fHHb = const Value.absent(),
            Value<double?> fMetHb = const Value.absent(),
            Value<double?> cNa = const Value.absent(),
            Value<double?> cK = const Value.absent(),
            Value<double?> cCa = const Value.absent(),
            Value<double?> cCl = const Value.absent(),
            Value<double?> cGlu = const Value.absent(),
            Value<double?> cLac = const Value.absent(),
            Value<double?> ctBil = const Value.absent(),
            Value<double?> mOsmc = const Value.absent(),
            Value<double?> phT = const Value.absent(),
            Value<double?> pCO2T = const Value.absent(),
            Value<double?> pO2T = const Value.absent(),
            Value<double?> ctO2c = const Value.absent(),
            Value<double?> p50c = const Value.absent(),
            Value<double?> cBaseB = const Value.absent(),
            Value<double?> cBaseEcf = const Value.absent(),
            Value<double?> cHCO3Pst = const Value.absent(),
            Value<double?> cHCO3P = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BloodGasRecordsCompanion.insert(
            id: id,
            patientId: patientId,
            timestamp: timestamp,
            pH: pH,
            pCO2: pCO2,
            pO2: pO2,
            ctHb: ctHb,
            hctc: hctc,
            sO2: sO2,
            fO2Hb: fO2Hb,
            fCOHb: fCOHb,
            fHHb: fHHb,
            fMetHb: fMetHb,
            cNa: cNa,
            cK: cK,
            cCa: cCa,
            cCl: cCl,
            cGlu: cGlu,
            cLac: cLac,
            ctBil: ctBil,
            mOsmc: mOsmc,
            phT: phT,
            pCO2T: pCO2T,
            pO2T: pO2T,
            ctO2c: ctO2c,
            p50c: p50c,
            cBaseB: cBaseB,
            cBaseEcf: cBaseEcf,
            cHCO3Pst: cHCO3Pst,
            cHCO3P: cHCO3P,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BloodGasRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$BloodGasRecordsTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$BloodGasRecordsTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BloodGasRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BloodGasRecordsTable,
    BloodGasRecord,
    $$BloodGasRecordsTableFilterComposer,
    $$BloodGasRecordsTableOrderingComposer,
    $$BloodGasRecordsTableAnnotationComposer,
    $$BloodGasRecordsTableCreateCompanionBuilder,
    $$BloodGasRecordsTableUpdateCompanionBuilder,
    (BloodGasRecord, $$BloodGasRecordsTableReferences),
    BloodGasRecord,
    PrefetchHooks Function({bool patientId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$BloodGasRecordsTableTableManager get bloodGasRecords =>
      $$BloodGasRecordsTableTableManager(_db, _db.bloodGasRecords);
}
