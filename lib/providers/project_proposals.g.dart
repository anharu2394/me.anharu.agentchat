// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_proposals.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectProposalsHash() => r'a06139af55344a0e694ecdd8ec3d5a87e4921a3c';

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

abstract class _$ProjectProposals
    extends BuildlessAutoDisposeAsyncNotifier<List<Proposal>> {
  late final String projectId;

  FutureOr<List<Proposal>> build(
    String projectId,
  );
}

/// See also [ProjectProposals].
@ProviderFor(ProjectProposals)
const projectProposalsProvider = ProjectProposalsFamily();

/// See also [ProjectProposals].
class ProjectProposalsFamily extends Family<AsyncValue<List<Proposal>>> {
  /// See also [ProjectProposals].
  const ProjectProposalsFamily();

  /// See also [ProjectProposals].
  ProjectProposalsProvider call(
    String projectId,
  ) {
    return ProjectProposalsProvider(
      projectId,
    );
  }

  @override
  ProjectProposalsProvider getProviderOverride(
    covariant ProjectProposalsProvider provider,
  ) {
    return call(
      provider.projectId,
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
  String? get name => r'projectProposalsProvider';
}

/// See also [ProjectProposals].
class ProjectProposalsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProjectProposals, List<Proposal>> {
  /// See also [ProjectProposals].
  ProjectProposalsProvider(
    String projectId,
  ) : this._internal(
          () => ProjectProposals()..projectId = projectId,
          from: projectProposalsProvider,
          name: r'projectProposalsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectProposalsHash,
          dependencies: ProjectProposalsFamily._dependencies,
          allTransitiveDependencies:
              ProjectProposalsFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectProposalsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final String projectId;

  @override
  FutureOr<List<Proposal>> runNotifierBuild(
    covariant ProjectProposals notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(ProjectProposals Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectProposalsProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectProposals, List<Proposal>>
      createElement() {
    return _ProjectProposalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectProposalsProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectProposalsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Proposal>> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectProposalsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectProposals,
        List<Proposal>> with ProjectProposalsRef {
  _ProjectProposalsProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectProposalsProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
