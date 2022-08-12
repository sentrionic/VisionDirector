part of 'trim_video_cubit.dart';

/// * [trimmer] is an instance of the [Trimmer].
/// * [startValue] is the newly selected video start time in ms.
/// * [endValue] is the newly selected video end time in ms.
/// * [isPlaying] is `true` if the editor is playing the preview video.
/// * [isTrimming] is `true` if the trimmer is currently trimming.
/// * [videoUrl] is the path to the trimmed video.
@freezed
class TrimVideoState with _$TrimVideoState {
  const factory TrimVideoState({
    required Trimmer trimmer,
    required double startValue,
    required double endValue,
    required bool isPlaying,
    required bool isTrimming,
    String? videoUrl,
  }) = _TrimVideoState;

  factory TrimVideoState.initial() => TrimVideoState(
        trimmer: Trimmer(),
        startValue: 0.0,
        endValue: 0.0,
        isPlaying: false,
        isTrimming: false,
      );
}
