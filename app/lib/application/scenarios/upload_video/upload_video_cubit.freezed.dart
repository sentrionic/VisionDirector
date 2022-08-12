// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upload_video_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadVideoState {
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ScenarioFailure, String>> get scenarioFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadVideoStateCopyWith<UploadVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadVideoStateCopyWith<$Res> {
  factory $UploadVideoStateCopyWith(
          UploadVideoState value, $Res Function(UploadVideoState) then) =
      _$UploadVideoStateCopyWithImpl<$Res>;
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, String>> scenarioFailureOrSuccessOption,
      double progress});
}

/// @nodoc
class _$UploadVideoStateCopyWithImpl<$Res>
    implements $UploadVideoStateCopyWith<$Res> {
  _$UploadVideoStateCopyWithImpl(this._value, this._then);

  final UploadVideoState _value;
  // ignore: unused_field
  final $Res Function(UploadVideoState) _then;

  @override
  $Res call({
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      scenarioFailureOrSuccessOption: scenarioFailureOrSuccessOption == freezed
          ? _value.scenarioFailureOrSuccessOption
          : scenarioFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ScenarioFailure, String>>,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_UploadVideoStateCopyWith<$Res>
    implements $UploadVideoStateCopyWith<$Res> {
  factory _$$_UploadVideoStateCopyWith(
          _$_UploadVideoState value, $Res Function(_$_UploadVideoState) then) =
      __$$_UploadVideoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, String>> scenarioFailureOrSuccessOption,
      double progress});
}

/// @nodoc
class __$$_UploadVideoStateCopyWithImpl<$Res>
    extends _$UploadVideoStateCopyWithImpl<$Res>
    implements _$$_UploadVideoStateCopyWith<$Res> {
  __$$_UploadVideoStateCopyWithImpl(
      _$_UploadVideoState _value, $Res Function(_$_UploadVideoState) _then)
      : super(_value, (v) => _then(v as _$_UploadVideoState));

  @override
  _$_UploadVideoState get _value => super._value as _$_UploadVideoState;

  @override
  $Res call({
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$_UploadVideoState(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      scenarioFailureOrSuccessOption: scenarioFailureOrSuccessOption == freezed
          ? _value.scenarioFailureOrSuccessOption
          : scenarioFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ScenarioFailure, String>>,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UploadVideoState implements _UploadVideoState {
  const _$_UploadVideoState(
      {required this.showErrorMessages,
      required this.isSubmitting,
      required this.scenarioFailureOrSuccessOption,
      required this.progress});

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ScenarioFailure, String>> scenarioFailureOrSuccessOption;
  @override
  final double progress;

  @override
  String toString() {
    return 'UploadVideoState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, scenarioFailureOrSuccessOption: $scenarioFailureOrSuccessOption, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadVideoState &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.scenarioFailureOrSuccessOption,
                scenarioFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other.progress, progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(scenarioFailureOrSuccessOption),
      const DeepCollectionEquality().hash(progress));

  @JsonKey(ignore: true)
  @override
  _$$_UploadVideoStateCopyWith<_$_UploadVideoState> get copyWith =>
      __$$_UploadVideoStateCopyWithImpl<_$_UploadVideoState>(this, _$identity);
}

abstract class _UploadVideoState implements UploadVideoState {
  const factory _UploadVideoState(
      {required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ScenarioFailure, String>>
          scenarioFailureOrSuccessOption,
      required final double progress}) = _$_UploadVideoState;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ScenarioFailure, String>> get scenarioFailureOrSuccessOption;
  @override
  double get progress;
  @override
  @JsonKey(ignore: true)
  _$$_UploadVideoStateCopyWith<_$_UploadVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
