// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setup_export_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SetupExportState {
  int get downloadCount => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;
  double get downloadProgress => throw _privateConstructorUsedError;
  List<StepInput> get steps => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetupExportStateCopyWith<SetupExportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupExportStateCopyWith<$Res> {
  factory $SetupExportStateCopyWith(
          SetupExportState value, $Res Function(SetupExportState) then) =
      _$SetupExportStateCopyWithImpl<$Res>;
  $Res call(
      {int downloadCount,
      int totalCount,
      bool isDownloading,
      double downloadProgress,
      List<StepInput> steps,
      bool isCompleted});
}

/// @nodoc
class _$SetupExportStateCopyWithImpl<$Res>
    implements $SetupExportStateCopyWith<$Res> {
  _$SetupExportStateCopyWithImpl(this._value, this._then);

  final SetupExportState _value;
  // ignore: unused_field
  final $Res Function(SetupExportState) _then;

  @override
  $Res call({
    Object? downloadCount = freezed,
    Object? totalCount = freezed,
    Object? isDownloading = freezed,
    Object? downloadProgress = freezed,
    Object? steps = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      downloadCount: downloadCount == freezed
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: downloadProgress == freezed
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInput>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SetupExportStateCopyWith<$Res>
    implements $SetupExportStateCopyWith<$Res> {
  factory _$$_SetupExportStateCopyWith(
          _$_SetupExportState value, $Res Function(_$_SetupExportState) then) =
      __$$_SetupExportStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int downloadCount,
      int totalCount,
      bool isDownloading,
      double downloadProgress,
      List<StepInput> steps,
      bool isCompleted});
}

/// @nodoc
class __$$_SetupExportStateCopyWithImpl<$Res>
    extends _$SetupExportStateCopyWithImpl<$Res>
    implements _$$_SetupExportStateCopyWith<$Res> {
  __$$_SetupExportStateCopyWithImpl(
      _$_SetupExportState _value, $Res Function(_$_SetupExportState) _then)
      : super(_value, (v) => _then(v as _$_SetupExportState));

  @override
  _$_SetupExportState get _value => super._value as _$_SetupExportState;

  @override
  $Res call({
    Object? downloadCount = freezed,
    Object? totalCount = freezed,
    Object? isDownloading = freezed,
    Object? downloadProgress = freezed,
    Object? steps = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$_SetupExportState(
      downloadCount: downloadCount == freezed
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isDownloading: isDownloading == freezed
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: downloadProgress == freezed
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInput>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SetupExportState implements _SetupExportState {
  const _$_SetupExportState(
      {required this.downloadCount,
      required this.totalCount,
      required this.isDownloading,
      required this.downloadProgress,
      required final List<StepInput> steps,
      required this.isCompleted})
      : _steps = steps;

  @override
  final int downloadCount;
  @override
  final int totalCount;
  @override
  final bool isDownloading;
  @override
  final double downloadProgress;
  final List<StepInput> _steps;
  @override
  List<StepInput> get steps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'SetupExportState(downloadCount: $downloadCount, totalCount: $totalCount, isDownloading: $isDownloading, downloadProgress: $downloadProgress, steps: $steps, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetupExportState &&
            const DeepCollectionEquality()
                .equals(other.downloadCount, downloadCount) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount) &&
            const DeepCollectionEquality()
                .equals(other.isDownloading, isDownloading) &&
            const DeepCollectionEquality()
                .equals(other.downloadProgress, downloadProgress) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(downloadCount),
      const DeepCollectionEquality().hash(totalCount),
      const DeepCollectionEquality().hash(isDownloading),
      const DeepCollectionEquality().hash(downloadProgress),
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$$_SetupExportStateCopyWith<_$_SetupExportState> get copyWith =>
      __$$_SetupExportStateCopyWithImpl<_$_SetupExportState>(this, _$identity);
}

abstract class _SetupExportState implements SetupExportState {
  const factory _SetupExportState(
      {required final int downloadCount,
      required final int totalCount,
      required final bool isDownloading,
      required final double downloadProgress,
      required final List<StepInput> steps,
      required final bool isCompleted}) = _$_SetupExportState;

  @override
  int get downloadCount;
  @override
  int get totalCount;
  @override
  bool get isDownloading;
  @override
  double get downloadProgress;
  @override
  List<StepInput> get steps;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_SetupExportStateCopyWith<_$_SetupExportState> get copyWith =>
      throw _privateConstructorUsedError;
}
