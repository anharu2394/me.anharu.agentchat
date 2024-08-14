// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateProjectForm {
  TitleInput get title => throw _privateConstructorUsedError;
  DescriptionInput get description => throw _privateConstructorUsedError;
  MinBudgetInput get minBudget => throw _privateConstructorUsedError;
  MaxBudgetInput get maxBudget => throw _privateConstructorUsedError;
  DeadlineInput get deadline => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateProjectFormCopyWith<CreateProjectForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectFormCopyWith<$Res> {
  factory $CreateProjectFormCopyWith(
          CreateProjectForm value, $Res Function(CreateProjectForm) then) =
      _$CreateProjectFormCopyWithImpl<$Res, CreateProjectForm>;
  @useResult
  $Res call(
      {TitleInput title,
      DescriptionInput description,
      MinBudgetInput minBudget,
      MaxBudgetInput maxBudget,
      DeadlineInput deadline,
      bool isValid});
}

/// @nodoc
class _$CreateProjectFormCopyWithImpl<$Res, $Val extends CreateProjectForm>
    implements $CreateProjectFormCopyWith<$Res> {
  _$CreateProjectFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? minBudget = null,
    Object? maxBudget = null,
    Object? deadline = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleInput,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as DescriptionInput,
      minBudget: null == minBudget
          ? _value.minBudget
          : minBudget // ignore: cast_nullable_to_non_nullable
              as MinBudgetInput,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as MaxBudgetInput,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DeadlineInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProjectFormImplCopyWith<$Res>
    implements $CreateProjectFormCopyWith<$Res> {
  factory _$$CreateProjectFormImplCopyWith(_$CreateProjectFormImpl value,
          $Res Function(_$CreateProjectFormImpl) then) =
      __$$CreateProjectFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TitleInput title,
      DescriptionInput description,
      MinBudgetInput minBudget,
      MaxBudgetInput maxBudget,
      DeadlineInput deadline,
      bool isValid});
}

/// @nodoc
class __$$CreateProjectFormImplCopyWithImpl<$Res>
    extends _$CreateProjectFormCopyWithImpl<$Res, _$CreateProjectFormImpl>
    implements _$$CreateProjectFormImplCopyWith<$Res> {
  __$$CreateProjectFormImplCopyWithImpl(_$CreateProjectFormImpl _value,
      $Res Function(_$CreateProjectFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? minBudget = null,
    Object? maxBudget = null,
    Object? deadline = null,
    Object? isValid = null,
  }) {
    return _then(_$CreateProjectFormImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleInput,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as DescriptionInput,
      minBudget: null == minBudget
          ? _value.minBudget
          : minBudget // ignore: cast_nullable_to_non_nullable
              as MinBudgetInput,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as MaxBudgetInput,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DeadlineInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateProjectFormImpl implements _CreateProjectForm {
  _$CreateProjectFormImpl(
      {required this.title,
      required this.description,
      required this.minBudget,
      required this.maxBudget,
      required this.deadline,
      required this.isValid});

  @override
  final TitleInput title;
  @override
  final DescriptionInput description;
  @override
  final MinBudgetInput minBudget;
  @override
  final MaxBudgetInput maxBudget;
  @override
  final DeadlineInput deadline;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'CreateProjectForm(title: $title, description: $description, minBudget: $minBudget, maxBudget: $maxBudget, deadline: $deadline, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectFormImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minBudget, minBudget) ||
                other.minBudget == minBudget) &&
            (identical(other.maxBudget, maxBudget) ||
                other.maxBudget == maxBudget) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, minBudget, maxBudget, deadline, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectFormImplCopyWith<_$CreateProjectFormImpl> get copyWith =>
      __$$CreateProjectFormImplCopyWithImpl<_$CreateProjectFormImpl>(
          this, _$identity);
}

abstract class _CreateProjectForm implements CreateProjectForm {
  factory _CreateProjectForm(
      {required final TitleInput title,
      required final DescriptionInput description,
      required final MinBudgetInput minBudget,
      required final MaxBudgetInput maxBudget,
      required final DeadlineInput deadline,
      required final bool isValid}) = _$CreateProjectFormImpl;

  @override
  TitleInput get title;
  @override
  DescriptionInput get description;
  @override
  MinBudgetInput get minBudget;
  @override
  MaxBudgetInput get maxBudget;
  @override
  DeadlineInput get deadline;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$CreateProjectFormImplCopyWith<_$CreateProjectFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
