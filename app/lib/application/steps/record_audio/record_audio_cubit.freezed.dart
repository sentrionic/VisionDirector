// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_audio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordAudioState {
  bool get isRecording => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get newRecording => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordAudioStateCopyWith<RecordAudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordAudioStateCopyWith<$Res> {
  factory $RecordAudioStateCopyWith(
          RecordAudioState value, $Res Function(RecordAudioState) then) =
      _$RecordAudioStateCopyWithImpl<$Res>;
  $Res call({bool isRecording, bool isPlaying, bool newRecording, File? file});
}

/// @nodoc
class _$RecordAudioStateCopyWithImpl<$Res>
    implements $RecordAudioStateCopyWith<$Res> {
  _$RecordAudioStateCopyWithImpl(this._value, this._then);

  final RecordAudioState _value;
  // ignore: unused_field
  final $Res Function(RecordAudioState) _then;

  @override
  $Res call({
    Object? isRecording = freezed,
    Object? isPlaying = freezed,
    Object? newRecording = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      isRecording: isRecording == freezed
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      newRecording: newRecording == freezed
          ? _value.newRecording
          : newRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordAudioStateCopyWith<$Res>
    implements $RecordAudioStateCopyWith<$Res> {
  factory _$$_RecordAudioStateCopyWith(
          _$_RecordAudioState value, $Res Function(_$_RecordAudioState) then) =
      __$$_RecordAudioStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isRecording, bool isPlaying, bool newRecording, File? file});
}

/// @nodoc
class __$$_RecordAudioStateCopyWithImpl<$Res>
    extends _$RecordAudioStateCopyWithImpl<$Res>
    implements _$$_RecordAudioStateCopyWith<$Res> {
  __$$_RecordAudioStateCopyWithImpl(
      _$_RecordAudioState _value, $Res Function(_$_RecordAudioState) _then)
      : super(_value, (v) => _then(v as _$_RecordAudioState));

  @override
  _$_RecordAudioState get _value => super._value as _$_RecordAudioState;

  @override
  $Res call({
    Object? isRecording = freezed,
    Object? isPlaying = freezed,
    Object? newRecording = freezed,
    Object? file = freezed,
  }) {
    return _then(_$_RecordAudioState(
      isRecording: isRecording == freezed
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      newRecording: newRecording == freezed
          ? _value.newRecording
          : newRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_RecordAudioState implements _RecordAudioState {
  const _$_RecordAudioState(
      {required this.isRecording,
      required this.isPlaying,
      required this.newRecording,
      this.file});

  @override
  final bool isRecording;
  @override
  final bool isPlaying;
  @override
  final bool newRecording;
  @override
  final File? file;

  @override
  String toString() {
    return 'RecordAudioState(isRecording: $isRecording, isPlaying: $isPlaying, newRecording: $newRecording, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordAudioState &&
            const DeepCollectionEquality()
                .equals(other.isRecording, isRecording) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            const DeepCollectionEquality()
                .equals(other.newRecording, newRecording) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isRecording),
      const DeepCollectionEquality().hash(isPlaying),
      const DeepCollectionEquality().hash(newRecording),
      const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_RecordAudioStateCopyWith<_$_RecordAudioState> get copyWith =>
      __$$_RecordAudioStateCopyWithImpl<_$_RecordAudioState>(this, _$identity);
}

abstract class _RecordAudioState implements RecordAudioState {
  const factory _RecordAudioState(
      {required final bool isRecording,
      required final bool isPlaying,
      required final bool newRecording,
      final File? file}) = _$_RecordAudioState;

  @override
  bool get isRecording;
  @override
  bool get isPlaying;
  @override
  bool get newRecording;
  @override
  File? get file;
  @override
  @JsonKey(ignore: true)
  _$$_RecordAudioStateCopyWith<_$_RecordAudioState> get copyWith =>
      throw _privateConstructorUsedError;
}
