// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isMain => throw _privateConstructorUsedError;
  StepDto? get step => throw _privateConstructorUsedError;
  CollaboratorDto? get assignee => throw _privateConstructorUsedError;
  String? get deadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String? body,
      String createdAt,
      String updatedAt,
      bool isCompleted,
      bool isMain,
      StepDto? step,
      CollaboratorDto? assignee,
      String? deadline});

  $StepDtoCopyWith<$Res>? get step;
  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res> implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  final TaskDto _value;
  // ignore: unused_field
  final $Res Function(TaskDto) _then;

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
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as StepDto?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $StepDtoCopyWith<$Res>? get step {
    if (_value.step == null) {
      return null;
    }

    return $StepDtoCopyWith<$Res>(_value.step!, (value) {
      return _then(_value.copyWith(step: value));
    });
  }

  @override
  $CollaboratorDtoCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $CollaboratorDtoCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$_TaskDtoCopyWith(
          _$_TaskDto value, $Res Function(_$_TaskDto) then) =
      __$$_TaskDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? body,
      String createdAt,
      String updatedAt,
      bool isCompleted,
      bool isMain,
      StepDto? step,
      CollaboratorDto? assignee,
      String? deadline});

  @override
  $StepDtoCopyWith<$Res>? get step;
  @override
  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_TaskDtoCopyWithImpl<$Res> extends _$TaskDtoCopyWithImpl<$Res>
    implements _$$_TaskDtoCopyWith<$Res> {
  __$$_TaskDtoCopyWithImpl(_$_TaskDto _value, $Res Function(_$_TaskDto) _then)
      : super(_value, (v) => _then(v as _$_TaskDto));

  @override
  _$_TaskDto get _value => super._value as _$_TaskDto;

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
    return _then(_$_TaskDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as StepDto?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskDto extends _TaskDto with DiagnosticableTreeMixin {
  const _$_TaskDto(
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

  factory _$_TaskDto.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? body;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final bool isCompleted;
  @override
  final bool isMain;
  @override
  final StepDto? step;
  @override
  final CollaboratorDto? assignee;
  @override
  final String? deadline;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskDto(id: $id, title: $title, body: $body, createdAt: $createdAt, updatedAt: $updatedAt, isCompleted: $isCompleted, isMain: $isMain, step: $step, assignee: $assignee, deadline: $deadline)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('isMain', isMain))
      ..add(DiagnosticsProperty('step', step))
      ..add(DiagnosticsProperty('assignee', assignee))
      ..add(DiagnosticsProperty('deadline', deadline));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskDto &&
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

  @JsonKey(ignore: true)
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
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      __$$_TaskDtoCopyWithImpl<_$_TaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDtoToJson(
      this,
    );
  }
}

abstract class _TaskDto extends TaskDto {
  const factory _TaskDto(
      {required final String id,
      required final String title,
      final String? body,
      required final String createdAt,
      required final String updatedAt,
      required final bool isCompleted,
      required final bool isMain,
      final StepDto? step,
      final CollaboratorDto? assignee,
      final String? deadline}) = _$_TaskDto;
  const _TaskDto._() : super._();

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$_TaskDto.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get body;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isCompleted;
  @override
  bool get isMain;
  @override
  StepDto? get step;
  @override
  CollaboratorDto? get assignee;
  @override
  String? get deadline;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioTaskDto _$ScenarioTaskDtoFromJson(Map<String, dynamic> json) {
  return _ScenarioTaskDto.fromJson(json);
}

/// @nodoc
mixin _$ScenarioTaskDto {
  TaskDto get task => throw _privateConstructorUsedError;
  ScenarioDto get scenario => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioTaskDtoCopyWith<ScenarioTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioTaskDtoCopyWith<$Res> {
  factory $ScenarioTaskDtoCopyWith(
          ScenarioTaskDto value, $Res Function(ScenarioTaskDto) then) =
      _$ScenarioTaskDtoCopyWithImpl<$Res>;
  $Res call({TaskDto task, ScenarioDto scenario});

  $TaskDtoCopyWith<$Res> get task;
  $ScenarioDtoCopyWith<$Res> get scenario;
}

/// @nodoc
class _$ScenarioTaskDtoCopyWithImpl<$Res>
    implements $ScenarioTaskDtoCopyWith<$Res> {
  _$ScenarioTaskDtoCopyWithImpl(this._value, this._then);

  final ScenarioTaskDto _value;
  // ignore: unused_field
  final $Res Function(ScenarioTaskDto) _then;

  @override
  $Res call({
    Object? task = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskDto,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as ScenarioDto,
    ));
  }

  @override
  $TaskDtoCopyWith<$Res> get task {
    return $TaskDtoCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }

  @override
  $ScenarioDtoCopyWith<$Res> get scenario {
    return $ScenarioDtoCopyWith<$Res>(_value.scenario, (value) {
      return _then(_value.copyWith(scenario: value));
    });
  }
}

/// @nodoc
abstract class _$$_ScenarioTaskDtoCopyWith<$Res>
    implements $ScenarioTaskDtoCopyWith<$Res> {
  factory _$$_ScenarioTaskDtoCopyWith(
          _$_ScenarioTaskDto value, $Res Function(_$_ScenarioTaskDto) then) =
      __$$_ScenarioTaskDtoCopyWithImpl<$Res>;
  @override
  $Res call({TaskDto task, ScenarioDto scenario});

  @override
  $TaskDtoCopyWith<$Res> get task;
  @override
  $ScenarioDtoCopyWith<$Res> get scenario;
}

/// @nodoc
class __$$_ScenarioTaskDtoCopyWithImpl<$Res>
    extends _$ScenarioTaskDtoCopyWithImpl<$Res>
    implements _$$_ScenarioTaskDtoCopyWith<$Res> {
  __$$_ScenarioTaskDtoCopyWithImpl(
      _$_ScenarioTaskDto _value, $Res Function(_$_ScenarioTaskDto) _then)
      : super(_value, (v) => _then(v as _$_ScenarioTaskDto));

  @override
  _$_ScenarioTaskDto get _value => super._value as _$_ScenarioTaskDto;

  @override
  $Res call({
    Object? task = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_$_ScenarioTaskDto(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskDto,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as ScenarioDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioTaskDto extends _ScenarioTaskDto with DiagnosticableTreeMixin {
  const _$_ScenarioTaskDto({required this.task, required this.scenario})
      : super._();

  factory _$_ScenarioTaskDto.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioTaskDtoFromJson(json);

  @override
  final TaskDto task;
  @override
  final ScenarioDto scenario;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioTaskDto(task: $task, scenario: $scenario)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioTaskDto'))
      ..add(DiagnosticsProperty('task', task))
      ..add(DiagnosticsProperty('scenario', scenario));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioTaskDto &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality().equals(other.scenario, scenario));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(scenario));

  @JsonKey(ignore: true)
  @override
  _$$_ScenarioTaskDtoCopyWith<_$_ScenarioTaskDto> get copyWith =>
      __$$_ScenarioTaskDtoCopyWithImpl<_$_ScenarioTaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioTaskDtoToJson(
      this,
    );
  }
}

abstract class _ScenarioTaskDto extends ScenarioTaskDto {
  const factory _ScenarioTaskDto(
      {required final TaskDto task,
      required final ScenarioDto scenario}) = _$_ScenarioTaskDto;
  const _ScenarioTaskDto._() : super._();

  factory _ScenarioTaskDto.fromJson(Map<String, dynamic> json) =
      _$_ScenarioTaskDto.fromJson;

  @override
  TaskDto get task;
  @override
  ScenarioDto get scenario;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioTaskDtoCopyWith<_$_ScenarioTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}
