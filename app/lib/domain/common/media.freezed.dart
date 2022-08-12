// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Media {
  String get fileName => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res>;
  $Res call({String fileName, String fileUrl, String mimeType});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res> implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  final Media _value;
  // ignore: unused_field
  final $Res Function(Media) _then;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileUrl = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  $Res call({String fileName, String fileUrl, String mimeType});
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, (v) => _then(v as _$_Media));

  @override
  _$_Media get _value => super._value as _$_Media;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileUrl = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_$_Media(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Media extends _Media {
  const _$_Media(
      {required this.fileName, required this.fileUrl, required this.mimeType})
      : super._();

  @override
  final String fileName;
  @override
  final String fileUrl;
  @override
  final String mimeType;

  @override
  String toString() {
    return 'Media(fileName: $fileName, fileUrl: $fileUrl, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            const DeepCollectionEquality().equals(other.fileName, fileName) &&
            const DeepCollectionEquality().equals(other.fileUrl, fileUrl) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fileName),
      const DeepCollectionEquality().hash(fileUrl),
      const DeepCollectionEquality().hash(mimeType));

  @JsonKey(ignore: true)
  @override
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);
}

abstract class _Media extends Media {
  const factory _Media(
      {required final String fileName,
      required final String fileUrl,
      required final String mimeType}) = _$_Media;
  const _Media._() : super._();

  @override
  String get fileName;
  @override
  String get fileUrl;
  @override
  String get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MediaInput {
  StepMedia get file => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  bool? get isPortrait => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaInputCopyWith<MediaInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaInputCopyWith<$Res> {
  factory $MediaInputCopyWith(
          MediaInput value, $Res Function(MediaInput) then) =
      _$MediaInputCopyWithImpl<$Res>;
  $Res call({StepMedia file, String mimeType, bool? isPortrait});
}

/// @nodoc
class _$MediaInputCopyWithImpl<$Res> implements $MediaInputCopyWith<$Res> {
  _$MediaInputCopyWithImpl(this._value, this._then);

  final MediaInput _value;
  // ignore: unused_field
  final $Res Function(MediaInput) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? mimeType = freezed,
    Object? isPortrait = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as StepMedia,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      isPortrait: isPortrait == freezed
          ? _value.isPortrait
          : isPortrait // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_MediaInputCopyWith<$Res>
    implements $MediaInputCopyWith<$Res> {
  factory _$$_MediaInputCopyWith(
          _$_MediaInput value, $Res Function(_$_MediaInput) then) =
      __$$_MediaInputCopyWithImpl<$Res>;
  @override
  $Res call({StepMedia file, String mimeType, bool? isPortrait});
}

/// @nodoc
class __$$_MediaInputCopyWithImpl<$Res> extends _$MediaInputCopyWithImpl<$Res>
    implements _$$_MediaInputCopyWith<$Res> {
  __$$_MediaInputCopyWithImpl(
      _$_MediaInput _value, $Res Function(_$_MediaInput) _then)
      : super(_value, (v) => _then(v as _$_MediaInput));

  @override
  _$_MediaInput get _value => super._value as _$_MediaInput;

  @override
  $Res call({
    Object? file = freezed,
    Object? mimeType = freezed,
    Object? isPortrait = freezed,
  }) {
    return _then(_$_MediaInput(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as StepMedia,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      isPortrait: isPortrait == freezed
          ? _value.isPortrait
          : isPortrait // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_MediaInput extends _MediaInput {
  const _$_MediaInput(
      {required this.file, required this.mimeType, this.isPortrait})
      : super._();

  @override
  final StepMedia file;
  @override
  final String mimeType;
  @override
  final bool? isPortrait;

  @override
  String toString() {
    return 'MediaInput(file: $file, mimeType: $mimeType, isPortrait: $isPortrait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaInput &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType) &&
            const DeepCollectionEquality()
                .equals(other.isPortrait, isPortrait));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(mimeType),
      const DeepCollectionEquality().hash(isPortrait));

  @JsonKey(ignore: true)
  @override
  _$$_MediaInputCopyWith<_$_MediaInput> get copyWith =>
      __$$_MediaInputCopyWithImpl<_$_MediaInput>(this, _$identity);
}

abstract class _MediaInput extends MediaInput {
  const factory _MediaInput(
      {required final StepMedia file,
      required final String mimeType,
      final bool? isPortrait}) = _$_MediaInput;
  const _MediaInput._() : super._();

  @override
  StepMedia get file;
  @override
  String get mimeType;
  @override
  bool? get isPortrait;
  @override
  @JsonKey(ignore: true)
  _$$_MediaInputCopyWith<_$_MediaInput> get copyWith =>
      throw _privateConstructorUsedError;
}
