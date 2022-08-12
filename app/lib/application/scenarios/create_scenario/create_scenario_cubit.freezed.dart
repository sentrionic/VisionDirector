// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_scenario_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateScenarioState {
  ScenarioName get name => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ScenarioFailure, Scenario>>
      get scenarioFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateScenarioStateCopyWith<CreateScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateScenarioStateCopyWith<$Res> {
  factory $CreateScenarioStateCopyWith(
          CreateScenarioState value, $Res Function(CreateScenarioState) then) =
      _$CreateScenarioStateCopyWithImpl<$Res>;
  $Res call(
      {ScenarioName name,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Scenario>>
          scenarioFailureOrSuccessOption});
}

/// @nodoc
class _$CreateScenarioStateCopyWithImpl<$Res>
    implements $CreateScenarioStateCopyWith<$Res> {
  _$CreateScenarioStateCopyWithImpl(this._value, this._then);

  final CreateScenarioState _value;
  // ignore: unused_field
  final $Res Function(CreateScenarioState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ScenarioName,
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
              as Option<Either<ScenarioFailure, Scenario>>,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateScenarioStateCopyWith<$Res>
    implements $CreateScenarioStateCopyWith<$Res> {
  factory _$$_CreateScenarioStateCopyWith(_$_CreateScenarioState value,
          $Res Function(_$_CreateScenarioState) then) =
      __$$_CreateScenarioStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScenarioName name,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Scenario>>
          scenarioFailureOrSuccessOption});
}

/// @nodoc
class __$$_CreateScenarioStateCopyWithImpl<$Res>
    extends _$CreateScenarioStateCopyWithImpl<$Res>
    implements _$$_CreateScenarioStateCopyWith<$Res> {
  __$$_CreateScenarioStateCopyWithImpl(_$_CreateScenarioState _value,
      $Res Function(_$_CreateScenarioState) _then)
      : super(_value, (v) => _then(v as _$_CreateScenarioState));

  @override
  _$_CreateScenarioState get _value => super._value as _$_CreateScenarioState;

  @override
  $Res call({
    Object? name = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateScenarioState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ScenarioName,
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
              as Option<Either<ScenarioFailure, Scenario>>,
    ));
  }
}

/// @nodoc

class _$_CreateScenarioState implements _CreateScenarioState {
  const _$_CreateScenarioState(
      {required this.name,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.scenarioFailureOrSuccessOption});

  @override
  final ScenarioName name;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ScenarioFailure, Scenario>>
      scenarioFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateScenarioState(name: $name, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, scenarioFailureOrSuccessOption: $scenarioFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateScenarioState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.scenarioFailureOrSuccessOption,
                scenarioFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(scenarioFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateScenarioStateCopyWith<_$_CreateScenarioState> get copyWith =>
      __$$_CreateScenarioStateCopyWithImpl<_$_CreateScenarioState>(
          this, _$identity);
}

abstract class _CreateScenarioState implements CreateScenarioState {
  const factory _CreateScenarioState(
      {required final ScenarioName name,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ScenarioFailure, Scenario>>
          scenarioFailureOrSuccessOption}) = _$_CreateScenarioState;

  @override
  ScenarioName get name;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ScenarioFailure, Scenario>> get scenarioFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateScenarioStateCopyWith<_$_CreateScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}
