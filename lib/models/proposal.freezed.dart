// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return _Proposal.fromJson(json);
}

/// @nodoc
mixin _$Proposal {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get estimatedDuration => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProposalCopyWith<Proposal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposalCopyWith<$Res> {
  factory $ProposalCopyWith(Proposal value, $Res Function(Proposal) then) =
      _$ProposalCopyWithImpl<$Res, Proposal>;
  @useResult
  $Res call(
      {String id,
      String userId,
      int amount,
      String currency,
      String description,
      int estimatedDuration,
      DateTime createdAt,
      String status});
}

/// @nodoc
class _$ProposalCopyWithImpl<$Res, $Val extends Proposal>
    implements $ProposalCopyWith<$Res> {
  _$ProposalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? estimatedDuration = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProposalImplCopyWith<$Res>
    implements $ProposalCopyWith<$Res> {
  factory _$$ProposalImplCopyWith(
          _$ProposalImpl value, $Res Function(_$ProposalImpl) then) =
      __$$ProposalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      int amount,
      String currency,
      String description,
      int estimatedDuration,
      DateTime createdAt,
      String status});
}

/// @nodoc
class __$$ProposalImplCopyWithImpl<$Res>
    extends _$ProposalCopyWithImpl<$Res, _$ProposalImpl>
    implements _$$ProposalImplCopyWith<$Res> {
  __$$ProposalImplCopyWithImpl(
      _$ProposalImpl _value, $Res Function(_$ProposalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? estimatedDuration = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_$ProposalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProposalImpl implements _Proposal {
  const _$ProposalImpl(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.currency,
      required this.description,
      required this.estimatedDuration,
      required this.createdAt,
      required this.status});

  factory _$ProposalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposalImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final int estimatedDuration;
  @override
  final DateTime createdAt;
  @override
  final String status;

  @override
  String toString() {
    return 'Proposal(id: $id, userId: $userId, amount: $amount, currency: $currency, description: $description, estimatedDuration: $estimatedDuration, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, amount, currency,
      description, estimatedDuration, createdAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      __$$ProposalImplCopyWithImpl<_$ProposalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposalImplToJson(
      this,
    );
  }
}

abstract class _Proposal implements Proposal {
  const factory _Proposal(
      {required final String id,
      required final String userId,
      required final int amount,
      required final String currency,
      required final String description,
      required final int estimatedDuration,
      required final DateTime createdAt,
      required final String status}) = _$ProposalImpl;

  factory _Proposal.fromJson(Map<String, dynamic> json) =
      _$ProposalImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  int get estimatedDuration;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
