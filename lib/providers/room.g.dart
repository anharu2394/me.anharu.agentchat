// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$roomDetailHash() => r'4ba7ffbac06fdec990e4913c7460855d5628e67b';

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

abstract class _$RoomDetail
    extends BuildlessAutoDisposeAsyncNotifier<RoomState> {
  late final String roomId;

  FutureOr<RoomState> build(
    String roomId,
  );
}

/// See also [RoomDetail].
@ProviderFor(RoomDetail)
const roomDetailProvider = RoomDetailFamily();

/// See also [RoomDetail].
class RoomDetailFamily extends Family<AsyncValue<RoomState>> {
  /// See also [RoomDetail].
  const RoomDetailFamily();

  /// See also [RoomDetail].
  RoomDetailProvider call(
    String roomId,
  ) {
    return RoomDetailProvider(
      roomId,
    );
  }

  @override
  RoomDetailProvider getProviderOverride(
    covariant RoomDetailProvider provider,
  ) {
    return call(
      provider.roomId,
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
  String? get name => r'roomDetailProvider';
}

/// See also [RoomDetail].
class RoomDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RoomDetail, RoomState> {
  /// See also [RoomDetail].
  RoomDetailProvider(
    String roomId,
  ) : this._internal(
          () => RoomDetail()..roomId = roomId,
          from: roomDetailProvider,
          name: r'roomDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomDetailHash,
          dependencies: RoomDetailFamily._dependencies,
          allTransitiveDependencies:
              RoomDetailFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  RoomDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
  }) : super.internal();

  final String roomId;

  @override
  FutureOr<RoomState> runNotifierBuild(
    covariant RoomDetail notifier,
  ) {
    return notifier.build(
      roomId,
    );
  }

  @override
  Override overrideWith(RoomDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: RoomDetailProvider._internal(
        () => create()..roomId = roomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RoomDetail, RoomState>
      createElement() {
    return _RoomDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomDetailProvider && other.roomId == roomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RoomDetailRef on AutoDisposeAsyncNotifierProviderRef<RoomState> {
  /// The parameter `roomId` of this provider.
  String get roomId;
}

class _RoomDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RoomDetail, RoomState>
    with RoomDetailRef {
  _RoomDetailProviderElement(super.provider);

  @override
  String get roomId => (origin as RoomDetailProvider).roomId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
