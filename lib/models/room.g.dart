// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      participants: (json['participants'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Participant.fromJson(e as Map<String, dynamic>)),
      ),
      lastMessage:
          LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      allowedRoles: (json['allowedRoles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      linkedProjectId: json['linkedProjectId'] as String?,
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'participants':
          instance.participants.map((k, e) => MapEntry(k, e.toJson())),
      'lastMessage': instance.lastMessage.toJson(),
      'allowedRoles': instance.allowedRoles,
      'linkedProjectId': instance.linkedProjectId,
    };

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'joinedAt': instance.joinedAt.toIso8601String(),
      'role': instance.role,
    };

_$LastMessageImpl _$$LastMessageImplFromJson(Map<String, dynamic> json) =>
    _$LastMessageImpl(
      messageId: json['messageId'] as String,
      text: json['text'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$$LastMessageImplToJson(_$LastMessageImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'text': instance.text,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
