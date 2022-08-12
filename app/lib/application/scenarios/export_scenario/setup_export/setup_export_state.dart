part of 'setup_export_cubit.dart';

/// * [downloadCount] is the amount of already downloaded media.
/// * [totalCount] is the total amount of steps.
/// * [isDownloading] `true` if there is currently a download in progress.
/// * [downloadProgress] the current download progress.
/// * [steps] are the scenario steps with local files.
/// * [isCompleted] `true` if all media and audio is downloaded.
@freezed
class SetupExportState with _$SetupExportState {
  const factory SetupExportState({
    required int downloadCount,
    required int totalCount,
    required bool isDownloading,
    required double downloadProgress,
    required List<StepInput> steps,
    required bool isCompleted,
  }) = _SetupExportState;

  factory SetupExportState.initial() => const SetupExportState(
        downloadCount: 0,
        totalCount: 0,
        isDownloading: false,
        downloadProgress: 0.0,
        steps: [],
        isCompleted: false,
      );
}
