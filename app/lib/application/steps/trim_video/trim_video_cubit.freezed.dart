// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trim_video_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrimVideoState {
  Trimmer get trimmer => throw _privateConstructorUsedError;
  double get startValue => throw _privateConstructorUsedError;
  double get endValue => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isTrimming => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrimVideoStateCopyWith<TrimVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrimVideoStateCopyWith<$Res> {
  factory $TrimVideoStateCopyWith(
          TrimVideoState value, $Res Function(TrimVideoState) then) =
      _$TrimVideoStateCopyWithImpl<$Res>;
  $Res call(
      {Trimmer trimmer,
      double startValue,
      double endValue,
      bool isPlaying,
      bool isTrimming,
      String? videoUrl});
}

/// @nodoc
class _$TrimVideoStateCopyWithImpl<$Res>
    implements $TrimVideoStateCopyWith<$Res> {
  _$TrimVideoStateCopyWithImpl(this._value, this._then);

  final TrimVideoState _value;
  // ignore: unused_field
  final $Res Function(TrimVideoState) _then;

  @override
  $Res call({
    Object? trimmer = freezed,
    Object? startValue = freezed,
    Object? endValue = freezed,
    Object? isPlaying = freezed,
    Object? isTrimming = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      trimmer: trimmer == freezed
          ? _value.trimmer
          : trimmer // ignore: cast_nullable_to_non_nullable
              as Trimmer,
      startValue: startValue == freezed
          ? _value.startValue
          : startValue // ignore: cast_nullable_to_non_nullable
              as double,
      endValue: endValue == freezed
          ? _value.endValue
          : endValue // ignore: cast_nullable_to_non_nullable
              as double,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrimming: isTrimming == freezed
          ? _value.isTrimming
          : isTrimming // ignore: cast_nullable_to_non_nullable
              as bool,
      videoUrl: videoUrl == freezed
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TrimVideoStateCopyWith<$Res>
    implements $TrimVideoStateCopyWith<$Res> {
  factory _$$_TrimVideoStateCopyWith(
          _$_TrimVideoState value, $Res Function(_$_TrimVideoState) then) =
      __$$_TrimVideoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Trimmer trimmer,
      double startValue,
      double endValue,
      bool isPlaying,
      bool isTrimming,
      String? videoUrl});
}

/// @nodoc
class __$$_TrimVideoStateCopyWithImpl<$Res>
    extends _$TrimVideoStateCopyWithImpl<$Res>
    implements _$$_TrimVideoStateCopyWith<$Res> {
  __$$_TrimVideoStateCopyWithImpl(
      _$_TrimVideoState _value, $Res Function(_$_TrimVideoState) _then)
      : super(_value, (v) => _then(v as _$_TrimVideoState));

  @override
  _$_TrimVideoState get _value => super._value as _$_TrimVideoState;

  @override
  $Res call({
    Object? trimmer = freezed,
    Object? startValue = freezed,
    Object? endValue = freezed,
    Object? isPlaying = freezed,
    Object? isTrimming = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_$_TrimVideoState(
      trimmer: trimmer == freezed
          ? _value.trimmer
          : trimmer // ignore: cast_nullable_to_non_nullable
              as Trimmer,
      startValue: startValue == freezed
          ? _value.startValue
          : startValue // ignore: cast_nullable_to_non_nullable
              as double,
      endValue: endValue == freezed
          ? _value.endValue
          : endValue // ignore: cast_nullable_to_non_nullable
              as double,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrimming: isTrimming == freezed
          ? _value.isTrimming
          : isTrimming // ignore: cast_nullable_to_non_nullable
              as bool,
      videoUrl: videoUrl == freezed
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TrimVideoState implements _TrimVideoState {
  const _$_TrimVideoState(
      {required this.trimmer,
      required this.startValue,
      required this.endValue,
      required this.isPlaying,
      required this.isTrimming,
      this.videoUrl});

  @override
  final Trimmer trimmer;
  @override
  final double startValue;
  @override
  final double endValue;
  @override
  final bool isPlaying;
  @override
  final bool isTrimming;
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'TrimVideoState(trimmer: $trimmer, startValue: $startValue, endValue: $endValue, isPlaying: $isPlaying, isTrimming: $isTrimming, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrimVideoState &&
            const DeepCollectionEquality().equals(other.trimmer, trimmer) &&
            const DeepCollectionEquality()
                .equals(other.startValue, startValue) &&
            const DeepCollectionEquality().equals(other.endValue, endValue) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            const DeepCollectionEquality()
                .equals(other.isTrimming, isTrimming) &&
            const DeepCollectionEquality().equals(other.videoUrl, videoUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(trimmer),
      const DeepCollectionEquality().hash(startValue),
      const DeepCollectionEquality().hash(endValue),
      const DeepCollectionEquality().hash(isPlaying),
      const DeepCollectionEquality().hash(isTrimming),
      const DeepCollectionEquality().hash(videoUrl));

  @JsonKey(ignore: true)
  @override
  _$$_TrimVideoStateCopyWith<_$_TrimVideoState> get copyWith =>
      __$$_TrimVideoStateCopyWithImpl<_$_TrimVideoState>(this, _$identity);
}

abstract class _TrimVideoState implements TrimVideoState {
  const factory _TrimVideoState(
      {required final Trimmer trimmer,
      required final double startValue,
      required final double endValue,
      required final bool isPlaying,
      required final bool isTrimming,
      final String? videoUrl}) = _$_TrimVideoState;

  @override
  Trimmer get trimmer;
  @override
  double get startValue;
  @override
  double get endValue;
  @override
  bool get isPlaying;
  @override
  bool get isTrimming;
  @override
  String? get videoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TrimVideoStateCopyWith<_$_TrimVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
