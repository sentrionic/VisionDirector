// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setup_media_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SetupMediaState {
  bool get isDownloading => throw _privateConstructorUsedError;
  double get downloadProgress => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetupMediaStateCopyWith<SetupMediaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupMediaStateCopyWith<$Res> {
  factory $SetupMediaStateCopyWith(
          SetupMediaState value, $Res Function(SetupMediaState) then) =
      _$SetupMediaStateCopyWithImpl<$Res>;
  $Res call({bool isDownloading, double downloadProgress, File? file});
}

/// @nodoc
class _$SetupMediaStateCopyWithImpl<$Res>
    implements $SetupMediaStateCopyWith<$Res> {
  _$SetupMediaStateCopyWithImpl(this._value, this._then);

  final SetupMediaState _value;
  // ignore: unused_field
  final $Res Function(SetupMediaState) _then;

  @override
  $Res call({
    Object? isDownloading = freezed,
    Object? downloadProgress = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: downloadProgress == freezed
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$$_SetupMediaStateCopyWith<$Res>
    implements $SetupMediaStateCopyWith<$Res> {
  factory _$$_SetupMediaStateCopyWith(
          _$_SetupMediaState value, $Res Function(_$_SetupMediaState) then) =
      __$$_SetupMediaStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isDownloading, double downloadProgress, File? file});
}

/// @nodoc
class __$$_SetupMediaStateCopyWithImpl<$Res>
    extends _$SetupMediaStateCopyWithImpl<$Res>
    implements _$$_SetupMediaStateCopyWith<$Res> {
  __$$_SetupMediaStateCopyWithImpl(
      _$_SetupMediaState _value, $Res Function(_$_SetupMediaState) _then)
      : super(_value, (v) => _then(v as _$_SetupMediaState));

  @override
  _$_SetupMediaState get _value => super._value as _$_SetupMediaState;

  @override
  $Res call({
    Object? isDownloading = freezed,
    Object? downloadProgress = freezed,
    Object? file = freezed,
  }) {
    return _then(_$_SetupMediaState(
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: downloadProgress == freezed
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_SetupMediaState implements _SetupMediaState {
  const _$_SetupMediaState(
      {required this.isDownloading, required this.downloadProgress, this.file});

  @override
  final bool isDownloading;
  @override
  final double downloadProgress;
  @override
  final File? file;

  @override
  String toString() {
    return 'SetupMediaState(isDownloading: $isDownloading, downloadProgress: $downloadProgress, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetupMediaState &&
            const DeepCollectionEquality()
                .equals(other.isDownloading, isDownloading) &&
            const DeepCollectionEquality()
                .equals(other.downloadProgress, downloadProgress) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isDownloading),
      const DeepCollectionEquality().hash(downloadProgress),
      const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_SetupMediaStateCopyWith<_$_SetupMediaState> get copyWith =>
      __$$_SetupMediaStateCopyWithImpl<_$_SetupMediaState>(this, _$identity);
}

abstract class _SetupMediaState implements SetupMediaState {
  const factory _SetupMediaState(
      {required final bool isDownloading,
      required final double downloadProgress,
      final File? file}) = _$_SetupMediaState;

  @override
  bool get isDownloading;
  @override
  double get downloadProgress;
  @override
  File? get file;
  @override
  @JsonKey(ignore: true)
  _$$_SetupMediaStateCopyWith<_$_SetupMediaState> get copyWith =>
      throw _privateConstructorUsedError;
}
