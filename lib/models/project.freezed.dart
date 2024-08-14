// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Budget get budget => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String? id,
      String title,
      String description,
      String createdBy,
      DateTime createdAt,
      String status,
      Budget budget,
      DateTime deadline,
      List<String> skills,
      List<String> attachments});

  $BudgetCopyWith<$Res> get budget;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? status = null,
    Object? budget = null,
    Object? deadline = null,
    Object? skills = null,
    Object? attachments = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BudgetCopyWith<$Res> get budget {
    return $BudgetCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      String description,
      String createdBy,
      DateTime createdAt,
      String status,
      Budget budget,
      DateTime deadline,
      List<String> skills,
      List<String> attachments});

  @override
  $BudgetCopyWith<$Res> get budget;
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? status = null,
    Object? budget = null,
    Object? deadline = null,
    Object? skills = null,
    Object? attachments = null,
  }) {
    return _then(_$ProjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdBy,
      required this.createdAt,
      required this.status,
      required this.budget,
      required this.deadline,
      required final List<String> skills,
      required final List<String> attachments})
      : _skills = skills,
        _attachments = attachments;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final String status;
  @override
  final Budget budget;
  @override
  final DateTime deadline;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<String> _attachments;
  @override
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, createdBy: $createdBy, createdAt: $createdAt, status: $status, budget: $budget, deadline: $deadline, skills: $skills, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      createdBy,
      createdAt,
      status,
      budget,
      deadline,
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_attachments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String? id,
      required final String title,
      required final String description,
      required final String createdBy,
      required final DateTime createdAt,
      required final String status,
      required final Budget budget,
      required final DateTime deadline,
      required final List<String> skills,
      required final List<String> attachments}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override
  Budget get budget;
  @override
  DateTime get deadline;
  @override
  List<String> get skills;
  @override
  List<String> get attachments;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call({int min, int max, String currency});
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetImplCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$BudgetImplCopyWith(
          _$BudgetImpl value, $Res Function(_$BudgetImpl) then) =
      __$$BudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max, String currency});
}

/// @nodoc
class __$$BudgetImplCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$BudgetImpl>
    implements _$$BudgetImplCopyWith<$Res> {
  __$$BudgetImplCopyWithImpl(
      _$BudgetImpl _value, $Res Function(_$BudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? currency = null,
  }) {
    return _then(_$BudgetImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl(
      {required this.min, required this.max, required this.currency});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final int min;
  @override
  final int max;
  @override
  final String currency;

  @override
  String toString() {
    return 'Budget(min: $min, max: $max, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min, max, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      __$$BudgetImplCopyWithImpl<_$BudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(
      this,
    );
  }
}

abstract class _Budget implements Budget {
  const factory _Budget(
      {required final int min,
      required final int max,
      required final String currency}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProjects _$UserProjectsFromJson(Map<String, dynamic> json) {
  return _UserProjects.fromJson(json);
}

/// @nodoc
mixin _$UserProjects {
  List<Project> get created => throw _privateConstructorUsedError;
  List<Project> get proposed => throw _privateConstructorUsedError;
  List<Project> get accepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProjectsCopyWith<UserProjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProjectsCopyWith<$Res> {
  factory $UserProjectsCopyWith(
          UserProjects value, $Res Function(UserProjects) then) =
      _$UserProjectsCopyWithImpl<$Res, UserProjects>;
  @useResult
  $Res call(
      {List<Project> created, List<Project> proposed, List<Project> accepted});
}

/// @nodoc
class _$UserProjectsCopyWithImpl<$Res, $Val extends UserProjects>
    implements $UserProjectsCopyWith<$Res> {
  _$UserProjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? proposed = null,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      proposed: null == proposed
          ? _value.proposed
          : proposed // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProjectsImplCopyWith<$Res>
    implements $UserProjectsCopyWith<$Res> {
  factory _$$UserProjectsImplCopyWith(
          _$UserProjectsImpl value, $Res Function(_$UserProjectsImpl) then) =
      __$$UserProjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Project> created, List<Project> proposed, List<Project> accepted});
}

/// @nodoc
class __$$UserProjectsImplCopyWithImpl<$Res>
    extends _$UserProjectsCopyWithImpl<$Res, _$UserProjectsImpl>
    implements _$$UserProjectsImplCopyWith<$Res> {
  __$$UserProjectsImplCopyWithImpl(
      _$UserProjectsImpl _value, $Res Function(_$UserProjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? proposed = null,
    Object? accepted = null,
  }) {
    return _then(_$UserProjectsImpl(
      created: null == created
          ? _value._created
          : created // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      proposed: null == proposed
          ? _value._proposed
          : proposed // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      accepted: null == accepted
          ? _value._accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProjectsImpl implements _UserProjects {
  const _$UserProjectsImpl(
      {required final List<Project> created,
      required final List<Project> proposed,
      required final List<Project> accepted})
      : _created = created,
        _proposed = proposed,
        _accepted = accepted;

  factory _$UserProjectsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProjectsImplFromJson(json);

  final List<Project> _created;
  @override
  List<Project> get created {
    if (_created is EqualUnmodifiableListView) return _created;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_created);
  }

  final List<Project> _proposed;
  @override
  List<Project> get proposed {
    if (_proposed is EqualUnmodifiableListView) return _proposed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proposed);
  }

  final List<Project> _accepted;
  @override
  List<Project> get accepted {
    if (_accepted is EqualUnmodifiableListView) return _accepted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accepted);
  }

  @override
  String toString() {
    return 'UserProjects(created: $created, proposed: $proposed, accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProjectsImpl &&
            const DeepCollectionEquality().equals(other._created, _created) &&
            const DeepCollectionEquality().equals(other._proposed, _proposed) &&
            const DeepCollectionEquality().equals(other._accepted, _accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_created),
      const DeepCollectionEquality().hash(_proposed),
      const DeepCollectionEquality().hash(_accepted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProjectsImplCopyWith<_$UserProjectsImpl> get copyWith =>
      __$$UserProjectsImplCopyWithImpl<_$UserProjectsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProjectsImplToJson(
      this,
    );
  }
}

abstract class _UserProjects implements UserProjects {
  const factory _UserProjects(
      {required final List<Project> created,
      required final List<Project> proposed,
      required final List<Project> accepted}) = _$UserProjectsImpl;

  factory _UserProjects.fromJson(Map<String, dynamic> json) =
      _$UserProjectsImpl.fromJson;

  @override
  List<Project> get created;
  @override
  List<Project> get proposed;
  @override
  List<Project> get accepted;
  @override
  @JsonKey(ignore: true)
  _$$UserProjectsImplCopyWith<_$UserProjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProjectIds _$UserProjectIdsFromJson(Map<String, dynamic> json) {
  return _UserProjectIds.fromJson(json);
}

/// @nodoc
mixin _$UserProjectIds {
  List<String> get created => throw _privateConstructorUsedError;
  List<String> get proposed => throw _privateConstructorUsedError;
  List<String> get accepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProjectIdsCopyWith<UserProjectIds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProjectIdsCopyWith<$Res> {
  factory $UserProjectIdsCopyWith(
          UserProjectIds value, $Res Function(UserProjectIds) then) =
      _$UserProjectIdsCopyWithImpl<$Res, UserProjectIds>;
  @useResult
  $Res call(
      {List<String> created, List<String> proposed, List<String> accepted});
}

/// @nodoc
class _$UserProjectIdsCopyWithImpl<$Res, $Val extends UserProjectIds>
    implements $UserProjectIdsCopyWith<$Res> {
  _$UserProjectIdsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? proposed = null,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proposed: null == proposed
          ? _value.proposed
          : proposed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProjectIdsImplCopyWith<$Res>
    implements $UserProjectIdsCopyWith<$Res> {
  factory _$$UserProjectIdsImplCopyWith(_$UserProjectIdsImpl value,
          $Res Function(_$UserProjectIdsImpl) then) =
      __$$UserProjectIdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> created, List<String> proposed, List<String> accepted});
}

/// @nodoc
class __$$UserProjectIdsImplCopyWithImpl<$Res>
    extends _$UserProjectIdsCopyWithImpl<$Res, _$UserProjectIdsImpl>
    implements _$$UserProjectIdsImplCopyWith<$Res> {
  __$$UserProjectIdsImplCopyWithImpl(
      _$UserProjectIdsImpl _value, $Res Function(_$UserProjectIdsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? proposed = null,
    Object? accepted = null,
  }) {
    return _then(_$UserProjectIdsImpl(
      created: null == created
          ? _value._created
          : created // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proposed: null == proposed
          ? _value._proposed
          : proposed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accepted: null == accepted
          ? _value._accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProjectIdsImpl implements _UserProjectIds {
  const _$UserProjectIdsImpl(
      {required final List<String> created,
      required final List<String> proposed,
      required final List<String> accepted})
      : _created = created,
        _proposed = proposed,
        _accepted = accepted;

  factory _$UserProjectIdsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProjectIdsImplFromJson(json);

  final List<String> _created;
  @override
  List<String> get created {
    if (_created is EqualUnmodifiableListView) return _created;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_created);
  }

  final List<String> _proposed;
  @override
  List<String> get proposed {
    if (_proposed is EqualUnmodifiableListView) return _proposed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proposed);
  }

  final List<String> _accepted;
  @override
  List<String> get accepted {
    if (_accepted is EqualUnmodifiableListView) return _accepted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accepted);
  }

  @override
  String toString() {
    return 'UserProjectIds(created: $created, proposed: $proposed, accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProjectIdsImpl &&
            const DeepCollectionEquality().equals(other._created, _created) &&
            const DeepCollectionEquality().equals(other._proposed, _proposed) &&
            const DeepCollectionEquality().equals(other._accepted, _accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_created),
      const DeepCollectionEquality().hash(_proposed),
      const DeepCollectionEquality().hash(_accepted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProjectIdsImplCopyWith<_$UserProjectIdsImpl> get copyWith =>
      __$$UserProjectIdsImplCopyWithImpl<_$UserProjectIdsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProjectIdsImplToJson(
      this,
    );
  }
}

abstract class _UserProjectIds implements UserProjectIds {
  const factory _UserProjectIds(
      {required final List<String> created,
      required final List<String> proposed,
      required final List<String> accepted}) = _$UserProjectIdsImpl;

  factory _UserProjectIds.fromJson(Map<String, dynamic> json) =
      _$UserProjectIdsImpl.fromJson;

  @override
  List<String> get created;
  @override
  List<String> get proposed;
  @override
  List<String> get accepted;
  @override
  @JsonKey(ignore: true)
  _$$UserProjectIdsImplCopyWith<_$UserProjectIdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
