// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) {
  return _MediaDto.fromJson(json);
}

/// @nodoc
mixin _$MediaDto {
  String get fileUrl => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaDtoCopyWith<MediaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDtoCopyWith<$Res> {
  factory $MediaDtoCopyWith(MediaDto value, $Res Function(MediaDto) then) =
      _$MediaDtoCopyWithImpl<$Res>;
  $Res call({String fileUrl, String fileName, String mimeType});
}

/// @nodoc
class _$MediaDtoCopyWithImpl<$Res> implements $MediaDtoCopyWith<$Res> {
  _$MediaDtoCopyWithImpl(this._value, this._then);

  final MediaDto _value;
  // ignore: unused_field
  final $Res Function(MediaDto) _then;

  @override
  $Res call({
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MediaDtoCopyWith<$Res> implements $MediaDtoCopyWith<$Res> {
  factory _$$_MediaDtoCopyWith(
          _$_MediaDto value, $Res Function(_$_MediaDto) then) =
      __$$_MediaDtoCopyWithImpl<$Res>;
  @override
  $Res call({String fileUrl, String fileName, String mimeType});
}

/// @nodoc
class __$$_MediaDtoCopyWithImpl<$Res> extends _$MediaDtoCopyWithImpl<$Res>
    implements _$$_MediaDtoCopyWith<$Res> {
  __$$_MediaDtoCopyWithImpl(
      _$_MediaDto _value, $Res Function(_$_MediaDto) _then)
      : super(_value, (v) => _then(v as _$_MediaDto));

  @override
  _$_MediaDto get _value => super._value as _$_MediaDto;

  @override
  $Res call({
    Object? fileUrl = freezed,
    Object? fileName = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_$_MediaDto(
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaDto extends _MediaDto {
  const _$_MediaDto(
      {required this.fileUrl, required this.fileName, required this.mimeType})
      : super._();

  factory _$_MediaDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaDtoFromJson(json);

  @override
  final String fileUrl;
  @override
  final String fileName;
  @override
  final String mimeType;

  @override
  String toString() {
    return 'MediaDto(fileUrl: $fileUrl, fileName: $fileName, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaDto &&
            const DeepCollectionEquality().equals(other.fileUrl, fileUrl) &&
            const DeepCollectionEquality().equals(other.fileName, fileName) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fileUrl),
      const DeepCollectionEquality().hash(fileName),
      const DeepCollectionEquality().hash(mimeType));

  @JsonKey(ignore: true)
  @override
  _$$_MediaDtoCopyWith<_$_MediaDto> get copyWith =>
      __$$_MediaDtoCopyWithImpl<_$_MediaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaDtoToJson(
      this,
    );
  }
}

abstract class _MediaDto extends MediaDto {
  const factory _MediaDto(
      {required final String fileUrl,
      required final String fileName,
      required final String mimeType}) = _$_MediaDto;
  const _MediaDto._() : super._();

  factory _MediaDto.fromJson(Map<String, dynamic> json) = _$_MediaDto.fromJson;

  @override
  String get fileUrl;
  @override
  String get fileName;
  @override
  String get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$_MediaDtoCopyWith<_$_MediaDto> get copyWith =>
      throw _privateConstructorUsedError;
}
