// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemplateDto _$TemplateDtoFromJson(Map<String, dynamic> json) {
  return _TemplateDto.fromJson(json);
}

/// @nodoc
mixin _$TemplateDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<TemplateStepDto> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateDtoCopyWith<TemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateDtoCopyWith<$Res> {
  factory $TemplateDtoCopyWith(
          TemplateDto value, $Res Function(TemplateDto) then) =
      _$TemplateDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      String description,
      List<TemplateStepDto> steps});
}

/// @nodoc
class _$TemplateDtoCopyWithImpl<$Res> implements $TemplateDtoCopyWith<$Res> {
  _$TemplateDtoCopyWithImpl(this._value, this._then);

  final TemplateDto _value;
  // ignore: unused_field
  final $Res Function(TemplateDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
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
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TemplateStepDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_TemplateDtoCopyWith<$Res>
    implements $TemplateDtoCopyWith<$Res> {
  factory _$$_TemplateDtoCopyWith(
          _$_TemplateDto value, $Res Function(_$_TemplateDto) then) =
      __$$_TemplateDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      String updatedAt,
      String description,
      List<TemplateStepDto> steps});
}

/// @nodoc
class __$$_TemplateDtoCopyWithImpl<$Res> extends _$TemplateDtoCopyWithImpl<$Res>
    implements _$$_TemplateDtoCopyWith<$Res> {
  __$$_TemplateDtoCopyWithImpl(
      _$_TemplateDto _value, $Res Function(_$_TemplateDto) _then)
      : super(_value, (v) => _then(v as _$_TemplateDto));

  @override
  _$_TemplateDto get _value => super._value as _$_TemplateDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$_TemplateDto(
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<TemplateStepDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateDto extends _TemplateDto {
  const _$_TemplateDto(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.description,
      required final List<TemplateStepDto> steps})
      : _steps = steps,
        super._();

  factory _$_TemplateDto.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String description;
  final List<TemplateStepDto> _steps;
  @override
  List<TemplateStepDto> get steps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'TemplateDto(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  _$$_TemplateDtoCopyWith<_$_TemplateDto> get copyWith =>
      __$$_TemplateDtoCopyWithImpl<_$_TemplateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateDtoToJson(
      this,
    );
  }
}

abstract class _TemplateDto extends TemplateDto {
  const factory _TemplateDto(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final String updatedAt,
      required final String description,
      required final List<TemplateStepDto> steps}) = _$_TemplateDto;
  const _TemplateDto._() : super._();

  factory _TemplateDto.fromJson(Map<String, dynamic> json) =
      _$_TemplateDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String get description;
  @override
  List<TemplateStepDto> get steps;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateDtoCopyWith<_$_TemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateStepDto _$TemplateStepDtoFromJson(Map<String, dynamic> json) {
  return _TemplateStepDto.fromJson(json);
}

/// @nodoc
mixin _$TemplateStepDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateStepDtoCopyWith<TemplateStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateStepDtoCopyWith<$Res> {
  factory $TemplateStepDtoCopyWith(
          TemplateStepDto value, $Res Function(TemplateStepDto) then) =
      _$TemplateStepDtoCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, int duration, int position, MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$TemplateStepDtoCopyWithImpl<$Res>
    implements $TemplateStepDtoCopyWith<$Res> {
  _$TemplateStepDtoCopyWithImpl(this._value, this._then);

  final TemplateStepDto _value;
  // ignore: unused_field
  final $Res Function(TemplateStepDto) _then;

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
              as MediaDto?,
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
}

/// @nodoc
abstract class _$$_TemplateStepDtoCopyWith<$Res>
    implements $TemplateStepDtoCopyWith<$Res> {
  factory _$$_TemplateStepDtoCopyWith(
          _$_TemplateStepDto value, $Res Function(_$_TemplateStepDto) then) =
      __$$_TemplateStepDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, int duration, int position, MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_TemplateStepDtoCopyWithImpl<$Res>
    extends _$TemplateStepDtoCopyWithImpl<$Res>
    implements _$$_TemplateStepDtoCopyWith<$Res> {
  __$$_TemplateStepDtoCopyWithImpl(
      _$_TemplateStepDto _value, $Res Function(_$_TemplateStepDto) _then)
      : super(_value, (v) => _then(v as _$_TemplateStepDto));

  @override
  _$_TemplateStepDto get _value => super._value as _$_TemplateStepDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? position = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_TemplateStepDto(
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
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateStepDto extends _TemplateStepDto {
  const _$_TemplateStepDto(
      {required this.id,
      required this.name,
      required this.duration,
      required this.position,
      this.media})
      : super._();

  factory _$_TemplateStepDto.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateStepDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int duration;
  @override
  final int position;
  @override
  final MediaDto? media;

  @override
  String toString() {
    return 'TemplateStepDto(id: $id, name: $name, duration: $duration, position: $position, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateStepDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(ignore: true)
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
  _$$_TemplateStepDtoCopyWith<_$_TemplateStepDto> get copyWith =>
      __$$_TemplateStepDtoCopyWithImpl<_$_TemplateStepDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateStepDtoToJson(
      this,
    );
  }
}

abstract class _TemplateStepDto extends TemplateStepDto {
  const factory _TemplateStepDto(
      {required final String id,
      required final String name,
      required final int duration,
      required final int position,
      final MediaDto? media}) = _$_TemplateStepDto;
  const _TemplateStepDto._() : super._();

  factory _TemplateStepDto.fromJson(Map<String, dynamic> json) =
      _$_TemplateStepDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get duration;
  @override
  int get position;
  @override
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateStepDtoCopyWith<_$_TemplateStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}
