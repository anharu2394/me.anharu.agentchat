// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fireStoreStreamHash() => r'71b3aad05ff7cf229a6cd4701c60dde4584614af';

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

/// See also [fireStoreStream].
@ProviderFor(fireStoreStream)
const fireStoreStreamProvider = FireStoreStreamFamily();

/// See also [fireStoreStream].
class FireStoreStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [fireStoreStream].
  const FireStoreStreamFamily();

  /// See also [fireStoreStream].
  FireStoreStreamProvider call(
    String pathCollection,
    int limit,
    String? textSearch,
  ) {
    return FireStoreStreamProvider(
      pathCollection,
      limit,
      textSearch,
    );
  }

  @override
  FireStoreStreamProvider getProviderOverride(
    covariant FireStoreStreamProvider provider,
  ) {
    return call(
      provider.pathCollection,
      provider.limit,
      provider.textSearch,
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
  String? get name => r'fireStoreStreamProvider';
}

/// See also [fireStoreStream].
class FireStoreStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [fireStoreStream].
  FireStoreStreamProvider(
    String pathCollection,
    int limit,
    String? textSearch,
  ) : this._internal(
          (ref) => fireStoreStream(
            ref as FireStoreStreamRef,
            pathCollection,
            limit,
            textSearch,
          ),
          from: fireStoreStreamProvider,
          name: r'fireStoreStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fireStoreStreamHash,
          dependencies: FireStoreStreamFamily._dependencies,
          allTransitiveDependencies:
              FireStoreStreamFamily._allTransitiveDependencies,
          pathCollection: pathCollection,
          limit: limit,
          textSearch: textSearch,
        );

  FireStoreStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pathCollection,
    required this.limit,
    required this.textSearch,
  }) : super.internal();

  final String pathCollection;
  final int limit;
  final String? textSearch;

  @override
  Override overrideWith(
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            FireStoreStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FireStoreStreamProvider._internal(
        (ref) => create(ref as FireStoreStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pathCollection: pathCollection,
        limit: limit,
        textSearch: textSearch,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _FireStoreStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FireStoreStreamProvider &&
        other.pathCollection == pathCollection &&
        other.limit == limit &&
        other.textSearch == textSearch;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pathCollection.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, textSearch.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FireStoreStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `pathCollection` of this provider.
  String get pathCollection;

  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `textSearch` of this provider.
  String? get textSearch;
}

class _FireStoreStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with FireStoreStreamRef {
  _FireStoreStreamProviderElement(super.provider);

  @override
  String get pathCollection =>
      (origin as FireStoreStreamProvider).pathCollection;
  @override
  int get limit => (origin as FireStoreStreamProvider).limit;
  @override
  String? get textSearch => (origin as FireStoreStreamProvider).textSearch;
}

String _$homeHash() => r'529bde6566ebcae846e8473b3e9772c6481a1c19';

/// See also [Home].
@ProviderFor(Home)
final homeProvider = AutoDisposeAsyncNotifierProvider<Home, void>.internal(
  Home.new,
  name: r'homeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Home = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
