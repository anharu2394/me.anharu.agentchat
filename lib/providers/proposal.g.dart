// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$proposalDetailHash() => r'109245fcd6d17caf090ef377ad49262a5a050728';

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

abstract class _$ProposalDetail
    extends BuildlessAutoDisposeAsyncNotifier<ProposalState> {
  late final String proposalId;

  FutureOr<ProposalState> build(
    String proposalId,
  );
}

/// See also [ProposalDetail].
@ProviderFor(ProposalDetail)
const proposalDetailProvider = ProposalDetailFamily();

/// See also [ProposalDetail].
class ProposalDetailFamily extends Family<AsyncValue<ProposalState>> {
  /// See also [ProposalDetail].
  const ProposalDetailFamily();

  /// See also [ProposalDetail].
  ProposalDetailProvider call(
    String proposalId,
  ) {
    return ProposalDetailProvider(
      proposalId,
    );
  }

  @override
  ProposalDetailProvider getProviderOverride(
    covariant ProposalDetailProvider provider,
  ) {
    return call(
      provider.proposalId,
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
  String? get name => r'proposalDetailProvider';
}

/// See also [ProposalDetail].
class ProposalDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProposalDetail, ProposalState> {
  /// See also [ProposalDetail].
  ProposalDetailProvider(
    String proposalId,
  ) : this._internal(
          () => ProposalDetail()..proposalId = proposalId,
          from: proposalDetailProvider,
          name: r'proposalDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$proposalDetailHash,
          dependencies: ProposalDetailFamily._dependencies,
          allTransitiveDependencies:
              ProposalDetailFamily._allTransitiveDependencies,
          proposalId: proposalId,
        );

  ProposalDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.proposalId,
  }) : super.internal();

  final String proposalId;

  @override
  FutureOr<ProposalState> runNotifierBuild(
    covariant ProposalDetail notifier,
  ) {
    return notifier.build(
      proposalId,
    );
  }

  @override
  Override overrideWith(ProposalDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProposalDetailProvider._internal(
        () => create()..proposalId = proposalId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        proposalId: proposalId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProposalDetail, ProposalState>
      createElement() {
    return _ProposalDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProposalDetailProvider && other.proposalId == proposalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, proposalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProposalDetailRef on AutoDisposeAsyncNotifierProviderRef<ProposalState> {
  /// The parameter `proposalId` of this provider.
  String get proposalId;
}

class _ProposalDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProposalDetail,
        ProposalState> with ProposalDetailRef {
  _ProposalDetailProviderElement(super.provider);

  @override
  String get proposalId => (origin as ProposalDetailProvider).proposalId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
