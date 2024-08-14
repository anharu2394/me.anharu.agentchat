// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserChat _$UserChatFromJson(Map<String, dynamic> json) {
  return _UserChat.fromJson(json);
}

/// @nodoc
mixin _$UserChat {
  String get id => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get aboutMe => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserChatCopyWith<UserChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatCopyWith<$Res> {
  factory $UserChatCopyWith(UserChat value, $Res Function(UserChat) then) =
      _$UserChatCopyWithImpl<$Res, UserChat>;
  @useResult
  $Res call(
      {String id,
      String photoUrl,
      String nickname,
      String? aboutMe,
      UserRole role});
}

/// @nodoc
class _$UserChatCopyWithImpl<$Res, $Val extends UserChat>
    implements $UserChatCopyWith<$Res> {
  _$UserChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photoUrl = null,
    Object? nickname = null,
    Object? aboutMe = freezed,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChatImplCopyWith<$Res>
    implements $UserChatCopyWith<$Res> {
  factory _$$UserChatImplCopyWith(
          _$UserChatImpl value, $Res Function(_$UserChatImpl) then) =
      __$$UserChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String photoUrl,
      String nickname,
      String? aboutMe,
      UserRole role});
}

/// @nodoc
class __$$UserChatImplCopyWithImpl<$Res>
    extends _$UserChatCopyWithImpl<$Res, _$UserChatImpl>
    implements _$$UserChatImplCopyWith<$Res> {
  __$$UserChatImplCopyWithImpl(
      _$UserChatImpl _value, $Res Function(_$UserChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photoUrl = null,
    Object? nickname = null,
    Object? aboutMe = freezed,
    Object? role = null,
  }) {
    return _then(_$UserChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChatImpl implements _UserChat {
  const _$UserChatImpl(
      {required this.id,
      required this.photoUrl,
      required this.nickname,
      required this.aboutMe,
      required this.role});

  factory _$UserChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserChatImplFromJson(json);

  @override
  final String id;
  @override
  final String photoUrl;
  @override
  final String nickname;
  @override
  final String? aboutMe;
  @override
  final UserRole role;

  @override
  String toString() {
    return 'UserChat(id: $id, photoUrl: $photoUrl, nickname: $nickname, aboutMe: $aboutMe, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, photoUrl, nickname, aboutMe, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChatImplCopyWith<_$UserChatImpl> get copyWith =>
      __$$UserChatImplCopyWithImpl<_$UserChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChatImplToJson(
      this,
    );
  }
}

abstract class _UserChat implements UserChat {
  const factory _UserChat(
      {required final String id,
      required final String photoUrl,
      required final String nickname,
      required final String? aboutMe,
      required final UserRole role}) = _$UserChatImpl;

  factory _UserChat.fromJson(Map<String, dynamic> json) =
      _$UserChatImpl.fromJson;

  @override
  String get id;
  @override
  String get photoUrl;
  @override
  String get nickname;
  @override
  String? get aboutMe;
  @override
  UserRole get role;
  @override
  @JsonKey(ignore: true)
  _$$UserChatImplCopyWith<_$UserChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
