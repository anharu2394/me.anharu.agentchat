// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, Participant> get participants =>
      throw _privateConstructorUsedError;
  LastMessage get lastMessage => throw _privateConstructorUsedError;
  List<String> get allowedRoles => throw _privateConstructorUsedError;
  String? get linkedProjectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, Participant> participants,
      LastMessage lastMessage,
      List<String> allowedRoles,
      String? linkedProjectId});

  $LastMessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? participants = null,
    Object? lastMessage = null,
    Object? allowedRoles = null,
    Object? linkedProjectId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Map<String, Participant>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage,
      allowedRoles: null == allowedRoles
          ? _value.allowedRoles
          : allowedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedProjectId: freezed == linkedProjectId
          ? _value.linkedProjectId
          : linkedProjectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<$Res> get lastMessage {
    return $LastMessageCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, Participant> participants,
      LastMessage lastMessage,
      List<String> allowedRoles,
      String? linkedProjectId});

  @override
  $LastMessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? participants = null,
    Object? lastMessage = null,
    Object? allowedRoles = null,
    Object? linkedProjectId = freezed,
  }) {
    return _then(_$RoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Map<String, Participant>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage,
      allowedRoles: null == allowedRoles
          ? _value._allowedRoles
          : allowedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedProjectId: freezed == linkedProjectId
          ? _value.linkedProjectId
          : linkedProjectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {required this.id,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      required final Map<String, Participant> participants,
      required this.lastMessage,
      required final List<String> allowedRoles,
      this.linkedProjectId})
      : _participants = participants,
        _allowedRoles = allowedRoles;

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final Map<String, Participant> _participants;
  @override
  Map<String, Participant> get participants {
    if (_participants is EqualUnmodifiableMapView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participants);
  }

  @override
  final LastMessage lastMessage;
  final List<String> _allowedRoles;
  @override
  List<String> get allowedRoles {
    if (_allowedRoles is EqualUnmodifiableListView) return _allowedRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedRoles);
  }

  @override
  final String? linkedProjectId;

  @override
  String toString() {
    return 'Room(id: $id, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, participants: $participants, lastMessage: $lastMessage, allowedRoles: $allowedRoles, linkedProjectId: $linkedProjectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality()
                .equals(other._allowedRoles, _allowedRoles) &&
            (identical(other.linkedProjectId, linkedProjectId) ||
                other.linkedProjectId == linkedProjectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_participants),
      lastMessage,
      const DeepCollectionEquality().hash(_allowedRoles),
      linkedProjectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required final String id,
      required final String type,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final Map<String, Participant> participants,
      required final LastMessage lastMessage,
      required final List<String> allowedRoles,
      final String? linkedProjectId}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  Map<String, Participant> get participants;
  @override
  LastMessage get lastMessage;
  @override
  List<String> get allowedRoles;
  @override
  String? get linkedProjectId;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return _Participant.fromJson(json);
}

/// @nodoc
mixin _$Participant {
  DateTime get joinedAt => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantCopyWith<Participant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantCopyWith<$Res> {
  factory $ParticipantCopyWith(
          Participant value, $Res Function(Participant) then) =
      _$ParticipantCopyWithImpl<$Res, Participant>;
  @useResult
  $Res call({DateTime joinedAt, String role});
}

/// @nodoc
class _$ParticipantCopyWithImpl<$Res, $Val extends Participant>
    implements $ParticipantCopyWith<$Res> {
  _$ParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedAt = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantImplCopyWith<$Res>
    implements $ParticipantCopyWith<$Res> {
  factory _$$ParticipantImplCopyWith(
          _$ParticipantImpl value, $Res Function(_$ParticipantImpl) then) =
      __$$ParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime joinedAt, String role});
}

/// @nodoc
class __$$ParticipantImplCopyWithImpl<$Res>
    extends _$ParticipantCopyWithImpl<$Res, _$ParticipantImpl>
    implements _$$ParticipantImplCopyWith<$Res> {
  __$$ParticipantImplCopyWithImpl(
      _$ParticipantImpl _value, $Res Function(_$ParticipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinedAt = null,
    Object? role = null,
  }) {
    return _then(_$ParticipantImpl(
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantImpl implements _Participant {
  const _$ParticipantImpl({required this.joinedAt, required this.role});

  factory _$ParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantImplFromJson(json);

  @override
  final DateTime joinedAt;
  @override
  final String role;

  @override
  String toString() {
    return 'Participant(joinedAt: $joinedAt, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantImpl &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, joinedAt, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      __$$ParticipantImplCopyWithImpl<_$ParticipantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantImplToJson(
      this,
    );
  }
}

abstract class _Participant implements Participant {
  const factory _Participant(
      {required final DateTime joinedAt,
      required final String role}) = _$ParticipantImpl;

  factory _Participant.fromJson(Map<String, dynamic> json) =
      _$ParticipantImpl.fromJson;

  @override
  DateTime get joinedAt;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) {
  return _LastMessage.fromJson(json);
}

/// @nodoc
mixin _$LastMessage {
  String get messageId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastMessageCopyWith<LastMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageCopyWith<$Res> {
  factory $LastMessageCopyWith(
          LastMessage value, $Res Function(LastMessage) then) =
      _$LastMessageCopyWithImpl<$Res, LastMessage>;
  @useResult
  $Res call(
      {String messageId,
      String text,
      String senderId,
      DateTime timestamp,
      bool isDeleted});
}

/// @nodoc
class _$LastMessageCopyWithImpl<$Res, $Val extends LastMessage>
    implements $LastMessageCopyWith<$Res> {
  _$LastMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? text = null,
    Object? senderId = null,
    Object? timestamp = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastMessageImplCopyWith<$Res>
    implements $LastMessageCopyWith<$Res> {
  factory _$$LastMessageImplCopyWith(
          _$LastMessageImpl value, $Res Function(_$LastMessageImpl) then) =
      __$$LastMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String messageId,
      String text,
      String senderId,
      DateTime timestamp,
      bool isDeleted});
}

/// @nodoc
class __$$LastMessageImplCopyWithImpl<$Res>
    extends _$LastMessageCopyWithImpl<$Res, _$LastMessageImpl>
    implements _$$LastMessageImplCopyWith<$Res> {
  __$$LastMessageImplCopyWithImpl(
      _$LastMessageImpl _value, $Res Function(_$LastMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? text = null,
    Object? senderId = null,
    Object? timestamp = null,
    Object? isDeleted = null,
  }) {
    return _then(_$LastMessageImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastMessageImpl implements _LastMessage {
  const _$LastMessageImpl(
      {required this.messageId,
      required this.text,
      required this.senderId,
      required this.timestamp,
      required this.isDeleted});

  factory _$LastMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastMessageImplFromJson(json);

  @override
  final String messageId;
  @override
  final String text;
  @override
  final String senderId;
  @override
  final DateTime timestamp;
  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'LastMessage(messageId: $messageId, text: $text, senderId: $senderId, timestamp: $timestamp, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, messageId, text, senderId, timestamp, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      __$$LastMessageImplCopyWithImpl<_$LastMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastMessageImplToJson(
      this,
    );
  }
}

abstract class _LastMessage implements LastMessage {
  const factory _LastMessage(
      {required final String messageId,
      required final String text,
      required final String senderId,
      required final DateTime timestamp,
      required final bool isDeleted}) = _$LastMessageImpl;

  factory _LastMessage.fromJson(Map<String, dynamic> json) =
      _$LastMessageImpl.fromJson;

  @override
  String get messageId;
  @override
  String get text;
  @override
  String get senderId;
  @override
  DateTime get timestamp;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
