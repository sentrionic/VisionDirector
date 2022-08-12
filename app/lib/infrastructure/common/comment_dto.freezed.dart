// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) {
  return _CommentDto.fromJson(json);
}

/// @nodoc
mixin _$CommentDto {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  CollaboratorDto get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentDtoCopyWith<CommentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentDtoCopyWith<$Res> {
  factory $CommentDtoCopyWith(
          CommentDto value, $Res Function(CommentDto) then) =
      _$CommentDtoCopyWithImpl<$Res>;
  $Res call({String id, String createdAt, String body, CollaboratorDto author});

  $CollaboratorDtoCopyWith<$Res> get author;
}

/// @nodoc
class _$CommentDtoCopyWithImpl<$Res> implements $CommentDtoCopyWith<$Res> {
  _$CommentDtoCopyWithImpl(this._value, this._then);

  final CommentDto _value;
  // ignore: unused_field
  final $Res Function(CommentDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto,
    ));
  }

  @override
  $CollaboratorDtoCopyWith<$Res> get author {
    return $CollaboratorDtoCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$$_CommentDtoCopyWith<$Res>
    implements $CommentDtoCopyWith<$Res> {
  factory _$$_CommentDtoCopyWith(
          _$_CommentDto value, $Res Function(_$_CommentDto) then) =
      __$$_CommentDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String createdAt, String body, CollaboratorDto author});

  @override
  $CollaboratorDtoCopyWith<$Res> get author;
}

/// @nodoc
class __$$_CommentDtoCopyWithImpl<$Res> extends _$CommentDtoCopyWithImpl<$Res>
    implements _$$_CommentDtoCopyWith<$Res> {
  __$$_CommentDtoCopyWithImpl(
      _$_CommentDto _value, $Res Function(_$_CommentDto) _then)
      : super(_value, (v) => _then(v as _$_CommentDto));

  @override
  _$_CommentDto get _value => super._value as _$_CommentDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? author = freezed,
  }) {
    return _then(_$_CommentDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as CollaboratorDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentDto extends _CommentDto {
  const _$_CommentDto(
      {required this.id,
      required this.createdAt,
      required this.body,
      required this.author})
      : super._();

  factory _$_CommentDto.fromJson(Map<String, dynamic> json) =>
      _$$_CommentDtoFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String body;
  @override
  final CollaboratorDto author;

  @override
  String toString() {
    return 'CommentDto(id: $id, createdAt: $createdAt, body: $body, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.author, author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(author));

  @JsonKey(ignore: true)
  @override
  _$$_CommentDtoCopyWith<_$_CommentDto> get copyWith =>
      __$$_CommentDtoCopyWithImpl<_$_CommentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentDtoToJson(
      this,
    );
  }
}

abstract class _CommentDto extends CommentDto {
  const factory _CommentDto(
      {required final String id,
      required final String createdAt,
      required final String body,
      required final CollaboratorDto author}) = _$_CommentDto;
  const _CommentDto._() : super._();

  factory _CommentDto.fromJson(Map<String, dynamic> json) =
      _$_CommentDto.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get body;
  @override
  CollaboratorDto get author;
  @override
  @JsonKey(ignore: true)
  _$$_CommentDtoCopyWith<_$_CommentDto> get copyWith =>
      throw _privateConstructorUsedError;
}
