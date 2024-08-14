// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailHash() => r'9a2febcadb0010c8c2282e06b0a225b8cafe440f';

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

abstract class _$ProjectDetail
    extends BuildlessAutoDisposeAsyncNotifier<Project?> {
  late final String projectId;

  FutureOr<Project?> build(
    String projectId,
  );
}

/// See also [ProjectDetail].
@ProviderFor(ProjectDetail)
const projectDetailProvider = ProjectDetailFamily();

/// See also [ProjectDetail].
class ProjectDetailFamily extends Family<AsyncValue<Project?>> {
  /// See also [ProjectDetail].
  const ProjectDetailFamily();

  /// See also [ProjectDetail].
  ProjectDetailProvider call(
    String projectId,
  ) {
    return ProjectDetailProvider(
      projectId,
    );
  }

  @override
  ProjectDetailProvider getProviderOverride(
    covariant ProjectDetailProvider provider,
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
  String? get name => r'projectDetailProvider';
}

/// See also [ProjectDetail].
class ProjectDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProjectDetail, Project?> {
  /// See also [ProjectDetail].
  ProjectDetailProvider(
    String projectId,
  ) : this._internal(
          () => ProjectDetail()..projectId = projectId,
          from: projectDetailProvider,
          name: r'projectDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailHash,
          dependencies: ProjectDetailFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectDetailProvider._internal(
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
  FutureOr<Project?> runNotifierBuild(
    covariant ProjectDetail notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(ProjectDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProjectDetail, Project?>
      createElement() {
    return _ProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectDetailRef on AutoDisposeAsyncNotifierProviderRef<Project?> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectDetail, Project?>
    with ProjectDetailRef {
  _ProjectDetailProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectDetailProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
