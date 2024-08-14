// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'0d127b9f86778307b87202c304f8c71187973865';

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

abstract class _$User extends BuildlessAutoDisposeAsyncNotifier<UserChat?> {
  late final String userId;

  FutureOr<UserChat?> build(
    String userId,
  );
}

/// See also [User].
@ProviderFor(User)
const userProvider = UserFamily();

/// See also [User].
class UserFamily extends Family<AsyncValue<UserChat?>> {
  /// See also [User].
  const UserFamily();

  /// See also [User].
  UserProvider call(
    String userId,
  ) {
    return UserProvider(
      userId,
    );
  }

  @override
  UserProvider getProviderOverride(
    covariant UserProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userProvider';
}

/// See also [User].
class UserProvider
    extends AutoDisposeAsyncNotifierProviderImpl<User, UserChat?> {
  /// See also [User].
  UserProvider(
    String userId,
  ) : this._internal(
          () => User()..userId = userId,
          from: userProvider,
          name: r'userProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
          dependencies: UserFamily._dependencies,
          allTransitiveDependencies: UserFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<UserChat?> runNotifierBuild(
    covariant User notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(User Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<User, UserChat?> createElement() {
    return _UserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserRef on AutoDisposeAsyncNotifierProviderRef<UserChat?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<User, UserChat?>
    with UserRef {
  _UserProviderElement(super.provider);

  @override
  String get userId => (origin as UserProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
