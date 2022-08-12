// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_comment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateCommentState {
  CommentBody get body => throw _privateConstructorUsedError;
  bool get showPreview => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<TaskFailure, Unit>> get commentFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCommentStateCopyWith<CreateCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCommentStateCopyWith<$Res> {
  factory $CreateCommentStateCopyWith(
          CreateCommentState value, $Res Function(CreateCommentState) then) =
      _$CreateCommentStateCopyWithImpl<$Res>;
  $Res call(
      {CommentBody body,
      bool showPreview,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Unit>> commentFailureOrSuccessOption});
}

/// @nodoc
class _$CreateCommentStateCopyWithImpl<$Res>
    implements $CreateCommentStateCopyWith<$Res> {
  _$CreateCommentStateCopyWithImpl(this._value, this._then);

  final CreateCommentState _value;
  // ignore: unused_field
  final $Res Function(CreateCommentState) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? showPreview = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? commentFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CommentBody,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      commentFailureOrSuccessOption: commentFailureOrSuccessOption == freezed
          ? _value.commentFailureOrSuccessOption
          : commentFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TaskFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateCommentStateCopyWith<$Res>
    implements $CreateCommentStateCopyWith<$Res> {
  factory _$$_CreateCommentStateCopyWith(_$_CreateCommentState value,
          $Res Function(_$_CreateCommentState) then) =
      __$$_CreateCommentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CommentBody body,
      bool showPreview,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<TaskFailure, Unit>> commentFailureOrSuccessOption});
}

/// @nodoc
class __$$_CreateCommentStateCopyWithImpl<$Res>
    extends _$CreateCommentStateCopyWithImpl<$Res>
    implements _$$_CreateCommentStateCopyWith<$Res> {
  __$$_CreateCommentStateCopyWithImpl(
      _$_CreateCommentState _value, $Res Function(_$_CreateCommentState) _then)
      : super(_value, (v) => _then(v as _$_CreateCommentState));

  @override
  _$_CreateCommentState get _value => super._value as _$_CreateCommentState;

  @override
  $Res call({
    Object? body = freezed,
    Object? showPreview = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? commentFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CreateCommentState(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CommentBody,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      commentFailureOrSuccessOption: commentFailureOrSuccessOption == freezed
          ? _value.commentFailureOrSuccessOption
          : commentFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TaskFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CreateCommentState implements _CreateCommentState {
  const _$_CreateCommentState(
      {required this.body,
      required this.showPreview,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.commentFailureOrSuccessOption});

  @override
  final CommentBody body;
  @override
  final bool showPreview;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<TaskFailure, Unit>> commentFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateCommentState(body: $body, showPreview: $showPreview, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, commentFailureOrSuccessOption: $commentFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCommentState &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.showPreview, showPreview) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.commentFailureOrSuccessOption,
                commentFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(showPreview),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(commentFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CreateCommentStateCopyWith<_$_CreateCommentState> get copyWith =>
      __$$_CreateCommentStateCopyWithImpl<_$_CreateCommentState>(
          this, _$identity);
}

abstract class _CreateCommentState implements CreateCommentState {
  const factory _CreateCommentState(
      {required final CommentBody body,
      required final bool showPreview,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<TaskFailure, Unit>>
          commentFailureOrSuccessOption}) = _$_CreateCommentState;

  @override
  CommentBody get body;
  @override
  bool get showPreview;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<TaskFailure, Unit>> get commentFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCommentStateCopyWith<_$_CreateCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
