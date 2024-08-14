import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_form.freezed.dart';
part 'create_project_form.g.dart';

class TitleInput extends FormzInput<String, TitleInputError> {
  const TitleInput.pure() : super.pure('');
  const TitleInput.dirty({String value = ''}) : super.dirty(value);

  @override
  TitleInputError? validator(String value) {
    return value.isEmpty ? TitleInputError.empty : null;
  }
}

enum TitleInputError {
  empty(errorText: '未入力です');

  const TitleInputError({required this.errorText});

  final String errorText;
}

class DescriptionInput extends FormzInput<String, DescriptionInputError> {
  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DescriptionInputError? validator(String value) {
    return value.isEmpty ? DescriptionInputError.empty : null;
  }
}

enum DescriptionInputError {
  empty(errorText: '未入力です');

  const DescriptionInputError({required this.errorText});

  final String errorText;
}

class MinBudgetInput extends FormzInput<int, MinBudgetInputError> {
  const MinBudgetInput.pure() : super.pure(0);
  const MinBudgetInput.dirty({int value = 0}) : super.dirty(value);

  @override
  MinBudgetInputError? validator(int value) {
    return value == 0 ? MinBudgetInputError.empty : null;
  }
}

enum MinBudgetInputError {
  empty(errorText: '未入力です');

  const MinBudgetInputError({required this.errorText});

  final String errorText;
}

class MaxBudgetInput extends FormzInput<int, MaxBudgetInputError> {
  const MaxBudgetInput.pure() : super.pure(0);
  const MaxBudgetInput.dirty({int value = 0}) : super.dirty(value);

  @override
  MaxBudgetInputError? validator(int value) {
    return value == 0 ? MaxBudgetInputError.empty : null;
  }
}

enum MaxBudgetInputError {
  empty(errorText: '未入力です');

  const MaxBudgetInputError({required this.errorText});

  final String errorText;
}

class DeadlineInput extends FormzInput<DateTime?, DeadlineInputError> {
  const DeadlineInput.pure() : super.pure(null);
  const DeadlineInput.dirty({DateTime? value}) : super.dirty(value);

  @override
  DeadlineInputError? validator(DateTime? value) {
    return value == null ? DeadlineInputError.empty : null;
  }
}

enum DeadlineInputError {
  empty(errorText: '未入力です');

  const DeadlineInputError({required this.errorText});

  final String errorText;
}

@freezed
class CreateProjectForm with _$CreateProjectForm {
  factory CreateProjectForm({
    required TitleInput title,
    required DescriptionInput description,
    required MinBudgetInput minBudget,
    required MaxBudgetInput maxBudget,
    required DeadlineInput deadline,
    required bool isValid,
  }) = _CreateProjectForm;
}

@riverpod
class CreateProjectFormController extends _$CreateProjectFormController {
  @override
  CreateProjectForm build() {
    return CreateProjectForm(
      title: TitleInput.pure(),
      description: DescriptionInput.pure(),
      minBudget: MinBudgetInput.pure(),
      maxBudget: MaxBudgetInput.pure(),
      deadline: DeadlineInput.pure(),
      isValid: false,
    );
  }

  void onChangeTitle(String value) {
    final title = TitleInput.dirty(value: value);
    state = state.copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          state.description,
          state.minBudget,
          state.maxBudget,
          state.deadline,
        ]));
  }

  void onChangeDescription(String value) {
    final description = DescriptionInput.dirty(value: value);
    state = state.copyWith(
        description: description,
        isValid: Formz.validate([
          state.title,
          description,
          state.minBudget,
          state.maxBudget,
          state.deadline,
        ]));
  }

  void onChangeMinBudget(int value) {
    final minBudget = MinBudgetInput.dirty(value: value);
    state = state.copyWith(
        minBudget: minBudget,
        isValid: Formz.validate([
          state.title,
          state.description,
          minBudget,
          state.maxBudget,
          state.deadline,
        ]));
  }

  void onChangeMaxBudget(int value) {
    final maxBudget = MaxBudgetInput.dirty(value: value);
    state = state.copyWith(
        maxBudget: maxBudget,
        isValid: Formz.validate([
          state.title,
          state.description,
          state.minBudget,
          maxBudget,
          state.deadline,
        ]));
  }

  void onChangeDeadline(DateTime value) {
    final deadline = DeadlineInput.dirty(value: value);
    state = state.copyWith(
        deadline: deadline,
        isValid: Formz.validate([
          state.title,
          state.description,
          state.minBudget,
          state.maxBudget,
          deadline,
        ]));
  }

  Future<void> submit({required Function submitFunction}) async {
    if (!state.isValid) return;

    await submitFunction();
  }
}
