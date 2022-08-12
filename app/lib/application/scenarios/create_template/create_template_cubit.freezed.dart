// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_template_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateTemplateState {
  TemplateName get name => throw _privateConstructorUsedError;
  TemplateDescription get description => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ScenarioFailure, Unit>> get scenarioFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTemplateStateCopyWith<CreateTemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTemplateStateCopyWith<$Res> {
  factory $CreateTemplateStateCopyWith(
          CreateTemplateState value, $Res Function(CreateTemplateState) then) =
      _$CreateTemplateStateCopyWithImpl<$Res>;
  $Res call(
      {TemplateName name,
      TemplateDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption});
}

/// @nodoc
class _$CreateTemplateStateCopyWithImpl<$Res>
    implements $CreateTemplateStateCopyWith<$Res> {
  _$CreateTemplateStateCopyWithImpl(this._value, this._then);

  final CreateTemplateState _value;
  // ignore: unused_field
  final $Res Function(CreateTemplateState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateDescription,
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
abstract class _$$_CreateTemplateStateCopyWith<$Res>
    implements $CreateTemplateStateCopyWith<$Res> {
  factory _$$_CreateTemplateStateCopyWith(_$_CreateTemplateState value,
          $Res Function(_$_CreateTemplateState) then) =
      __$$_CreateTemplateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TemplateName name,
      TemplateDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption});
}

/// @nodoc
class __$$_CreateTemplateStateCopyWithImpl<$Res>
    extends _$CreateTemplateStateCopyWithImpl<$Res>
    implements _$$_CreateTemplateStateCopyWith<$Res> {
  __$$_CreateTemplateStateCopyWithImpl(_$_CreateTemplateState _value,
      $Res Function(_$_CreateTemplateState) _then)
      : super(_value, (v) => _then(v as _$_CreateTemplateState));

  @override
  _$_CreateTemplateState get _value => super._value as _$_CreateTemplateState;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? scenarioFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateTemplateState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TemplateName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TemplateDescription,
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

class _$_CreateTemplateState implements _CreateTemplateState {
  const _$_CreateTemplateState(
      {required this.name,
      required this.description,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.scenarioFailureOrSuccessOption});

  @override
  final TemplateName name;
  @override
  final TemplateDescription description;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ScenarioFailure, Unit>> scenarioFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateTemplateState(name: $name, description: $description, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, scenarioFailureOrSuccessOption: $scenarioFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTemplateState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
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
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(scenarioFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateTemplateStateCopyWith<_$_CreateTemplateState> get copyWith =>
      __$$_CreateTemplateStateCopyWithImpl<_$_CreateTemplateState>(
          this, _$identity);
}

abstract class _CreateTemplateState implements CreateTemplateState {
  const factory _CreateTemplateState(
      {required final TemplateName name,
      required final TemplateDescription description,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ScenarioFailure, Unit>>
          scenarioFailureOrSuccessOption}) = _$_CreateTemplateState;

  @override
  TemplateName get name;
  @override
  TemplateDescription get description;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ScenarioFailure, Unit>> get scenarioFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTemplateStateCopyWith<_$_CreateTemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}
