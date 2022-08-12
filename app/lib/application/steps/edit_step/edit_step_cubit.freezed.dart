// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_step_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditStepState {
  StepInput get input => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<StepFailure, Step>> get stepFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditStepStateCopyWith<EditStepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStepStateCopyWith<$Res> {
  factory $EditStepStateCopyWith(
          EditStepState value, $Res Function(EditStepState) then) =
      _$EditStepStateCopyWithImpl<$Res>;
  $Res call(
      {StepInput input,
      double progress,
      bool isDirty,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Step>> stepFailureOrSuccessOption});

  $StepInputCopyWith<$Res> get input;
}

/// @nodoc
class _$EditStepStateCopyWithImpl<$Res>
    implements $EditStepStateCopyWith<$Res> {
  _$EditStepStateCopyWithImpl(this._value, this._then);

  final EditStepState _value;
  // ignore: unused_field
  final $Res Function(EditStepState) _then;

  @override
  $Res call({
    Object? input = freezed,
    Object? progress = freezed,
    Object? isDirty = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as StepInput,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      isDirty: isDirty == freezed
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as Option<Either<StepFailure, Step>>,
    ));
  }

  @override
  $StepInputCopyWith<$Res> get input {
    return $StepInputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditStepStateCopyWith<$Res>
    implements $EditStepStateCopyWith<$Res> {
  factory _$$_EditStepStateCopyWith(
          _$_EditStepState value, $Res Function(_$_EditStepState) then) =
      __$$_EditStepStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {StepInput input,
      double progress,
      bool isDirty,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Step>> stepFailureOrSuccessOption});

  @override
  $StepInputCopyWith<$Res> get input;
}

/// @nodoc
class __$$_EditStepStateCopyWithImpl<$Res>
    extends _$EditStepStateCopyWithImpl<$Res>
    implements _$$_EditStepStateCopyWith<$Res> {
  __$$_EditStepStateCopyWithImpl(
      _$_EditStepState _value, $Res Function(_$_EditStepState) _then)
      : super(_value, (v) => _then(v as _$_EditStepState));

  @override
  _$_EditStepState get _value => super._value as _$_EditStepState;

  @override
  $Res call({
    Object? input = freezed,
    Object? progress = freezed,
    Object? isDirty = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_EditStepState(
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as StepInput,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      isDirty: isDirty == freezed
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as Option<Either<StepFailure, Step>>,
    ));
  }
}

/// @nodoc

class _$_EditStepState implements _EditStepState {
  const _$_EditStepState(
      {required this.input,
      required this.progress,
      required this.isDirty,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.stepFailureOrSuccessOption});

  @override
  final StepInput input;
  @override
  final double progress;
  @override
  final bool isDirty;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<StepFailure, Step>> stepFailureOrSuccessOption;

  @override
  String toString() {
    return 'EditStepState(input: $input, progress: $progress, isDirty: $isDirty, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, stepFailureOrSuccessOption: $stepFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditStepState &&
            const DeepCollectionEquality().equals(other.input, input) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.isDirty, isDirty) &&
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
      const DeepCollectionEquality().hash(input),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(isDirty),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(stepFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_EditStepStateCopyWith<_$_EditStepState> get copyWith =>
      __$$_EditStepStateCopyWithImpl<_$_EditStepState>(this, _$identity);
}

abstract class _EditStepState implements EditStepState {
  const factory _EditStepState(
      {required final StepInput input,
      required final double progress,
      required final bool isDirty,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<StepFailure, Step>>
          stepFailureOrSuccessOption}) = _$_EditStepState;

  @override
  StepInput get input;
  @override
  double get progress;
  @override
  bool get isDirty;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<StepFailure, Step>> get stepFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_EditStepStateCopyWith<_$_EditStepState> get copyWith =>
      throw _privateConstructorUsedError;
}
