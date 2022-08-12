// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Step {
  String get id => throw _privateConstructorUsedError;
  StepName get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  StepTransition get transition => throw _privateConstructorUsedError;
  Media? get media => throw _privateConstructorUsedError;
  Media? get audio => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  Annotation? get annotation => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res>;
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      Duration duration,
      int position,
      bool isLocked,
      bool isCompleted,
      StepTransition transition,
      Media? media,
      Media? audio,
      String? thumbnail,
      Annotation? annotation,
      Collaborator? assignee});

  $MediaCopyWith<$Res>? get media;
  $MediaCopyWith<$Res>? get audio;
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$StepCopyWithImpl<$Res> implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  final Step _value;
  // ignore: unused_field
  final $Res Function(Step) _then;

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
    Object? thumbnail = freezed,
    Object? annotation = freezed,
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
              as StepName,
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
              as Duration,
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
              as StepTransition,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Media?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
    ));
  }

  @override
  $MediaCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value));
    });
  }

  @override
  $MediaCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value));
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
abstract class _$$_StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$$_StepCopyWith(_$_Step value, $Res Function(_$_Step) then) =
      __$$_StepCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      Duration duration,
      int position,
      bool isLocked,
      bool isCompleted,
      StepTransition transition,
      Media? media,
      Media? audio,
      String? thumbnail,
      Annotation? annotation,
      Collaborator? assignee});

  @override
  $MediaCopyWith<$Res>? get media;
  @override
  $MediaCopyWith<$Res>? get audio;
  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_StepCopyWithImpl<$Res> extends _$StepCopyWithImpl<$Res>
    implements _$$_StepCopyWith<$Res> {
  __$$_StepCopyWithImpl(_$_Step _value, $Res Function(_$_Step) _then)
      : super(_value, (v) => _then(v as _$_Step));

  @override
  _$_Step get _value => super._value as _$_Step;

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
    Object? thumbnail = freezed,
    Object? annotation = freezed,
    Object? assignee = freezed,
  }) {
    return _then(_$_Step(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StepName,
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
              as Duration,
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
              as StepTransition,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Media?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
    ));
  }
}

/// @nodoc

class _$_Step extends _Step {
  const _$_Step(
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
      this.thumbnail,
      this.annotation,
      this.assignee})
      : super._();

  @override
  final String id;
  @override
  final StepName name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final Duration duration;
  @override
  final int position;
  @override
  final bool isLocked;
  @override
  final bool isCompleted;
  @override
  final StepTransition transition;
  @override
  final Media? media;
  @override
  final Media? audio;
  @override
  final String? thumbnail;
  @override
  final Annotation? annotation;
  @override
  final Collaborator? assignee;

  @override
  String toString() {
    return 'Step(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, duration: $duration, position: $position, isLocked: $isLocked, isCompleted: $isCompleted, transition: $transition, media: $media, audio: $audio, thumbnail: $thumbnail, annotation: $annotation, assignee: $assignee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Step &&
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
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation) &&
            const DeepCollectionEquality().equals(other.assignee, assignee));
  }

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
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(annotation),
      const DeepCollectionEquality().hash(assignee));

  @JsonKey(ignore: true)
  @override
  _$$_StepCopyWith<_$_Step> get copyWith =>
      __$$_StepCopyWithImpl<_$_Step>(this, _$identity);
}

abstract class _Step extends Step {
  const factory _Step(
      {required final String id,
      required final StepName name,
      required final String createdAt,
      required final String updatedAt,
      required final Duration duration,
      required final int position,
      required final bool isLocked,
      required final bool isCompleted,
      required final StepTransition transition,
      final Media? media,
      final Media? audio,
      final String? thumbnail,
      final Annotation? annotation,
      final Collaborator? assignee}) = _$_Step;
  const _Step._() : super._();

  @override
  String get id;
  @override
  StepName get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  Duration get duration;
  @override
  int get position;
  @override
  bool get isLocked;
  @override
  bool get isCompleted;
  @override
  StepTransition get transition;
  @override
  Media? get media;
  @override
  Media? get audio;
  @override
  String? get thumbnail;
  @override
  Annotation? get annotation;
  @override
  Collaborator? get assignee;
  @override
  @JsonKey(ignore: true)
  _$$_StepCopyWith<_$_Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepInput {
  String get id => throw _privateConstructorUsedError;
  StepName get name => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  MediaInput? get media => throw _privateConstructorUsedError;
  MediaInput? get audio => throw _privateConstructorUsedError;
  Annotation? get annotation => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  StepTransition? get transition => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepInputCopyWith<StepInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepInputCopyWith<$Res> {
  factory $StepInputCopyWith(StepInput value, $Res Function(StepInput) then) =
      _$StepInputCopyWithImpl<$Res>;
  $Res call(
      {String id,
      StepName name,
      Duration duration,
      MediaInput? media,
      MediaInput? audio,
      Annotation? annotation,
      Collaborator? assignee,
      String? thumbnail,
      StepTransition? transition,
      int? position});

  $MediaInputCopyWith<$Res>? get media;
  $MediaInputCopyWith<$Res>? get audio;
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$StepInputCopyWithImpl<$Res> implements $StepInputCopyWith<$Res> {
  _$StepInputCopyWithImpl(this._value, this._then);

  final StepInput _value;
  // ignore: unused_field
  final $Res Function(StepInput) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? assignee = freezed,
    Object? thumbnail = freezed,
    Object? transition = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StepName,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaInput?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaInput?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as StepTransition?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $MediaInputCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaInputCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value));
    });
  }

  @override
  $MediaInputCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $MediaInputCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value));
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
abstract class _$$_StepInputCopyWith<$Res> implements $StepInputCopyWith<$Res> {
  factory _$$_StepInputCopyWith(
          _$_StepInput value, $Res Function(_$_StepInput) then) =
      __$$_StepInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      StepName name,
      Duration duration,
      MediaInput? media,
      MediaInput? audio,
      Annotation? annotation,
      Collaborator? assignee,
      String? thumbnail,
      StepTransition? transition,
      int? position});

  @override
  $MediaInputCopyWith<$Res>? get media;
  @override
  $MediaInputCopyWith<$Res>? get audio;
  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_StepInputCopyWithImpl<$Res> extends _$StepInputCopyWithImpl<$Res>
    implements _$$_StepInputCopyWith<$Res> {
  __$$_StepInputCopyWithImpl(
      _$_StepInput _value, $Res Function(_$_StepInput) _then)
      : super(_value, (v) => _then(v as _$_StepInput));

  @override
  _$_StepInput get _value => super._value as _$_StepInput;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? media = freezed,
    Object? audio = freezed,
    Object? annotation = freezed,
    Object? assignee = freezed,
    Object? thumbnail = freezed,
    Object? transition = freezed,
    Object? position = freezed,
  }) {
    return _then(_$_StepInput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StepName,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaInput?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as MediaInput?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      assignee: assignee == freezed
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Collaborator?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      transition: transition == freezed
          ? _value.transition
          : transition // ignore: cast_nullable_to_non_nullable
              as StepTransition?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_StepInput extends _StepInput {
  const _$_StepInput(
      {required this.id,
      required this.name,
      required this.duration,
      this.media,
      this.audio,
      this.annotation,
      this.assignee,
      this.thumbnail,
      this.transition,
      this.position})
      : super._();

  @override
  final String id;
  @override
  final StepName name;
  @override
  final Duration duration;
  @override
  final MediaInput? media;
  @override
  final MediaInput? audio;
  @override
  final Annotation? annotation;
  @override
  final Collaborator? assignee;
  @override
  final String? thumbnail;
  @override
  final StepTransition? transition;
  @override
  final int? position;

  @override
  String toString() {
    return 'StepInput(id: $id, name: $name, duration: $duration, media: $media, audio: $audio, annotation: $annotation, assignee: $assignee, thumbnail: $thumbnail, transition: $transition, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepInput &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation) &&
            const DeepCollectionEquality().equals(other.assignee, assignee) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.transition, transition) &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(media),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(annotation),
      const DeepCollectionEquality().hash(assignee),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(transition),
      const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$$_StepInputCopyWith<_$_StepInput> get copyWith =>
      __$$_StepInputCopyWithImpl<_$_StepInput>(this, _$identity);
}

abstract class _StepInput extends StepInput {
  const factory _StepInput(
      {required final String id,
      required final StepName name,
      required final Duration duration,
      final MediaInput? media,
      final MediaInput? audio,
      final Annotation? annotation,
      final Collaborator? assignee,
      final String? thumbnail,
      final StepTransition? transition,
      final int? position}) = _$_StepInput;
  const _StepInput._() : super._();

  @override
  String get id;
  @override
  StepName get name;
  @override
  Duration get duration;
  @override
  MediaInput? get media;
  @override
  MediaInput? get audio;
  @override
  Annotation? get annotation;
  @override
  Collaborator? get assignee;
  @override
  String? get thumbnail;
  @override
  StepTransition? get transition;
  @override
  int? get position;
  @override
  @JsonKey(ignore: true)
  _$$_StepInputCopyWith<_$_StepInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepTask {
  String get id => throw _privateConstructorUsedError;
  StepName get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get taskCount => throw _privateConstructorUsedError;
  int get taskCompletedCount => throw _privateConstructorUsedError;
  Collaborator? get assignee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepTaskCopyWith<StepTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepTaskCopyWith<$Res> {
  factory $StepTaskCopyWith(StepTask value, $Res Function(StepTask) then) =
      _$StepTaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      int position,
      bool isCompleted,
      int taskCount,
      int taskCompletedCount,
      Collaborator? assignee});

  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$StepTaskCopyWithImpl<$Res> implements $StepTaskCopyWith<$Res> {
  _$StepTaskCopyWithImpl(this._value, this._then);

  final StepTask _value;
  // ignore: unused_field
  final $Res Function(StepTask) _then;

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
              as StepName,
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
              as Collaborator?,
    ));
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
abstract class _$$_StepTaskCopyWith<$Res> implements $StepTaskCopyWith<$Res> {
  factory _$$_StepTaskCopyWith(
          _$_StepTask value, $Res Function(_$_StepTask) then) =
      __$$_StepTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      int position,
      bool isCompleted,
      int taskCount,
      int taskCompletedCount,
      Collaborator? assignee});

  @override
  $CollaboratorCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_StepTaskCopyWithImpl<$Res> extends _$StepTaskCopyWithImpl<$Res>
    implements _$$_StepTaskCopyWith<$Res> {
  __$$_StepTaskCopyWithImpl(
      _$_StepTask _value, $Res Function(_$_StepTask) _then)
      : super(_value, (v) => _then(v as _$_StepTask));

  @override
  _$_StepTask get _value => super._value as _$_StepTask;

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
    return _then(_$_StepTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StepName,
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
              as Collaborator?,
    ));
  }
}

/// @nodoc

class _$_StepTask extends _StepTask {
  const _$_StepTask(
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

  @override
  final String id;
  @override
  final StepName name;
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
  final Collaborator? assignee;

  @override
  String toString() {
    return 'StepTask(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, position: $position, isCompleted: $isCompleted, taskCount: $taskCount, taskCompletedCount: $taskCompletedCount, assignee: $assignee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepTask &&
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
  _$$_StepTaskCopyWith<_$_StepTask> get copyWith =>
      __$$_StepTaskCopyWithImpl<_$_StepTask>(this, _$identity);
}

abstract class _StepTask extends StepTask {
  const factory _StepTask(
      {required final String id,
      required final StepName name,
      required final String createdAt,
      required final String updatedAt,
      required final int position,
      required final bool isCompleted,
      required final int taskCount,
      required final int taskCompletedCount,
      final Collaborator? assignee}) = _$_StepTask;
  const _StepTask._() : super._();

  @override
  String get id;
  @override
  StepName get name;
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
  Collaborator? get assignee;
  @override
  @JsonKey(ignore: true)
  _$$_StepTaskCopyWith<_$_StepTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScenarioStep {
  String get id => throw _privateConstructorUsedError;
  StepName get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Scenario get scenario => throw _privateConstructorUsedError;
  Media? get media => throw _privateConstructorUsedError;
  Media? get audio => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  Annotation? get annotation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScenarioStepCopyWith<ScenarioStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioStepCopyWith<$Res> {
  factory $ScenarioStepCopyWith(
          ScenarioStep value, $Res Function(ScenarioStep) then) =
      _$ScenarioStepCopyWithImpl<$Res>;
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      Duration duration,
      Scenario scenario,
      Media? media,
      Media? audio,
      String? thumbnail,
      Annotation? annotation});

  $ScenarioCopyWith<$Res> get scenario;
  $MediaCopyWith<$Res>? get media;
  $MediaCopyWith<$Res>? get audio;
}

/// @nodoc
class _$ScenarioStepCopyWithImpl<$Res> implements $ScenarioStepCopyWith<$Res> {
  _$ScenarioStepCopyWithImpl(this._value, this._then);

  final ScenarioStep _value;
  // ignore: unused_field
  final $Res Function(ScenarioStep) _then;

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
    Object? thumbnail = freezed,
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
              as StepName,
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
              as Duration,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Media?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
    ));
  }

  @override
  $ScenarioCopyWith<$Res> get scenario {
    return $ScenarioCopyWith<$Res>(_value.scenario, (value) {
      return _then(_value.copyWith(scenario: value));
    });
  }

  @override
  $MediaCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value));
    });
  }

  @override
  $MediaCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value));
    });
  }
}

/// @nodoc
abstract class _$$_ScenarioStepCopyWith<$Res>
    implements $ScenarioStepCopyWith<$Res> {
  factory _$$_ScenarioStepCopyWith(
          _$_ScenarioStep value, $Res Function(_$_ScenarioStep) then) =
      __$$_ScenarioStepCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      StepName name,
      String createdAt,
      String updatedAt,
      Duration duration,
      Scenario scenario,
      Media? media,
      Media? audio,
      String? thumbnail,
      Annotation? annotation});

  @override
  $ScenarioCopyWith<$Res> get scenario;
  @override
  $MediaCopyWith<$Res>? get media;
  @override
  $MediaCopyWith<$Res>? get audio;
}

/// @nodoc
class __$$_ScenarioStepCopyWithImpl<$Res>
    extends _$ScenarioStepCopyWithImpl<$Res>
    implements _$$_ScenarioStepCopyWith<$Res> {
  __$$_ScenarioStepCopyWithImpl(
      _$_ScenarioStep _value, $Res Function(_$_ScenarioStep) _then)
      : super(_value, (v) => _then(v as _$_ScenarioStep));

  @override
  _$_ScenarioStep get _value => super._value as _$_ScenarioStep;

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
    Object? thumbnail = freezed,
    Object? annotation = freezed,
  }) {
    return _then(_$_ScenarioStep(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StepName,
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
              as Duration,
      scenario: scenario == freezed
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Media?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: annotation == freezed
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
    ));
  }
}

/// @nodoc

class _$_ScenarioStep extends _ScenarioStep {
  const _$_ScenarioStep(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.duration,
      required this.scenario,
      this.media,
      this.audio,
      this.thumbnail,
      this.annotation})
      : super._();

  @override
  final String id;
  @override
  final StepName name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final Duration duration;
  @override
  final Scenario scenario;
  @override
  final Media? media;
  @override
  final Media? audio;
  @override
  final String? thumbnail;
  @override
  final Annotation? annotation;

  @override
  String toString() {
    return 'ScenarioStep(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, duration: $duration, scenario: $scenario, media: $media, audio: $audio, thumbnail: $thumbnail, annotation: $annotation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioStep &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.scenario, scenario) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.annotation, annotation));
  }

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
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(annotation));

  @JsonKey(ignore: true)
  @override
  _$$_ScenarioStepCopyWith<_$_ScenarioStep> get copyWith =>
      __$$_ScenarioStepCopyWithImpl<_$_ScenarioStep>(this, _$identity);
}

abstract class _ScenarioStep extends ScenarioStep {
  const factory _ScenarioStep(
      {required final String id,
      required final StepName name,
      required final String createdAt,
      required final String updatedAt,
      required final Duration duration,
      required final Scenario scenario,
      final Media? media,
      final Media? audio,
      final String? thumbnail,
      final Annotation? annotation}) = _$_ScenarioStep;
  const _ScenarioStep._() : super._();

  @override
  String get id;
  @override
  StepName get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  Duration get duration;
  @override
  Scenario get scenario;
  @override
  Media? get media;
  @override
  Media? get audio;
  @override
  String? get thumbnail;
  @override
  Annotation? get annotation;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioStepCopyWith<_$_ScenarioStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ToggleStep {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToggleStepCopyWith<ToggleStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleStepCopyWith<$Res> {
  factory $ToggleStepCopyWith(
          ToggleStep value, $Res Function(ToggleStep) then) =
      _$ToggleStepCopyWithImpl<$Res>;
  $Res call({String id, String name, bool isLocked});
}

/// @nodoc
class _$ToggleStepCopyWithImpl<$Res> implements $ToggleStepCopyWith<$Res> {
  _$ToggleStepCopyWithImpl(this._value, this._then);

  final ToggleStep _value;
  // ignore: unused_field
  final $Res Function(ToggleStep) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isLocked = freezed,
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
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ToggleStepCopyWith<$Res>
    implements $ToggleStepCopyWith<$Res> {
  factory _$$_ToggleStepCopyWith(
          _$_ToggleStep value, $Res Function(_$_ToggleStep) then) =
      __$$_ToggleStepCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool isLocked});
}

/// @nodoc
class __$$_ToggleStepCopyWithImpl<$Res> extends _$ToggleStepCopyWithImpl<$Res>
    implements _$$_ToggleStepCopyWith<$Res> {
  __$$_ToggleStepCopyWithImpl(
      _$_ToggleStep _value, $Res Function(_$_ToggleStep) _then)
      : super(_value, (v) => _then(v as _$_ToggleStep));

  @override
  _$_ToggleStep get _value => super._value as _$_ToggleStep;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_$_ToggleStep(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ToggleStep extends _ToggleStep {
  const _$_ToggleStep(
      {required this.id, required this.name, required this.isLocked})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isLocked;

  @override
  String toString() {
    return 'ToggleStep(id: $id, name: $name, isLocked: $isLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleStep &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isLocked, isLocked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isLocked));

  @JsonKey(ignore: true)
  @override
  _$$_ToggleStepCopyWith<_$_ToggleStep> get copyWith =>
      __$$_ToggleStepCopyWithImpl<_$_ToggleStep>(this, _$identity);
}

abstract class _ToggleStep extends ToggleStep {
  const factory _ToggleStep(
      {required final String id,
      required final String name,
      required final bool isLocked}) = _$_ToggleStep;
  const _ToggleStep._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isLocked;
  @override
  @JsonKey(ignore: true)
  _$$_ToggleStepCopyWith<_$_ToggleStep> get copyWith =>
      throw _privateConstructorUsedError;
}
