// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  TaskTitle get title => throw _privateConstructorUsedError;
  TaskBody? get body => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isMain => throw _privateConstructorUsedError;
  Step? get step => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;
  String? get deadline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      TaskTitle title,
      TaskBody? body,
      String createdAt,
      String updatedAt,
      bool isCompleted,
      bool isMain,
      Step? step,
      Collaborator? assignee,
      String? deadline});

  $StepCopyWith<$Res>? get step;
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isCompleted = freezed,
    Object? isMain = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TaskTitle,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TaskBody?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isMain: isMain == freezed
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as String?,
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
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      TaskTitle title,
      TaskBody? body,
      String createdAt,
      String updatedAt,
      bool isCompleted,
      bool isMain,
      Step? step,
      Collaborator? assignee,
      String? deadline});

  @override
  $StepCopyWith<$Res>? get step;
  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isCompleted = freezed,
    Object? isMain = freezed,
    Object? step = freezed,
    Object? assignee = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TaskTitle,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as TaskBody?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isMain: isMain == freezed
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as String?,
    ));
  }
}

/// @nodoc

class _$_Task extends _Task {
  const _$_Task(
      {required this.id,
      required this.title,
      this.body,
      required this.createdAt,
      required this.updatedAt,
      required this.isCompleted,
      required this.isMain,
      this.step,
      this.assignee,
      this.deadline})
      : super._();

  @override
  final String id;
  @override
  final TaskTitle title;
  @override
  final TaskBody? body;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final bool isCompleted;
  @override
  final bool isMain;
  @override
  final Step? step;
  @override
  final Collaborator? assignee;
  @override
  final String? deadline;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, body: $body, createdAt: $createdAt, updatedAt: $updatedAt, isCompleted: $isCompleted, isMain: $isMain, step: $step, assignee: $assignee, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.isMain, isMain) &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.assignee, assignee) &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(isMain),
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(assignee),
      const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task extends Task {
  const factory _Task(
      {required final String id,
      required final TaskTitle title,
      final TaskBody? body,
      required final String createdAt,
      required final String updatedAt,
      required final bool isCompleted,
      required final bool isMain,
      final Step? step,
      final Collaborator? assignee,
      final String? deadline}) = _$_Task;
  const _Task._() : super._();

  @override
  String get id;
  @override
  TaskTitle get title;
  @override
  TaskBody? get body;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isCompleted;
  @override
  bool get isMain;
  @override
  Step? get step;
  @override
  Collaborator? get assignee;
  @override
  String? get deadline;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScenarioTask {
  Task get task => throw _privateConstructorUsedError;
  Scenario get scenario => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScenarioTaskCopyWith<ScenarioTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioTaskCopyWith<$Res> {
  factory $ScenarioTaskCopyWith(
          ScenarioTask value, $Res Function(ScenarioTask) then) =
      _$ScenarioTaskCopyWithImpl<$Res>;
  $Res call({Task task, Scenario scenario});

  $TaskCopyWith<$Res> get task;
  $ScenarioCopyWith<$Res> get scenario;
}

/// @nodoc
class _$ScenarioTaskCopyWithImpl<$Res> implements $ScenarioTaskCopyWith<$Res> {
  _$ScenarioTaskCopyWithImpl(this._value, this._then);

  final ScenarioTask _value;
  // ignore: unused_field
  final $Res Function(ScenarioTask) _then;

  @override
  $Res call({
    Object? task = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }

  @override
  $ScenarioCopyWith<$Res> get scenario {
    return $ScenarioCopyWith<$Res>(_value.scenario, (value) {
      return _then(_value.copyWith(scenario: value));
    });
  }
}

/// @nodoc
abstract class _$$_ScenarioTaskCopyWith<$Res>
    implements $ScenarioTaskCopyWith<$Res> {
  factory _$$_ScenarioTaskCopyWith(
          _$_ScenarioTask value, $Res Function(_$_ScenarioTask) then) =
      __$$_ScenarioTaskCopyWithImpl<$Res>;
  @override
  $Res call({Task task, Scenario scenario});

  @override
  $TaskCopyWith<$Res> get task;
  @override
  $ScenarioCopyWith<$Res> get scenario;
}

/// @nodoc
class __$$_ScenarioTaskCopyWithImpl<$Res>
    extends _$ScenarioTaskCopyWithImpl<$Res>
    implements _$$_ScenarioTaskCopyWith<$Res> {
  __$$_ScenarioTaskCopyWithImpl(
      _$_ScenarioTask _value, $Res Function(_$_ScenarioTask) _then)
      : super(_value, (v) => _then(v as _$_ScenarioTask));

  @override
  _$_ScenarioTask get _value => super._value as _$_ScenarioTask;

  @override
  $Res call({
    Object? task = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_$_ScenarioTask(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario,
    ));
  }
}

/// @nodoc

class _$_ScenarioTask extends _ScenarioTask {
  const _$_ScenarioTask({required this.task, required this.scenario})
      : super._();

  @override
  final Task task;
  @override
  final Scenario scenario;

  @override
  String toString() {
    return 'ScenarioTask(task: $task, scenario: $scenario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioTask &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality().equals(other.scenario, scenario));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(scenario));

  @JsonKey(ignore: true)
  @override
  _$$_ScenarioTaskCopyWith<_$_ScenarioTask> get copyWith =>
      __$$_ScenarioTaskCopyWithImpl<_$_ScenarioTask>(this, _$identity);
}

abstract class _ScenarioTask extends ScenarioTask {
  const factory _ScenarioTask(
      {required final Task task,
      required final Scenario scenario}) = _$_ScenarioTask;
  const _ScenarioTask._() : super._();

  @override
  Task get task;
  @override
  Scenario get scenario;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioTaskCopyWith<_$_ScenarioTask> get copyWith =>
      throw _privateConstructorUsedError;
}
