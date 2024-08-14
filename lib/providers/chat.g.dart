// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatStreamHash() => r'92e8910943cd15acc6d2e12fe60ee1b884d35762';

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

/// See also [chatStream].
@ProviderFor(chatStream)
const chatStreamProvider = ChatStreamFamily();

/// See also [chatStream].
class ChatStreamFamily extends Family<AsyncValue<QuerySnapshot>> {
  /// See also [chatStream].
  const ChatStreamFamily();

  /// See also [chatStream].
  ChatStreamProvider call(
    String groupChatId,
    int limit,
  ) {
    return ChatStreamProvider(
      groupChatId,
      limit,
    );
  }

  @override
  ChatStreamProvider getProviderOverride(
    covariant ChatStreamProvider provider,
  ) {
    return call(
      provider.groupChatId,
      provider.limit,
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
  String? get name => r'chatStreamProvider';
}

/// See also [chatStream].
class ChatStreamProvider extends AutoDisposeStreamProvider<QuerySnapshot> {
  /// See also [chatStream].
  ChatStreamProvider(
    String groupChatId,
    int limit,
  ) : this._internal(
          (ref) => chatStream(
            ref as ChatStreamRef,
            groupChatId,
            limit,
          ),
          from: chatStreamProvider,
          name: r'chatStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatStreamHash,
          dependencies: ChatStreamFamily._dependencies,
          allTransitiveDependencies:
              ChatStreamFamily._allTransitiveDependencies,
          groupChatId: groupChatId,
          limit: limit,
        );

  ChatStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupChatId,
    required this.limit,
  }) : super.internal();

  final String groupChatId;
  final int limit;

  @override
  Override overrideWith(
    Stream<QuerySnapshot> Function(ChatStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatStreamProvider._internal(
        (ref) => create(ref as ChatStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupChatId: groupChatId,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<QuerySnapshot> createElement() {
    return _ChatStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatStreamProvider &&
        other.groupChatId == groupChatId &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupChatId.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatStreamRef on AutoDisposeStreamProviderRef<QuerySnapshot> {
  /// The parameter `groupChatId` of this provider.
  String get groupChatId;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _ChatStreamProviderElement
    extends AutoDisposeStreamProviderElement<QuerySnapshot> with ChatStreamRef {
  _ChatStreamProviderElement(super.provider);

  @override
  String get groupChatId => (origin as ChatStreamProvider).groupChatId;
  @override
  int get limit => (origin as ChatStreamProvider).limit;
}

String _$chatHash() => r'0912f4ab9738cc8466d780757738bdd6ac85d547';

/// See also [Chat].
@ProviderFor(Chat)
final chatProvider = AutoDisposeAsyncNotifierProvider<Chat, void>.internal(
  Chat.new,
  name: r'chatProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Chat = AutoDisposeAsyncNotifier<void>;
String _$messageSenderHash() => r'c74b94e8f544b4470594df16f0bd0b3748e47c4c';

/// See also [MessageSender].
@ProviderFor(MessageSender)
final messageSenderProvider =
    AutoDisposeNotifierProvider<MessageSender, void>.internal(
  MessageSender.new,
  name: r'messageSenderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageSenderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MessageSender = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
