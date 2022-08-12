// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'join_project_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JoinProjectState {
  InviteLink get inviteLink => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ProjectFailure, Project>> get projectFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JoinProjectStateCopyWith<JoinProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinProjectStateCopyWith<$Res> {
  factory $JoinProjectStateCopyWith(
          JoinProjectState value, $Res Function(JoinProjectState) then) =
      _$JoinProjectStateCopyWithImpl<$Res>;
  $Res call(
      {InviteLink inviteLink,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ProjectFailure, Project>> projectFailureOrSuccessOption});
}

/// @nodoc
class _$JoinProjectStateCopyWithImpl<$Res>
    implements $JoinProjectStateCopyWith<$Res> {
  _$JoinProjectStateCopyWithImpl(this._value, this._then);

  final JoinProjectState _value;
  // ignore: unused_field
  final $Res Function(JoinProjectState) _then;

  @override
  $Res call({
    Object? inviteLink = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? projectFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      inviteLink: inviteLink == freezed
          ? _value.inviteLink
          : inviteLink // ignore: cast_nullable_to_non_nullable
              as InviteLink,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      projectFailureOrSuccessOption: projectFailureOrSuccessOption == freezed
          ? _value.projectFailureOrSuccessOption
          : projectFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProjectFailure, Project>>,
    ));
  }
}

/// @nodoc
abstract class _$$_JoinProjectStateCopyWith<$Res>
    implements $JoinProjectStateCopyWith<$Res> {
  factory _$$_JoinProjectStateCopyWith(
          _$_JoinProjectState value, $Res Function(_$_JoinProjectState) then) =
      __$$_JoinProjectStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {InviteLink inviteLink,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ProjectFailure, Project>> projectFailureOrSuccessOption});
}

/// @nodoc
class __$$_JoinProjectStateCopyWithImpl<$Res>
    extends _$JoinProjectStateCopyWithImpl<$Res>
    implements _$$_JoinProjectStateCopyWith<$Res> {
  __$$_JoinProjectStateCopyWithImpl(
      _$_JoinProjectState _value, $Res Function(_$_JoinProjectState) _then)
      : super(_value, (v) => _then(v as _$_JoinProjectState));

  @override
  _$_JoinProjectState get _value => super._value as _$_JoinProjectState;

  @override
  $Res call({
    Object? inviteLink = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? projectFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_JoinProjectState(
      inviteLink: inviteLink == freezed
          ? _value.inviteLink
          : inviteLink // ignore: cast_nullable_to_non_nullable
              as InviteLink,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      projectFailureOrSuccessOption: projectFailureOrSuccessOption == freezed
          ? _value.projectFailureOrSuccessOption
          : projectFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProjectFailure, Project>>,
    ));
  }
}

/// @nodoc

class _$_JoinProjectState implements _JoinProjectState {
  const _$_JoinProjectState(
      {required this.inviteLink,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.projectFailureOrSuccessOption});

  @override
  final InviteLink inviteLink;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ProjectFailure, Project>> projectFailureOrSuccessOption;

  @override
  String toString() {
    return 'JoinProjectState(inviteLink: $inviteLink, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, projectFailureOrSuccessOption: $projectFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinProjectState &&
            const DeepCollectionEquality()
                .equals(other.inviteLink, inviteLink) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.projectFailureOrSuccessOption,
                projectFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inviteLink),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(projectFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_JoinProjectStateCopyWith<_$_JoinProjectState> get copyWith =>
      __$$_JoinProjectStateCopyWithImpl<_$_JoinProjectState>(this, _$identity);
}

abstract class _JoinProjectState implements JoinProjectState {
  const factory _JoinProjectState(
      {required final InviteLink inviteLink,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ProjectFailure, Project>>
          projectFailureOrSuccessOption}) = _$_JoinProjectState;

  @override
  InviteLink get inviteLink;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ProjectFailure, Project>> get projectFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_JoinProjectStateCopyWith<_$_JoinProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
