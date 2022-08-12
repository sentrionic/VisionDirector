// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) {
  return _ProjectDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get scenarioCount => throw _privateConstructorUsedError;
  List<CollaboratorDto> get collaborators => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDtoCopyWith<ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDtoCopyWith<$Res> {
  factory $ProjectDtoCopyWith(
          ProjectDto value, $Res Function(ProjectDto) then) =
      _$ProjectDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      int scenarioCount,
      List<CollaboratorDto> collaborators});
}

/// @nodoc
class _$ProjectDtoCopyWithImpl<$Res> implements $ProjectDtoCopyWith<$Res> {
  _$ProjectDtoCopyWithImpl(this._value, this._then);

  final ProjectDto _value;
  // ignore: unused_field
  final $Res Function(ProjectDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? scenarioCount = freezed,
    Object? collaborators = freezed,
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
      scenarioCount: scenarioCount == freezed
          ? _value.scenarioCount
          : scenarioCount // ignore: cast_nullable_to_non_nullable
              as int,
      collaborators: collaborators == freezed
          ? _value.collaborators
          : collaborators // ignore: cast_nullable_to_non_nullable
              as List<CollaboratorDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectDtoCopyWith<$Res>
    implements $ProjectDtoCopyWith<$Res> {
  factory _$$_ProjectDtoCopyWith(
          _$_ProjectDto value, $Res Function(_$_ProjectDto) then) =
      __$$_ProjectDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      int scenarioCount,
      List<CollaboratorDto> collaborators});
}

/// @nodoc
class __$$_ProjectDtoCopyWithImpl<$Res> extends _$ProjectDtoCopyWithImpl<$Res>
    implements _$$_ProjectDtoCopyWith<$Res> {
  __$$_ProjectDtoCopyWithImpl(
      _$_ProjectDto _value, $Res Function(_$_ProjectDto) _then)
      : super(_value, (v) => _then(v as _$_ProjectDto));

  @override
  _$_ProjectDto get _value => super._value as _$_ProjectDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? scenarioCount = freezed,
    Object? collaborators = freezed,
  }) {
    return _then(_$_ProjectDto(
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
      scenarioCount: scenarioCount == freezed
          ? _value.scenarioCount
          : scenarioCount // ignore: cast_nullable_to_non_nullable
              as int,
      collaborators: collaborators == freezed
          ? _value._collaborators
          : collaborators // ignore: cast_nullable_to_non_nullable
              as List<CollaboratorDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectDto extends _ProjectDto {
  const _$_ProjectDto(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.scenarioCount,
      required final List<CollaboratorDto> collaborators})
      : _collaborators = collaborators,
        super._();

  factory _$_ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final int scenarioCount;
  final List<CollaboratorDto> _collaborators;
  @override
  List<CollaboratorDto> get collaborators {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collaborators);
  }

  @override
  String toString() {
    return 'ProjectDto(id: $id, name: $name, createdAt: $createdAt, scenarioCount: $scenarioCount, collaborators: $collaborators)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.scenarioCount, scenarioCount) &&
            const DeepCollectionEquality()
                .equals(other._collaborators, _collaborators));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(scenarioCount),
      const DeepCollectionEquality().hash(_collaborators));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      __$$_ProjectDtoCopyWithImpl<_$_ProjectDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectDtoToJson(
      this,
    );
  }
}

abstract class _ProjectDto extends ProjectDto {
  const factory _ProjectDto(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final int scenarioCount,
      required final List<CollaboratorDto> collaborators}) = _$_ProjectDto;
  const _ProjectDto._() : super._();

  factory _ProjectDto.fromJson(Map<String, dynamic> json) =
      _$_ProjectDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  int get scenarioCount;
  @override
  List<CollaboratorDto> get collaborators;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}
