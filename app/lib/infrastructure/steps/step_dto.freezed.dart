// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepDto _$StepDtoFromJson(Map<String, dynamic> json) {
  return _StepDto.fromJson(json);
}

/// @nodoc
mixin _$StepDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String get transition => throw _privateConstructorUsedError;
  MediaDto? get media => throw _privateConstructorUsedError;
  MediaDto? get audio => throw _privateConstructorUsedError;
  String? get annotation => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  CollaboratorDto? get assignee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepDtoCopyWith<StepDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepDtoCopyWith<$Res> {
  factory $StepDtoCopyWith(StepDto value, $Res Function(StepDto) then) =
      _$StepDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int duration,
      int position,
      bool isLocked,
      bool isCompleted,
      String transition,
      MediaDto? media,
      MediaDto? audio,
      String? annotation,
      String? thumbnail,
      CollaboratorDto? assignee});

  $MediaDtoCopyWith<$Res>? get media;
  $MediaDtoCopyWith<$Res>? get audio;
  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$StepDtoCopyWithImpl<$Res> implements $StepDtoCopyWith<$Res> {
  _$StepDtoCopyWithImpl(this._value, this._then);

  final StepDto _value;
  // ignore: unused_field
  final $Res Function(StepDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? isLocked = freezed,
    Object? isCompleted = freezed,
    Object? transition = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? thumbnail = freezed,
    Object? assignee = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
    ));
  }

  @override
  $MediaDtoCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value));
    });
  }

  @override
  $MediaDtoCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value));
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
abstract class _$$_StepDtoCopyWith<$Res> implements $StepDtoCopyWith<$Res> {
  factory _$$_StepDtoCopyWith(
          _$_StepDto value, $Res Function(_$_StepDto) then) =
      __$$_StepDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int duration,
      int position,
      bool isLocked,
      bool isCompleted,
      String transition,
      MediaDto? media,
      MediaDto? audio,
      String? annotation,
      String? thumbnail,
      CollaboratorDto? assignee});

  @override
  $MediaDtoCopyWith<$Res>? get media;
  @override
  $MediaDtoCopyWith<$Res>? get audio;
  @override
  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_StepDtoCopyWithImpl<$Res> extends _$StepDtoCopyWithImpl<$Res>
    implements _$$_StepDtoCopyWith<$Res> {
  __$$_StepDtoCopyWithImpl(_$_StepDto _value, $Res Function(_$_StepDto) _then)
      : super(_value, (v) => _then(v as _$_StepDto));

  @override
  _$_StepDto get _value => super._value as _$_StepDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? isLocked = freezed,
    Object? isCompleted = freezed,
    Object? transition = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? thumbnail = freezed,
    Object? assignee = freezed,
  }) {
    return _then(_$_StepDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepDto extends _StepDto with DiagnosticableTreeMixin {
  const _$_StepDto(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.duration,
      required this.position,
      required this.isLocked,
      required this.isCompleted,
      required this.transition,
      this.media,
      this.audio,
      this.annotation,
      this.thumbnail,
      this.assignee})
      : super._();

  factory _$_StepDto.fromJson(Map<String, dynamic> json) =>
      _$$_StepDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int duration;
  @override
  final int position;
  @override
  final bool isLocked;
  @override
  final bool isCompleted;
  @override
  final String transition;
  @override
  final MediaDto? media;
  @override
  final MediaDto? audio;
  @override
  final String? annotation;
  @override
  final String? thumbnail;
  @override
  final CollaboratorDto? assignee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StepDto(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, duration: $duration, position: $position, isLocked: $isLocked, isCompleted: $isCompleted, transition: $transition, media: $media, audio: $audio, annotation: $annotation, thumbnail: $thumbnail, assignee: $assignee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StepDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('isLocked', isLocked))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('transition', transition))
      ..add(DiagnosticsProperty('media', media))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('annotation', annotation))
      ..add(DiagnosticsProperty('thumbnail', thumbnail))
      ..add(DiagnosticsProperty('assignee', assignee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.isLocked, isLocked) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality()
                .equals(other.transition, transition) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.assignee, assignee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(isLocked),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(transition),
      const DeepCollectionEquality().hash(media),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(annotation),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(assignee));

  @JsonKey(ignore: true)
  @override
  _$$_StepDtoCopyWith<_$_StepDto> get copyWith =>
      __$$_StepDtoCopyWithImpl<_$_StepDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepDtoToJson(
      this,
    );
  }
}

abstract class _StepDto extends StepDto {
  const factory _StepDto(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final String updatedAt,
      required final int duration,
      required final int position,
      required final bool isLocked,
      required final bool isCompleted,
      required final String transition,
      final MediaDto? media,
      final MediaDto? audio,
      final String? annotation,
      final String? thumbnail,
      final CollaboratorDto? assignee}) = _$_StepDto;
  const _StepDto._() : super._();

  factory _StepDto.fromJson(Map<String, dynamic> json) = _$_StepDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get duration;
  @override
  int get position;
  @override
  bool get isLocked;
  @override
  bool get isCompleted;
  @override
  String get transition;
  @override
  MediaDto? get media;
  @override
  MediaDto? get audio;
  @override
  String? get annotation;
  @override
  String? get thumbnail;
  @override
  CollaboratorDto? get assignee;
  @override
  @JsonKey(ignore: true)
  _$$_StepDtoCopyWith<_$_StepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

StepTaskDto _$StepTaskDtoFromJson(Map<String, dynamic> json) {
  return _StepTaskDto.fromJson(json);
}

/// @nodoc
mixin _$StepTaskDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get taskCount => throw _privateConstructorUsedError;
  int get taskCompletedCount => throw _privateConstructorUsedError;
  CollaboratorDto? get assignee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepTaskDtoCopyWith<StepTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepTaskDtoCopyWith<$Res> {
  factory $StepTaskDtoCopyWith(
          StepTaskDto value, $Res Function(StepTaskDto) then) =
      _$StepTaskDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int position,
      bool isCompleted,
      int taskCount,
      int taskCompletedCount,
      CollaboratorDto? assignee});

  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$StepTaskDtoCopyWithImpl<$Res> implements $StepTaskDtoCopyWith<$Res> {
  _$StepTaskDtoCopyWithImpl(this._value, this._then);

  final StepTaskDto _value;
  // ignore: unused_field
  final $Res Function(StepTaskDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? position = freezed,
    Object? isCompleted = freezed,
    Object? taskCount = freezed,
    Object? taskCompletedCount = freezed,
    Object? assignee = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      taskCount: taskCount == freezed
          ? _value.taskCount
          : taskCount // ignore: cast_nullable_to_non_nullable
              as int,
      taskCompletedCount: taskCompletedCount == freezed
          ? _value.taskCompletedCount
          : taskCompletedCount // ignore: cast_nullable_to_non_nullable
              as int,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
    ));
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
abstract class _$$_StepTaskDtoCopyWith<$Res>
    implements $StepTaskDtoCopyWith<$Res> {
  factory _$$_StepTaskDtoCopyWith(
          _$_StepTaskDto value, $Res Function(_$_StepTaskDto) then) =
      __$$_StepTaskDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int position,
      bool isCompleted,
      int taskCount,
      int taskCompletedCount,
      CollaboratorDto? assignee});

  @override
  $CollaboratorDtoCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_StepTaskDtoCopyWithImpl<$Res> extends _$StepTaskDtoCopyWithImpl<$Res>
    implements _$$_StepTaskDtoCopyWith<$Res> {
  __$$_StepTaskDtoCopyWithImpl(
      _$_StepTaskDto _value, $Res Function(_$_StepTaskDto) _then)
      : super(_value, (v) => _then(v as _$_StepTaskDto));

  @override
  _$_StepTaskDto get _value => super._value as _$_StepTaskDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? position = freezed,
    Object? isCompleted = freezed,
    Object? taskCount = freezed,
    Object? taskCompletedCount = freezed,
    Object? assignee = freezed,
  }) {
    return _then(_$_StepTaskDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      taskCount: taskCount == freezed
          ? _value.taskCount
          : taskCount // ignore: cast_nullable_to_non_nullable
              as int,
      taskCompletedCount: taskCompletedCount == freezed
          ? _value.taskCompletedCount
          : taskCompletedCount // ignore: cast_nullable_to_non_nullable
              as int,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepTaskDto extends _StepTaskDto with DiagnosticableTreeMixin {
  const _$_StepTaskDto(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.position,
      required this.isCompleted,
      required this.taskCount,
      required this.taskCompletedCount,
      this.assignee})
      : super._();

  factory _$_StepTaskDto.fromJson(Map<String, dynamic> json) =>
      _$$_StepTaskDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int position;
  @override
  final bool isCompleted;
  @override
  final int taskCount;
  @override
  final int taskCompletedCount;
  @override
  final CollaboratorDto? assignee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StepTaskDto(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, position: $position, isCompleted: $isCompleted, taskCount: $taskCount, taskCompletedCount: $taskCompletedCount, assignee: $assignee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StepTaskDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('isCompleted', isCompleted))
      ..add(DiagnosticsProperty('taskCount', taskCount))
      ..add(DiagnosticsProperty('taskCompletedCount', taskCompletedCount))
      ..add(DiagnosticsProperty('assignee', assignee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepTaskDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.taskCount, taskCount) &&
            const DeepCollectionEquality()
                .equals(other.taskCompletedCount, taskCompletedCount) &&
            const DeepCollectionEquality().equals(other.assignee, assignee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(taskCount),
      const DeepCollectionEquality().hash(taskCompletedCount),
      const DeepCollectionEquality().hash(assignee));

  @JsonKey(ignore: true)
  @override
  _$$_StepTaskDtoCopyWith<_$_StepTaskDto> get copyWith =>
      __$$_StepTaskDtoCopyWithImpl<_$_StepTaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepTaskDtoToJson(
      this,
    );
  }
}

abstract class _StepTaskDto extends StepTaskDto {
  const factory _StepTaskDto(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final String updatedAt,
      required final int position,
      required final bool isCompleted,
      required final int taskCount,
      required final int taskCompletedCount,
      final CollaboratorDto? assignee}) = _$_StepTaskDto;
  const _StepTaskDto._() : super._();

  factory _StepTaskDto.fromJson(Map<String, dynamic> json) =
      _$_StepTaskDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get position;
  @override
  bool get isCompleted;
  @override
  int get taskCount;
  @override
  int get taskCompletedCount;
  @override
  CollaboratorDto? get assignee;
  @override
  @JsonKey(ignore: true)
  _$$_StepTaskDtoCopyWith<_$_StepTaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepExport {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  StepTransition get transition => throw _privateConstructorUsedError;
  String get mediaPath => throw _privateConstructorUsedError;
  String? get audioPath => throw _privateConstructorUsedError;
  String? get annotation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepExportCopyWith<StepExport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepExportCopyWith<$Res> {
  factory $StepExportCopyWith(
          StepExport value, $Res Function(StepExport) then) =
      _$StepExportCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int duration,
      int position,
      StepTransition transition,
      String mediaPath,
      String? audioPath,
      String? annotation});
}

/// @nodoc
class _$StepExportCopyWithImpl<$Res> implements $StepExportCopyWith<$Res> {
  _$StepExportCopyWithImpl(this._value, this._then);

  final StepExport _value;
  // ignore: unused_field
  final $Res Function(StepExport) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? transition = freezed,
    Object? mediaPath = freezed,
    Object? audioPath = freezed,
    Object? annotation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as StepTransition,
      mediaPath: mediaPath == freezed
          ? _value.mediaPath
          : mediaPath // ignore: cast_nullable_to_non_nullable
              as String,
      audioPath: audioPath == freezed
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_StepExportCopyWith<$Res>
    implements $StepExportCopyWith<$Res> {
  factory _$$_StepExportCopyWith(
          _$_StepExport value, $Res Function(_$_StepExport) then) =
      __$$_StepExportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int duration,
      int position,
      StepTransition transition,
      String mediaPath,
      String? audioPath,
      String? annotation});
}

/// @nodoc
class __$$_StepExportCopyWithImpl<$Res> extends _$StepExportCopyWithImpl<$Res>
    implements _$$_StepExportCopyWith<$Res> {
  __$$_StepExportCopyWithImpl(
      _$_StepExport _value, $Res Function(_$_StepExport) _then)
      : super(_value, (v) => _then(v as _$_StepExport));

  @override
  _$_StepExport get _value => super._value as _$_StepExport;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? transition = freezed,
    Object? mediaPath = freezed,
    Object? audioPath = freezed,
    Object? annotation = freezed,
  }) {
    return _then(_$_StepExport(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as StepTransition,
      mediaPath: mediaPath == freezed
          ? _value.mediaPath
          : mediaPath // ignore: cast_nullable_to_non_nullable
              as String,
      audioPath: audioPath == freezed
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StepExport extends _StepExport with DiagnosticableTreeMixin {
  const _$_StepExport(
      {required this.id,
      required this.name,
      required this.duration,
      required this.position,
      required this.transition,
      required this.mediaPath,
      this.audioPath,
      this.annotation})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final int duration;
  @override
  final int position;
  @override
  final StepTransition transition;
  @override
  final String mediaPath;
  @override
  final String? audioPath;
  @override
  final String? annotation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StepExport(id: $id, name: $name, duration: $duration, position: $position, transition: $transition, mediaPath: $mediaPath, audioPath: $audioPath, annotation: $annotation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StepExport'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('transition', transition))
      ..add(DiagnosticsProperty('mediaPath', mediaPath))
      ..add(DiagnosticsProperty('audioPath', audioPath))
      ..add(DiagnosticsProperty('annotation', annotation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepExport &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.transition, transition) &&
            const DeepCollectionEquality().equals(other.mediaPath, mediaPath) &&
            const DeepCollectionEquality().equals(other.audioPath, audioPath) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(transition),
      const DeepCollectionEquality().hash(mediaPath),
      const DeepCollectionEquality().hash(audioPath),
      const DeepCollectionEquality().hash(annotation));

  @JsonKey(ignore: true)
  @override
  _$$_StepExportCopyWith<_$_StepExport> get copyWith =>
      __$$_StepExportCopyWithImpl<_$_StepExport>(this, _$identity);
}

abstract class _StepExport extends StepExport {
  const factory _StepExport(
      {required final String id,
      required final String name,
      required final int duration,
      required final int position,
      required final StepTransition transition,
      required final String mediaPath,
      final String? audioPath,
      final String? annotation}) = _$_StepExport;
  const _StepExport._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  int get duration;
  @override
  int get position;
  @override
  StepTransition get transition;
  @override
  String get mediaPath;
  @override
  String? get audioPath;
  @override
  String? get annotation;
  @override
  @JsonKey(ignore: true)
  _$$_StepExportCopyWith<_$_StepExport> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioStepDto _$ScenarioStepDtoFromJson(Map<String, dynamic> json) {
  return _ScenarioStepDto.fromJson(json);
}

/// @nodoc
mixin _$ScenarioStepDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  ScenarioDto get scenario => throw _privateConstructorUsedError;
  MediaDto? get media => throw _privateConstructorUsedError;
  MediaDto? get audio => throw _privateConstructorUsedError;
  String? get annotation => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioStepDtoCopyWith<ScenarioStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioStepDtoCopyWith<$Res> {
  factory $ScenarioStepDtoCopyWith(
          ScenarioStepDto value, $Res Function(ScenarioStepDto) then) =
      _$ScenarioStepDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int duration,
      ScenarioDto scenario,
      MediaDto? media,
      MediaDto? audio,
      String? annotation,
      String? thumbnail});

  $ScenarioDtoCopyWith<$Res> get scenario;
  $MediaDtoCopyWith<$Res>? get media;
  $MediaDtoCopyWith<$Res>? get audio;
}

/// @nodoc
class _$ScenarioStepDtoCopyWithImpl<$Res>
    implements $ScenarioStepDtoCopyWith<$Res> {
  _$ScenarioStepDtoCopyWithImpl(this._value, this._then);

  final ScenarioStepDto _value;
  // ignore: unused_field
  final $Res Function(ScenarioStepDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? scenario = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as ScenarioDto,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ScenarioDtoCopyWith<$Res> get scenario {
    return $ScenarioDtoCopyWith<$Res>(_value.scenario, (value) {
      return _then(_value.copyWith(scenario: value));
    });
  }

  @override
  $MediaDtoCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value));
    });
  }

  @override
  $MediaDtoCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value));
    });
  }
}

/// @nodoc
abstract class _$$_ScenarioStepDtoCopyWith<$Res>
    implements $ScenarioStepDtoCopyWith<$Res> {
  factory _$$_ScenarioStepDtoCopyWith(
          _$_ScenarioStepDto value, $Res Function(_$_ScenarioStepDto) then) =
      __$$_ScenarioStepDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      int duration,
      ScenarioDto scenario,
      MediaDto? media,
      MediaDto? audio,
      String? annotation,
      String? thumbnail});

  @override
  $ScenarioDtoCopyWith<$Res> get scenario;
  @override
  $MediaDtoCopyWith<$Res>? get media;
  @override
  $MediaDtoCopyWith<$Res>? get audio;
}

/// @nodoc
class __$$_ScenarioStepDtoCopyWithImpl<$Res>
    extends _$ScenarioStepDtoCopyWithImpl<$Res>
    implements _$$_ScenarioStepDtoCopyWith<$Res> {
  __$$_ScenarioStepDtoCopyWithImpl(
      _$_ScenarioStepDto _value, $Res Function(_$_ScenarioStepDto) _then)
      : super(_value, (v) => _then(v as _$_ScenarioStepDto));

  @override
  _$_ScenarioStepDto get _value => super._value as _$_ScenarioStepDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? duration = freezed,
    Object? scenario = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_ScenarioStepDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as ScenarioDto,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioStepDto extends _ScenarioStepDto with DiagnosticableTreeMixin {
  const _$_ScenarioStepDto(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.duration,
      required this.scenario,
      this.media,
      this.audio,
      this.annotation,
      this.thumbnail})
      : super._();

  factory _$_ScenarioStepDto.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioStepDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int duration;
  @override
  final ScenarioDto scenario;
  @override
  final MediaDto? media;
  @override
  final MediaDto? audio;
  @override
  final String? annotation;
  @override
  final String? thumbnail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScenarioStepDto(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, duration: $duration, scenario: $scenario, media: $media, audio: $audio, annotation: $annotation, thumbnail: $thumbnail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScenarioStepDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('scenario', scenario))
      ..add(DiagnosticsProperty('media', media))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('annotation', annotation))
      ..add(DiagnosticsProperty('thumbnail', thumbnail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioStepDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.scenario, scenario) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(scenario),
      const DeepCollectionEquality().hash(media),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(annotation),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$$_ScenarioStepDtoCopyWith<_$_ScenarioStepDto> get copyWith =>
      __$$_ScenarioStepDtoCopyWithImpl<_$_ScenarioStepDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioStepDtoToJson(
      this,
    );
  }
}

abstract class _ScenarioStepDto extends ScenarioStepDto {
  const factory _ScenarioStepDto(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final String updatedAt,
      required final int duration,
      required final ScenarioDto scenario,
      final MediaDto? media,
      final MediaDto? audio,
      final String? annotation,
      final String? thumbnail}) = _$_ScenarioStepDto;
  const _ScenarioStepDto._() : super._();

  factory _ScenarioStepDto.fromJson(Map<String, dynamic> json) =
      _$_ScenarioStepDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get duration;
  @override
  ScenarioDto get scenario;
  @override
  MediaDto? get media;
  @override
  MediaDto? get audio;
  @override
  String? get annotation;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioStepDtoCopyWith<_$_ScenarioStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}
