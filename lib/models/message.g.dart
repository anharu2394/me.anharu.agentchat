// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String,
      isDeleted: json['isDeleted'] as bool,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      deletedBy: json['deletedBy'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'text': instance.text,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
      'isDeleted': instance.isDeleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'deletedBy': instance.deletedBy,
    };
