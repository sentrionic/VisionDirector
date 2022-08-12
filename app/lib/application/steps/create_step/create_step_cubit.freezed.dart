// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_step_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateStepState {
  StepInput get step => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateStepStateCopyWith<CreateStepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStepStateCopyWith<$Res> {
  factory $CreateStepStateCopyWith(
          CreateStepState value, $Res Function(CreateStepState) then) =
      _$CreateStepStateCopyWithImpl<$Res>;
  $Res call(
      {StepInput step,
      double progress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});

  $StepInputCopyWith<$Res> get step;
}

/// @nodoc
class _$CreateStepStateCopyWithImpl<$Res>
    implements $CreateStepStateCopyWith<$Res> {
  _$CreateStepStateCopyWithImpl(this._value, this._then);

  final CreateStepState _value;
  // ignore: unused_field
  final $Res Function(CreateStepState) _then;

  @override
  $Res call({
    Object? step = freezed,
    Object? progress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as StepInput,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      stepFailureOrSuccessOption: stepFailureOrSuccessOption == freezed
          ? _value.stepFailureOrSuccessOption
          : stepFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<StepFailure, Unit>>,
    ));
  }

  @override
  $StepInputCopyWith<$Res> get step {
    return $StepInputCopyWith<$Res>(_value.step, (value) {
      return _then(_value.copyWith(step: value));
    });
  }
}

/// @nodoc
abstract class _$$_CreateStepStateCopyWith<$Res>
    implements $CreateStepStateCopyWith<$Res> {
  factory _$$_CreateStepStateCopyWith(
          _$_CreateStepState value, $Res Function(_$_CreateStepState) then) =
      __$$_CreateStepStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StepInput step,
      double progress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});

  @override
  $StepInputCopyWith<$Res> get step;
}

/// @nodoc
class __$$_CreateStepStateCopyWithImpl<$Res>
    extends _$CreateStepStateCopyWithImpl<$Res>
    implements _$$_CreateStepStateCopyWith<$Res> {
  __$$_CreateStepStateCopyWithImpl(
      _$_CreateStepState _value, $Res Function(_$_CreateStepState) _then)
      : super(_value, (v) => _then(v as _$_CreateStepState));

  @override
  _$_CreateStepState get _value => super._value as _$_CreateStepState;

  @override
  $Res call({
    Object? step = freezed,
    Object? progress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateStepState(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as StepInput,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      stepFailureOrSuccessOption: stepFailureOrSuccessOption == freezed
          ? _value.stepFailureOrSuccessOption
          : stepFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<StepFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CreateStepState implements _CreateStepState {
  const _$_CreateStepState(
      {required this.step,
      required this.progress,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.stepFailureOrSuccessOption});

  @override
  final StepInput step;
  @override
  final double progress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateStepState(step: $step, progress: $progress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, stepFailureOrSuccessOption: $stepFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateStepState &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.stepFailureOrSuccessOption, stepFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(stepFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateStepStateCopyWith<_$_CreateStepState> get copyWith =>
      __$$_CreateStepStateCopyWithImpl<_$_CreateStepState>(this, _$identity);
}

abstract class _CreateStepState implements CreateStepState {
  const factory _CreateStepState(
      {required final StepInput step,
      required final double progress,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<StepFailure, Unit>>
          stepFailureOrSuccessOption}) = _$_CreateStepState;

  @override
  StepInput get step;
  @override
  double get progress;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateStepStateCopyWith<_$_CreateStepState> get copyWith =>
      throw _privateConstructorUsedError;
}
