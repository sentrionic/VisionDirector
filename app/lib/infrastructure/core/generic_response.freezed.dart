// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericResponse {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericResponseCopyWith<GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<$Res> {
  factory $GenericResponseCopyWith(
          GenericResponse value, $Res Function(GenericResponse) then) =
      _$GenericResponseCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<$Res>
    implements $GenericResponseCopyWith<$Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  final GenericResponse _value;
  // ignore: unused_field
  final $Res Function(GenericResponse) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GenericResponseCopyWith<$Res>
    implements $GenericResponseCopyWith<$Res> {
  factory _$$_GenericResponseCopyWith(
          _$_GenericResponse value, $Res Function(_$_GenericResponse) then) =
      __$$_GenericResponseCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_GenericResponseCopyWithImpl<$Res>
    extends _$GenericResponseCopyWithImpl<$Res>
    implements _$$_GenericResponseCopyWith<$Res> {
  __$$_GenericResponseCopyWithImpl(
      _$_GenericResponse _value, $Res Function(_$_GenericResponse) _then)
      : super(_value, (v) => _then(v as _$_GenericResponse));

  @override
  _$_GenericResponse get _value => super._value as _$_GenericResponse;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_GenericResponse(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenericResponse extends _GenericResponse {
  const _$_GenericResponse({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'GenericResponse(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericResponse &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_GenericResponseCopyWith<_$_GenericResponse> get copyWith =>
      __$$_GenericResponseCopyWithImpl<_$_GenericResponse>(this, _$identity);
}

abstract class _GenericResponse extends GenericResponse {
  const factory _GenericResponse({required final String value}) =
      _$_GenericResponse;
  const _GenericResponse._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_GenericResponseCopyWith<_$_GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
