// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_scenario_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditScenarioState {
  ScenarioName get name => throw _privateConstructorUsedError;
  ScenarioDescription? get description => throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ScenarioFailure, Unit>> get scenarioFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditScenarioStateCopyWith<EditScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditScenarioStateCopyWith<$Res> {
  factory $EditScenarioStateCopyWith(
          EditScenarioState value, $Res Function(EditScenarioState) then) =
      _$EditScenarioStateCopyWithImpl<$Res>;
  $Res call(
      {ScenarioName name,
      ScenarioDescription? description,
      Status? status,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption});
}

/// @nodoc
class _$EditScenarioStateCopyWithImpl<$Res>
    implements $EditScenarioStateCopyWith<$Res> {
  _$EditScenarioStateCopyWithImpl(this._value, this._then);

  final EditScenarioState _value;
  // ignore: unused_field
  final $Res Function(EditScenarioState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ScenarioName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ScenarioDescription?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
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
              as Option<Either<ScenarioFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_EditScenarioStateCopyWith<$Res>
    implements $EditScenarioStateCopyWith<$Res> {
  factory _$$_EditScenarioStateCopyWith(_$_EditScenarioState value,
          $Res Function(_$_EditScenarioState) then) =
      __$$_EditScenarioStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScenarioName name,
      ScenarioDescription? description,
      Status? status,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption});
}

/// @nodoc
class __$$_EditScenarioStateCopyWithImpl<$Res>
    extends _$EditScenarioStateCopyWithImpl<$Res>
    implements _$$_EditScenarioStateCopyWith<$Res> {
  __$$_EditScenarioStateCopyWithImpl(
      _$_EditScenarioState _value, $Res Function(_$_EditScenarioState) _then)
      : super(_value, (v) => _then(v as _$_EditScenarioState));

  @override
  _$_EditScenarioState get _value => super._value as _$_EditScenarioState;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_EditScenarioState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as ScenarioName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ScenarioDescription?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
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
              as Option<Either<ScenarioFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_EditScenarioState implements _EditScenarioState {
  const _$_EditScenarioState(
      {required this.name,
      this.description,
      this.status,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.scenarioFailureOrSuccessOption});

  @override
  final ScenarioName name;
  @override
  final ScenarioDescription? description;
  @override
  final Status? status;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption;

  @override
  String toString() {
    return 'EditScenarioState(name: $name, description: $description, status: $status, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, scenarioFailureOrSuccessOption: $scenarioFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditScenarioState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.status, status) &&
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
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(scenarioFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_EditScenarioStateCopyWith<_$_EditScenarioState> get copyWith =>
      __$$_EditScenarioStateCopyWithImpl<_$_EditScenarioState>(
          this, _$identity);
}

abstract class _EditScenarioState implements EditScenarioState {
  const factory _EditScenarioState(
      {required final ScenarioName name,
      final ScenarioDescription? description,
      final Status? status,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ScenarioFailure, Unit>>
          scenarioFailureOrSuccessOption}) = _$_EditScenarioState;

  @override
  ScenarioName get name;
  @override
  ScenarioDescription? get description;
  @override
  Status? get status;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ScenarioFailure, Unit>> get scenarioFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_EditScenarioStateCopyWith<_$_EditScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}
