// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$measurementFormHash() => r'56f7a2372c0dbcd67c747bcb3da511e373985444';

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

abstract class _$MeasurementForm
    extends BuildlessAutoDisposeNotifier<BloodGasRecord> {
  late final String patientId;

  BloodGasRecord build(
    String patientId,
  );
}

/// See also [MeasurementForm].
@ProviderFor(MeasurementForm)
const measurementFormProvider = MeasurementFormFamily();

/// See also [MeasurementForm].
class MeasurementFormFamily extends Family<BloodGasRecord> {
  /// See also [MeasurementForm].
  const MeasurementFormFamily();

  /// See also [MeasurementForm].
  MeasurementFormProvider call(
    String patientId,
  ) {
    return MeasurementFormProvider(
      patientId,
    );
  }

  @override
  MeasurementFormProvider getProviderOverride(
    covariant MeasurementFormProvider provider,
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
  String? get name => r'measurementFormProvider';
}

/// See also [MeasurementForm].
class MeasurementFormProvider
    extends AutoDisposeNotifierProviderImpl<MeasurementForm, BloodGasRecord> {
  /// See also [MeasurementForm].
  MeasurementFormProvider(
    String patientId,
  ) : this._internal(
          () => MeasurementForm()..patientId = patientId,
          from: measurementFormProvider,
          name: r'measurementFormProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$measurementFormHash,
          dependencies: MeasurementFormFamily._dependencies,
          allTransitiveDependencies:
              MeasurementFormFamily._allTransitiveDependencies,
          patientId: patientId,
        );

  MeasurementFormProvider._internal(
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
  BloodGasRecord runNotifierBuild(
    covariant MeasurementForm notifier,
  ) {
    return notifier.build(
      patientId,
    );
  }

  @override
  Override overrideWith(MeasurementForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: MeasurementFormProvider._internal(
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
  AutoDisposeNotifierProviderElement<MeasurementForm, BloodGasRecord>
      createElement() {
    return _MeasurementFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MeasurementFormProvider && other.patientId == patientId;
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
mixin MeasurementFormRef on AutoDisposeNotifierProviderRef<BloodGasRecord> {
  /// The parameter `patientId` of this provider.
  String get patientId;
}

class _MeasurementFormProviderElement
    extends AutoDisposeNotifierProviderElement<MeasurementForm, BloodGasRecord>
    with MeasurementFormRef {
  _MeasurementFormProviderElement(super.provider);

  @override
  String get patientId => (origin as MeasurementFormProvider).patientId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
