// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditTaskState {
  TaskTitle get title => throw _privateConstructorUsedError;
  TaskBody get body => throw _privateConstructorUsedError;
  Step? get step => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<TaskFailure, Task>> get taskFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTaskStateCopyWith<EditTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTaskStateCopyWith<$Res> {
  factory $EditTaskStateCopyWith(
          EditTaskState value, $Res Function(EditTaskState) then) =
      _$EditTaskStateCopyWithImpl<$Res>;
  $Res call(
      {TaskTitle title,
      TaskBody body,
      Step? step,
      Collaborator? assignee,
      DateTime? deadline,
      bool isCompleted,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Task>> taskFailureOrSuccessOption});

  $StepCopyWith<$Res>? get step;
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$EditTaskStateCopyWithImpl<$Res>
    implements $EditTaskStateCopyWith<$Res> {
  _$EditTaskStateCopyWithImpl(this._value, this._then);

  final EditTaskState _value;
  // ignore: unused_field
  final $Res Function(EditTaskState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
    Object? isCompleted = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? taskFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TaskTitle,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TaskBody,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as Step?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskFailureOrSuccessOption: taskFailureOrSuccessOption == freezed
          ? _value.taskFailureOrSuccessOption
          : taskFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TaskFailure, Task>>,
    ));
  }

  @override
  $StepCopyWith<$Res>? get step {
    if (_value.step == null) {
      return null;
    }

    return $StepCopyWith<$Res>(_value.step!, (value) {
      return _then(_value.copyWith(step: value));
    });
  }

  @override
  $CollaboratorCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $CollaboratorCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditTaskStateCopyWith<$Res>
    implements $EditTaskStateCopyWith<$Res> {
  factory _$$_EditTaskStateCopyWith(
          _$_EditTaskState value, $Res Function(_$_EditTaskState) then) =
      __$$_EditTaskStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TaskTitle title,
      TaskBody body,
      Step? step,
      Collaborator? assignee,
      DateTime? deadline,
      bool isCompleted,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Task>> taskFailureOrSuccessOption});

  @override
  $StepCopyWith<$Res>? get step;
  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_EditTaskStateCopyWithImpl<$Res>
    extends _$EditTaskStateCopyWithImpl<$Res>
    implements _$$_EditTaskStateCopyWith<$Res> {
  __$$_EditTaskStateCopyWithImpl(
      _$_EditTaskState _value, $Res Function(_$_EditTaskState) _then)
      : super(_value, (v) => _then(v as _$_EditTaskState));

  @override
  _$_EditTaskState get _value => super._value as _$_EditTaskState;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
    Object? isCompleted = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? taskFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_EditTaskState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TaskTitle,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TaskBody,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as Step?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskFailureOrSuccessOption: taskFailureOrSuccessOption == freezed
          ? _value.taskFailureOrSuccessOption
          : taskFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TaskFailure, Task>>,
    ));
  }
}

/// @nodoc

class _$_EditTaskState implements _EditTaskState {
  const _$_EditTaskState(
      {required this.title,
      required this.body,
      this.step,
      this.assignee,
      this.deadline,
      required this.isCompleted,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.taskFailureOrSuccessOption});

  @override
  final TaskTitle title;
  @override
  final TaskBody body;
  @override
  final Step? step;
  @override
  final Collaborator? assignee;
  @override
  final DateTime? deadline;
  @override
  final bool isCompleted;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<TaskFailure, Task>> taskFailureOrSuccessOption;

  @override
  String toString() {
    return 'EditTaskState(title: $title, body: $body, step: $step, assignee: $assignee, deadline: $deadline, isCompleted: $isCompleted, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, taskFailureOrSuccessOption: $taskFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditTaskState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.assignee, assignee) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.taskFailureOrSuccessOption, taskFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(assignee),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(taskFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_EditTaskStateCopyWith<_$_EditTaskState> get copyWith =>
      __$$_EditTaskStateCopyWithImpl<_$_EditTaskState>(this, _$identity);
}

abstract class _EditTaskState implements EditTaskState {
  const factory _EditTaskState(
      {required final TaskTitle title,
      required final TaskBody body,
      final Step? step,
      final Collaborator? assignee,
      final DateTime? deadline,
      required final bool isCompleted,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<TaskFailure, Task>>
          taskFailureOrSuccessOption}) = _$_EditTaskState;

  @override
  TaskTitle get title;
  @override
  TaskBody get body;
  @override
  Step? get step;
  @override
  Collaborator? get assignee;
  @override
  DateTime? get deadline;
  @override
  bool get isCompleted;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<TaskFailure, Task>> get taskFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_EditTaskStateCopyWith<_$_EditTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
