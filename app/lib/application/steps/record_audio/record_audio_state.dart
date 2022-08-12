part of 'record_audio_cubit.dart';

/// * [isRecording] `true` if recording is currently in progress.
/// * [isRecording] `true` if the player is currently playing.
/// * [newRecording] `true` a new recording exists.
/// * [file] is the new recorded file.
@freezed
class RecordAudioState with _$RecordAudioState {
  const factory RecordAudioState({
    required bool isRecording,
    required bool isPlaying,
    required bool newRecording,
    File? file,
  }) = _RecordAudioState;

  factory RecordAudioState.initial() => const RecordAudioState(
        isRecording: false,
        isPlaying: false,
        newRecording: false,
      );
}
