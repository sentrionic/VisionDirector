// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_steps_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateStepsState {
  List<StepInput> get steps => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateStepsStateCopyWith<CreateStepsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStepsStateCopyWith<$Res> {
  factory $CreateStepsStateCopyWith(
          CreateStepsState value, $Res Function(CreateStepsState) then) =
      _$CreateStepsStateCopyWithImpl<$Res>;
  $Res call(
      {List<StepInput> steps,
      int page,
      double progress,
      bool showErrorMessages,
      bool isSubmitting,
      bool isDownloading,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});
}

/// @nodoc
class _$CreateStepsStateCopyWithImpl<$Res>
    implements $CreateStepsStateCopyWith<$Res> {
  _$CreateStepsStateCopyWithImpl(this._value, this._then);

  final CreateStepsState _value;
  // ignore: unused_field
  final $Res Function(CreateStepsState) _then;

  @override
  $Res call({
    Object? steps = freezed,
    Object? page = freezed,
    Object? progress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isDownloading = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInput>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
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
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      stepFailureOrSuccessOption: stepFailureOrSuccessOption == freezed
          ? _value.stepFailureOrSuccessOption
          : stepFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<StepFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateStepStateCopyWith<$Res>
    implements $CreateStepsStateCopyWith<$Res> {
  factory _$$_CreateStepStateCopyWith(
          _$_CreateStepState value, $Res Function(_$_CreateStepState) then) =
      __$$_CreateStepStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<StepInput> steps,
      int page,
      double progress,
      bool showErrorMessages,
      bool isSubmitting,
      bool isDownloading,
      Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption});
}

/// @nodoc
class __$$_CreateStepStateCopyWithImpl<$Res>
    extends _$CreateStepsStateCopyWithImpl<$Res>
    implements _$$_CreateStepStateCopyWith<$Res> {
  __$$_CreateStepStateCopyWithImpl(
      _$_CreateStepState _value, $Res Function(_$_CreateStepState) _then)
      : super(_value, (v) => _then(v as _$_CreateStepState));

  @override
  _$_CreateStepState get _value => super._value as _$_CreateStepState;

  @override
  $Res call({
    Object? steps = freezed,
    Object? page = freezed,
    Object? progress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isDownloading = freezed,
    Object? stepFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateStepState(
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInput>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
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
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
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
      {required final List<StepInput> steps,
      required this.page,
      required this.progress,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.isDownloading,
      required this.stepFailureOrSuccessOption})
      : _steps = steps;

  final List<StepInput> _steps;
  @override
  List<StepInput> get steps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final int page;
  @override
  final double progress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool isDownloading;
  @override
  final Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateStepsState(steps: $steps, page: $page, progress: $progress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isDownloading: $isDownloading, stepFailureOrSuccessOption: $stepFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateStepState &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isDownloading, isDownloading) &&
            const DeepCollectionEquality().equals(
                other.stepFailureOrSuccessOption, stepFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isDownloading),
      const DeepCollectionEquality().hash(stepFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateStepStateCopyWith<_$_CreateStepState> get copyWith =>
      __$$_CreateStepStateCopyWithImpl<_$_CreateStepState>(this, _$identity);
}

abstract class _CreateStepState implements CreateStepsState {
  const factory _CreateStepState(
      {required final List<StepInput> steps,
      required final int page,
      required final double progress,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final bool isDownloading,
      required final Option<Either<StepFailure, Unit>>
          stepFailureOrSuccessOption}) = _$_CreateStepState;

  @override
  List<StepInput> get steps;
  @override
  int get page;
  @override
  double get progress;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  bool get isDownloading;
  @override
  Option<Either<StepFailure, Unit>> get stepFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateStepStateCopyWith<_$_CreateStepState> get copyWith =>
      throw _privateConstructorUsedError;
}
