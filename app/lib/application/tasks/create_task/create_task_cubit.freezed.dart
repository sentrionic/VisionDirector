// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateTaskState {
  TaskTitle get title => throw _privateConstructorUsedError;
  TaskBody get body => throw _privateConstructorUsedError;
  Step? get step => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<TaskFailure, Unit>> get taskFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTaskStateCopyWith<CreateTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskStateCopyWith<$Res> {
  factory $CreateTaskStateCopyWith(
          CreateTaskState value, $Res Function(CreateTaskState) then) =
      _$CreateTaskStateCopyWithImpl<$Res>;
  $Res call(
      {TaskTitle title,
      TaskBody body,
      Step? step,
      Collaborator? assignee,
      DateTime? deadline,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Unit>> taskFailureOrSuccessOption});

  $StepCopyWith<$Res>? get step;
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$CreateTaskStateCopyWithImpl<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  _$CreateTaskStateCopyWithImpl(this._value, this._then);

  final CreateTaskState _value;
  // ignore: unused_field
  final $Res Function(CreateTaskState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
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
              as Option<Either<TaskFailure, Unit>>,
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
abstract class _$$_CreateTaskStateCopyWith<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  factory _$$_CreateTaskStateCopyWith(
          _$_CreateTaskState value, $Res Function(_$_CreateTaskState) then) =
      __$$_CreateTaskStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TaskTitle title,
      TaskBody body,
      Step? step,
      Collaborator? assignee,
      DateTime? deadline,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Unit>> taskFailureOrSuccessOption});

  @override
  $StepCopyWith<$Res>? get step;
  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_CreateTaskStateCopyWithImpl<$Res>
    extends _$CreateTaskStateCopyWithImpl<$Res>
    implements _$$_CreateTaskStateCopyWith<$Res> {
  __$$_CreateTaskStateCopyWithImpl(
      _$_CreateTaskState _value, $Res Function(_$_CreateTaskState) _then)
      : super(_value, (v) => _then(v as _$_CreateTaskState));

  @override
  _$_CreateTaskState get _value => super._value as _$_CreateTaskState;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? taskFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateTaskState(
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
              as Option<Either<TaskFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CreateTaskState implements _CreateTaskState {
  const _$_CreateTaskState(
      {required this.title,
      required this.body,
      this.step,
      this.assignee,
      this.deadline,
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
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<TaskFailure, Unit>> taskFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateTaskState(title: $title, body: $body, step: $step, assignee: $assignee, deadline: $deadline, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, taskFailureOrSuccessOption: $taskFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTaskState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.assignee, assignee) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
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
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(taskFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateTaskStateCopyWith<_$_CreateTaskState> get copyWith =>
      __$$_CreateTaskStateCopyWithImpl<_$_CreateTaskState>(this, _$identity);
}

abstract class _CreateTaskState implements CreateTaskState {
  const factory _CreateTaskState(
      {required final TaskTitle title,
      required final TaskBody body,
      final Step? step,
      final Collaborator? assignee,
      final DateTime? deadline,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<TaskFailure, Unit>>
          taskFailureOrSuccessOption}) = _$_CreateTaskState;

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
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<TaskFailure, Unit>> get taskFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTaskStateCopyWith<_$_CreateTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
