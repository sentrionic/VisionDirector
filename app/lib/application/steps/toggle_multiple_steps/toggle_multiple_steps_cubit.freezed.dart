// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'toggle_multiple_steps_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToggleMultipleStepsState {
  List<ToggleStep> get steps => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToggleMultipleStepsStateCopyWith<ToggleMultipleStepsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleMultipleStepsStateCopyWith<$Res> {
  factory $ToggleMultipleStepsStateCopyWith(ToggleMultipleStepsState value,
          $Res Function(ToggleMultipleStepsState) then) =
      _$ToggleMultipleStepsStateCopyWithImpl<$Res>;
  $Res call(
      {List<ToggleStep> steps,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});
}

/// @nodoc
class _$ToggleMultipleStepsStateCopyWithImpl<$Res>
    implements $ToggleMultipleStepsStateCopyWith<$Res> {
  _$ToggleMultipleStepsStateCopyWithImpl(this._value, this._then);

  final ToggleMultipleStepsState _value;
  // ignore: unused_field
  final $Res Function(ToggleMultipleStepsState) _then;

  @override
  $Res call({
    Object? steps = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<ToggleStep>,
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
abstract class _$$_ToggleMultipleStepsStateCopyWith<$Res>
    implements $ToggleMultipleStepsStateCopyWith<$Res> {
  factory _$$_ToggleMultipleStepsStateCopyWith(
          _$_ToggleMultipleStepsState value,
          $Res Function(_$_ToggleMultipleStepsState) then) =
      __$$_ToggleMultipleStepsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ToggleStep> steps,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});
}

/// @nodoc
class __$$_ToggleMultipleStepsStateCopyWithImpl<$Res>
    extends _$ToggleMultipleStepsStateCopyWithImpl<$Res>
    implements _$$_ToggleMultipleStepsStateCopyWith<$Res> {
  __$$_ToggleMultipleStepsStateCopyWithImpl(_$_ToggleMultipleStepsState _value,
      $Res Function(_$_ToggleMultipleStepsState) _then)
      : super(_value, (v) => _then(v as _$_ToggleMultipleStepsState));

  @override
  _$_ToggleMultipleStepsState get _value =>
      super._value as _$_ToggleMultipleStepsState;

  @override
  $Res call({
    Object? steps = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_ToggleMultipleStepsState(
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<ToggleStep>,
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

class _$_ToggleMultipleStepsState implements _ToggleMultipleStepsState {
  const _$_ToggleMultipleStepsState(
      {required final List<ToggleStep> steps,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.stepFailureOrSuccessOption})
      : _steps = steps;

  final List<ToggleStep> _steps;
  @override
  List<ToggleStep> get steps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption;

  @override
  String toString() {
    return 'ToggleMultipleStepsState(steps: $steps, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, stepFailureOrSuccessOption: $stepFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleMultipleStepsState &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
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
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(stepFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_ToggleMultipleStepsStateCopyWith<_$_ToggleMultipleStepsState>
      get copyWith => __$$_ToggleMultipleStepsStateCopyWithImpl<
          _$_ToggleMultipleStepsState>(this, _$identity);
}

abstract class _ToggleMultipleStepsState implements ToggleMultipleStepsState {
  const factory _ToggleMultipleStepsState(
      {required final List<ToggleStep> steps,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<StepFailure, Unit>>
          stepFailureOrSuccessOption}) = _$_ToggleMultipleStepsState;

  @override
  List<ToggleStep> get steps;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ToggleMultipleStepsStateCopyWith<_$_ToggleMultipleStepsState>
      get copyWith => throw _privateConstructorUsedError;
}
