import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

part 'media.freezed.dart';

/// [Media] represents the network file and its properties.
///
/// * [fileName] The name of the file.
/// * [fileUrl] The url of the file.
/// * [mimeType] The file's mimetype.
@freezed
class Media with _$Media {
  const Media._();

  const factory Media({
    required String fileName,
    required String fileUrl,
    required String mimeType,
  }) = _Media;
}

/// [MediaInput] represents the local file and its properties.
///
/// * [file] The type-safe file.
/// * [mimeType] The file's mimetype.
/// * [isPortrait] `true` if the height is bigger than the width.
@freezed
class MediaInput with _$MediaInput {
  const MediaInput._();

  const factory MediaInput({
    required StepMedia file,
    required String mimeType,
    bool? isPortrait,
  }) = _MediaInput;

  /// Validates if the file contains an error or if the media is in portrait mode.
  Option<ValueFailure<dynamic>> get failureOption {
    return file.failureOrUnit
        .andThen(
          (isPortrait ?? false)
              ? left(const ValueFailure.invalidAspectRatio(failedValue: true))
              : right(unit),
        )
        .fold((f) => some(f), (_) => none());
  }
}
