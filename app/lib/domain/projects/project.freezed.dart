// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get scenarioCount => throw _privateConstructorUsedError;
  List<Collaborator> get collaborators => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String createdAt,
      int scenarioCount,
      List<Collaborator> collaborators});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

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
              as List<Collaborator>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String createdAt,
      int scenarioCount,
      List<Collaborator> collaborators});
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, (v) => _then(v as _$_Project));

  @override
  _$_Project get _value => super._value as _$_Project;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? scenarioCount = freezed,
    Object? collaborators = freezed,
  }) {
    return _then(_$_Project(
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
              as List<Collaborator>,
    ));
  }
}

/// @nodoc

class _$_Project extends _Project {
  const _$_Project(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.scenarioCount,
      required final List<Collaborator> collaborators})
      : _collaborators = collaborators,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final int scenarioCount;
  final List<Collaborator> _collaborators;
  @override
  List<Collaborator> get collaborators {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collaborators);
  }

  @override
  String toString() {
    return 'Project(id: $id, name: $name, createdAt: $createdAt, scenarioCount: $scenarioCount, collaborators: $collaborators)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.scenarioCount, scenarioCount) &&
            const DeepCollectionEquality()
                .equals(other._collaborators, _collaborators));
  }

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
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);
}

abstract class _Project extends Project {
  const factory _Project(
      {required final String id,
      required final String name,
      required final String createdAt,
      required final int scenarioCount,
      required final List<Collaborator> collaborators}) = _$_Project;
  const _Project._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  int get scenarioCount;
  @override
  List<Collaborator> get collaborators;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
