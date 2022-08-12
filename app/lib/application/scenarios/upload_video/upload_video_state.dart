part of 'upload_video_cubit.dart';

/// * [showErrorMessages] `true` if it should display the error.
/// * [isSubmitting] `true` if a video is currently being uploaded.
/// * [scenarioFailureOrSuccessOption] either the failure or the url of the uploaded video.
/// * [progress] the current upload progress.
@freezed
class UploadVideoState with _$UploadVideoState {
  const factory UploadVideoState({
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ScenarioFailure, String>>
        scenarioFailureOrSuccessOption,
    required double progress,
  }) = _UploadVideoState;

  factory UploadVideoState.initial() => UploadVideoState(
        showErrorMessages: false,
        isSubmitting: false,
        scenarioFailureOrSuccessOption: none(),
        progress: 0.0,
      );
}
