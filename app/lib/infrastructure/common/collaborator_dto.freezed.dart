// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collaborator_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollaboratorDto _$CollaboratorDtoFromJson(Map<String, dynamic> json) {
  return _CollaboratorDto.fromJson(json);
}

/// @nodoc
mixin _$CollaboratorDto {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollaboratorDtoCopyWith<CollaboratorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollaboratorDtoCopyWith<$Res> {
  factory $CollaboratorDtoCopyWith(
          CollaboratorDto value, $Res Function(CollaboratorDto) then) =
      _$CollaboratorDtoCopyWithImpl<$Res>;
  $Res call({String id, String username, String email});
}

/// @nodoc
class _$CollaboratorDtoCopyWithImpl<$Res>
    implements $CollaboratorDtoCopyWith<$Res> {
  _$CollaboratorDtoCopyWithImpl(this._value, this._then);

  final CollaboratorDto _value;
  // ignore: unused_field
  final $Res Function(CollaboratorDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CollaboratorDtoCopyWith<$Res>
    implements $CollaboratorDtoCopyWith<$Res> {
  factory _$$_CollaboratorDtoCopyWith(
          _$_CollaboratorDto value, $Res Function(_$_CollaboratorDto) then) =
      __$$_CollaboratorDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String username, String email});
}

/// @nodoc
class __$$_CollaboratorDtoCopyWithImpl<$Res>
    extends _$CollaboratorDtoCopyWithImpl<$Res>
    implements _$$_CollaboratorDtoCopyWith<$Res> {
  __$$_CollaboratorDtoCopyWithImpl(
      _$_CollaboratorDto _value, $Res Function(_$_CollaboratorDto) _then)
      : super(_value, (v) => _then(v as _$_CollaboratorDto));

  @override
  _$_CollaboratorDto get _value => super._value as _$_CollaboratorDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_CollaboratorDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollaboratorDto extends _CollaboratorDto {
  const _$_CollaboratorDto(
      {required this.id, required this.username, required this.email})
      : super._();

  factory _$_CollaboratorDto.fromJson(Map<String, dynamic> json) =>
      _$$_CollaboratorDtoFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;

  @override
  String toString() {
    return 'CollaboratorDto(id: $id, username: $username, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollaboratorDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_CollaboratorDtoCopyWith<_$_CollaboratorDto> get copyWith =>
      __$$_CollaboratorDtoCopyWithImpl<_$_CollaboratorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollaboratorDtoToJson(
      this,
    );
  }
}

abstract class _CollaboratorDto extends CollaboratorDto {
  const factory _CollaboratorDto(
      {required final String id,
      required final String username,
      required final String email}) = _$_CollaboratorDto;
  const _CollaboratorDto._() : super._();

  factory _CollaboratorDto.fromJson(Map<String, dynamic> json) =
      _$_CollaboratorDto.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_CollaboratorDtoCopyWith<_$_CollaboratorDto> get copyWith =>
      throw _privateConstructorUsedError;
}
