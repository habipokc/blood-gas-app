// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientDetailsHash() => r'2f0dc9ee2d1a84934a509a22a5bbf8c4e773459a';

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

/// See also [patientDetails].
@ProviderFor(patientDetails)
const patientDetailsProvider = PatientDetailsFamily();

/// See also [patientDetails].
class PatientDetailsFamily extends Family<AsyncValue<Patient?>> {
  /// See also [patientDetails].
  const PatientDetailsFamily();

  /// See also [patientDetails].
  PatientDetailsProvider call(
    String id,
  ) {
    return PatientDetailsProvider(
      id,
    );
  }

  @override
  PatientDetailsProvider getProviderOverride(
    covariant PatientDetailsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'patientDetailsProvider';
}

/// See also [patientDetails].
class PatientDetailsProvider extends AutoDisposeFutureProvider<Patient?> {
  /// See also [patientDetails].
  PatientDetailsProvider(
    String id,
  ) : this._internal(
          (ref) => patientDetails(
            ref as PatientDetailsRef,
            id,
          ),
          from: patientDetailsProvider,
          name: r'patientDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$patientDetailsHash,
          dependencies: PatientDetailsFamily._dependencies,
          allTransitiveDependencies:
              PatientDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  PatientDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Patient?> Function(PatientDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PatientDetailsProvider._internal(
        (ref) => create(ref as PatientDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Patient?> createElement() {
    return _PatientDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PatientDetailsRef on AutoDisposeFutureProviderRef<Patient?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PatientDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Patient?> with PatientDetailsRef {
  _PatientDetailsProviderElement(super.provider);

  @override
  String get id => (origin as PatientDetailsProvider).id;
}

String _$activePatientsHash() => r'e2dcc605e34e82ea1d9ffacabfce5a751d0862a9';

/// See also [ActivePatients].
@ProviderFor(ActivePatients)
final activePatientsProvider =
    AutoDisposeAsyncNotifierProvider<ActivePatients, List<Patient>>.internal(
  ActivePatients.new,
  name: r'activePatientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePatientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivePatients = AutoDisposeAsyncNotifier<List<Patient>>;
String _$completedPatientsHash() => r'295ced84720acfbd84433d8eba530a937eeac3d2';

/// See also [CompletedPatients].
@ProviderFor(CompletedPatients)
final completedPatientsProvider =
    AutoDisposeAsyncNotifierProvider<CompletedPatients, List<Patient>>.internal(
  CompletedPatients.new,
  name: r'completedPatientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completedPatientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CompletedPatients = AutoDisposeAsyncNotifier<List<Patient>>;
String _$deletedPatientsHash() => r'fe39b81315470b8032020a033b7342061769663b';

/// See also [DeletedPatients].
@ProviderFor(DeletedPatients)
final deletedPatientsProvider =
    AutoDisposeAsyncNotifierProvider<DeletedPatients, List<Patient>>.internal(
  DeletedPatients.new,
  name: r'deletedPatientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deletedPatientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeletedPatients = AutoDisposeAsyncNotifier<List<Patient>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
