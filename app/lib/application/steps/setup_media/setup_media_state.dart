part of 'setup_media_cubit.dart';

/// * [isDownloading] `true` if media is currently being downloaded.
/// * [downloadProgress] is the current download progress.
@freezed
class SetupMediaState with _$SetupMediaState {
  const factory SetupMediaState({
    required bool isDownloading,
    required double downloadProgress,
    File? file,
  }) = _SetupMediaState;

  factory SetupMediaState.initial() => const SetupMediaState(
        isDownloading: false,
        downloadProgress: 0.0,
      );
}
