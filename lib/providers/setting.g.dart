// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setPrefValueHash() => r'6dbde3be76a1b7f5c3ca6a9107ded850edb92691';

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

/// See also [setPrefValue].
@ProviderFor(setPrefValue)
const setPrefValueProvider = SetPrefValueFamily();

/// See also [setPrefValue].
class SetPrefValueFamily extends Family<AsyncValue<bool>> {
  /// See also [setPrefValue].
  const SetPrefValueFamily();

  /// See also [setPrefValue].
  SetPrefValueProvider call(
    String key,
    String value,
  ) {
    return SetPrefValueProvider(
      key,
      value,
    );
  }

  @override
  SetPrefValueProvider getProviderOverride(
    covariant SetPrefValueProvider provider,
  ) {
    return call(
      provider.key,
      provider.value,
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
  String? get name => r'setPrefValueProvider';
}

/// See also [setPrefValue].
class SetPrefValueProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setPrefValue].
  SetPrefValueProvider(
    String key,
    String value,
  ) : this._internal(
          (ref) => setPrefValue(
            ref as SetPrefValueRef,
            key,
            value,
          ),
          from: setPrefValueProvider,
          name: r'setPrefValueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setPrefValueHash,
          dependencies: SetPrefValueFamily._dependencies,
          allTransitiveDependencies:
              SetPrefValueFamily._allTransitiveDependencies,
          key: key,
          value: value,
        );

  SetPrefValueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
    required this.value,
  }) : super.internal();

  final String key;
  final String value;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetPrefValueRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetPrefValueProvider._internal(
        (ref) => create(ref as SetPrefValueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SetPrefValueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetPrefValueProvider &&
        other.key == key &&
        other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetPrefValueRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `key` of this provider.
  String get key;

  /// The parameter `value` of this provider.
  String get value;
}

class _SetPrefValueProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SetPrefValueRef {
  _SetPrefValueProviderElement(super.provider);

  @override
  String get key => (origin as SetPrefValueProvider).key;
  @override
  String get value => (origin as SetPrefValueProvider).value;
}

String _$settingHash() => r'04c85fe80364afb4f02a896f35b54c3efc24f153';

/// See also [Setting].
@ProviderFor(Setting)
final settingProvider = AsyncNotifierProvider<Setting, void>.internal(
  Setting.new,
  name: r'settingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Setting = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
