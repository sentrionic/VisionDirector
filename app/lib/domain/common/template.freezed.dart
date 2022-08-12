// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Template {
  String get id => throw _privateConstructorUsedError;
  TemplateName get name => throw _privateConstructorUsedError;
  TemplateDescription get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<TemplateStep> get steps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateCopyWith<Template> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateCopyWith<$Res> {
  factory $TemplateCopyWith(Template value, $Res Function(Template) then) =
      _$TemplateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      TemplateName name,
      TemplateDescription description,
      String createdAt,
      String updatedAt,
      List<TemplateStep> steps});
}

/// @nodoc
class _$TemplateCopyWithImpl<$Res> implements $TemplateCopyWith<$Res> {
  _$TemplateCopyWithImpl(this._value, this._then);

  final Template _value;
  // ignore: unused_field
  final $Res Function(Template) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateDescription,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TemplateStep>,
    ));
  }
}

/// @nodoc
abstract class _$$_TemplateCopyWith<$Res> implements $TemplateCopyWith<$Res> {
  factory _$$_TemplateCopyWith(
          _$_Template value, $Res Function(_$_Template) then) =
      __$$_TemplateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      TemplateName name,
      TemplateDescription description,
      String createdAt,
      String updatedAt,
      List<TemplateStep> steps});
}

/// @nodoc
class __$$_TemplateCopyWithImpl<$Res> extends _$TemplateCopyWithImpl<$Res>
    implements _$$_TemplateCopyWith<$Res> {
  __$$_TemplateCopyWithImpl(
      _$_Template _value, $Res Function(_$_Template) _then)
      : super(_value, (v) => _then(v as _$_Template));

  @override
  _$_Template get _value => super._value as _$_Template;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$_Template(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateDescription,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TemplateStep>,
    ));
  }
}

/// @nodoc

class _$_Template extends _Template {
  const _$_Template(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required final List<TemplateStep> steps})
      : _steps = steps,
        super._();

  @override
  final String id;
  @override
  final TemplateName name;
  @override
  final TemplateDescription description;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<TemplateStep> _steps;
  @override
  List<TemplateStep> get steps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'Template(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Template &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  _$$_TemplateCopyWith<_$_Template> get copyWith =>
      __$$_TemplateCopyWithImpl<_$_Template>(this, _$identity);
}

abstract class _Template extends Template {
  const factory _Template(
      {required final String id,
      required final TemplateName name,
      required final TemplateDescription description,
      required final String createdAt,
      required final String updatedAt,
      required final List<TemplateStep> steps}) = _$_Template;
  const _Template._() : super._();

  @override
  String get id;
  @override
  TemplateName get name;
  @override
  TemplateDescription get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<TemplateStep> get steps;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateCopyWith<_$_Template> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TemplateStep {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  Media? get media => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateStepCopyWith<TemplateStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateStepCopyWith<$Res> {
  factory $TemplateStepCopyWith(
          TemplateStep value, $Res Function(TemplateStep) then) =
      _$TemplateStepCopyWithImpl<$Res>;
  $Res call({String id, String name, int duration, int position, Media? media});

  $MediaCopyWith<$Res>? get media;
}

/// @nodoc
class _$TemplateStepCopyWithImpl<$Res> implements $TemplateStepCopyWith<$Res> {
  _$TemplateStepCopyWithImpl(this._value, this._then);

  final TemplateStep _value;
  // ignore: unused_field
  final $Res Function(TemplateStep) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? media = freezed,
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
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
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
}

/// @nodoc
abstract class _$$_TemplateStepCopyWith<$Res>
    implements $TemplateStepCopyWith<$Res> {
  factory _$$_TemplateStepCopyWith(
          _$_TemplateStep value, $Res Function(_$_TemplateStep) then) =
      __$$_TemplateStepCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int duration, int position, Media? media});

  @override
  $MediaCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_TemplateStepCopyWithImpl<$Res>
    extends _$TemplateStepCopyWithImpl<$Res>
    implements _$$_TemplateStepCopyWith<$Res> {
  __$$_TemplateStepCopyWithImpl(
      _$_TemplateStep _value, $Res Function(_$_TemplateStep) _then)
      : super(_value, (v) => _then(v as _$_TemplateStep));

  @override
  _$_TemplateStep get _value => super._value as _$_TemplateStep;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_TemplateStep(
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
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
    ));
  }
}

/// @nodoc

class _$_TemplateStep extends _TemplateStep {
  const _$_TemplateStep(
      {required this.id,
      required this.name,
      required this.duration,
      required this.position,
      this.media})
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
  final Media? media;

  @override
  String toString() {
    return 'TemplateStep(id: $id, name: $name, duration: $duration, position: $position, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateStep &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(media));

  @JsonKey(ignore: true)
  @override
  _$$_TemplateStepCopyWith<_$_TemplateStep> get copyWith =>
      __$$_TemplateStepCopyWithImpl<_$_TemplateStep>(this, _$identity);
}

abstract class _TemplateStep extends TemplateStep {
  const factory _TemplateStep(
      {required final String id,
      required final String name,
      required final int duration,
      required final int position,
      final Media? media}) = _$_TemplateStep;
  const _TemplateStep._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  int get duration;
  @override
  int get position;
  @override
  Media? get media;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateStepCopyWith<_$_TemplateStep> get copyWith =>
      throw _privateConstructorUsedError;
}
