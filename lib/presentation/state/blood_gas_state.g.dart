// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_gas_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientBloodGasRecordsHash() =>
    r'3c23cb928bbc6feca4b46d83cd94b38acb5aae7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PatientBloodGasRecords
    extends BuildlessAutoDisposeAsyncNotifier<List<BloodGasRecord>> {
  late final String patientId;

  FutureOr<List<BloodGasRecord>> build(
    String patientId,
  );
}

/// See also [PatientBloodGasRecords].
@ProviderFor(PatientBloodGasRecords)
const patientBloodGasRecordsProvider = PatientBloodGasRecordsFamily();

/// See also [PatientBloodGasRecords].
class PatientBloodGasRecordsFamily
    extends Family<AsyncValue<List<BloodGasRecord>>> {
  /// See also [PatientBloodGasRecords].
  const PatientBloodGasRecordsFamily();

  /// See also [PatientBloodGasRecords].
  PatientBloodGasRecordsProvider call(
    String patientId,
  ) {
    return PatientBloodGasRecordsProvider(
      patientId,
    );
  }

  @override
  PatientBloodGasRecordsProvider getProviderOverride(
    covariant PatientBloodGasRecordsProvider provider,
  ) {
    return call(
      provider.patientId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'patientBloodGasRecordsProvider';
}

/// See also [PatientBloodGasRecords].
class PatientBloodGasRecordsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PatientBloodGasRecords,
        List<BloodGasRecord>> {
  /// See also [PatientBloodGasRecords].
  PatientBloodGasRecordsProvider(
    String patientId,
  ) : this._internal(
          () => PatientBloodGasRecords()..patientId = patientId,
          from: patientBloodGasRecordsProvider,
          name: r'patientBloodGasRecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$patientBloodGasRecordsHash,
          dependencies: PatientBloodGasRecordsFamily._dependencies,
          allTransitiveDependencies:
              PatientBloodGasRecordsFamily._allTransitiveDependencies,
          patientId: patientId,
        );

  PatientBloodGasRecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.patientId,
  }) : super.internal();

  final String patientId;

  @override
  FutureOr<List<BloodGasRecord>> runNotifierBuild(
    covariant PatientBloodGasRecords notifier,
  ) {
    return notifier.build(
      patientId,
    );
  }

  @override
  Override overrideWith(PatientBloodGasRecords Function() create) {
    return ProviderOverride(
      origin: this,
      override: PatientBloodGasRecordsProvider._internal(
        () => create()..patientId = patientId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        patientId: patientId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PatientBloodGasRecords,
      List<BloodGasRecord>> createElement() {
    return _PatientBloodGasRecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientBloodGasRecordsProvider &&
        other.patientId == patientId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, patientId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PatientBloodGasRecordsRef
    on AutoDisposeAsyncNotifierProviderRef<List<BloodGasRecord>> {
  /// The parameter `patientId` of this provider.
  String get patientId;
}

class _PatientBloodGasRecordsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PatientBloodGasRecords,
        List<BloodGasRecord>> with PatientBloodGasRecordsRef {
  _PatientBloodGasRecordsProviderElement(super.provider);

  @override
  String get patientId => (origin as PatientBloodGasRecordsProvider).patientId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
