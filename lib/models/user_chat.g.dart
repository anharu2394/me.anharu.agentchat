// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChatImpl _$$UserChatImplFromJson(Map<String, dynamic> json) =>
    _$UserChatImpl(
      id: json['id'] as String,
      photoUrl: json['photoUrl'] as String,
      nickname: json['nickname'] as String,
      aboutMe: json['aboutMe'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$UserChatImplToJson(_$UserChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'nickname': instance.nickname,
      'aboutMe': instance.aboutMe,
      'role': _$UserRoleEnumMap[instance.role]!,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.worker: 'worker',
  UserRole.agent: 'agent',
};
