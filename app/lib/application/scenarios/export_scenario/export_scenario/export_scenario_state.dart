part of 'export_scenario_cubit.dart';

/// * [count] the amount of steps already converted
/// * [totalCount] the total amount of steps to be converted
/// * [steps] are the steps containing the videos that will be concatenated.
/// * [status] is the current status of the export process.
/// * [isCompleted] `true` if the export is finished
/// * [video] The finished vision video.
/// * [tempDir] is the directory containing all temp files.
@freezed
class ExportScenarioState with _$ExportScenarioState {
  const factory ExportScenarioState({
    required int count,
    required int totalCount,
    required List<StepExport> steps,
    required ExportStatus status,
    required bool isCompleted,
    required bool addName,
    required ExportResolution resolution,
    File? video,
    Directory? tempDir,
  }) = _ExportScenarioState;

  factory ExportScenarioState.initial() => const ExportScenarioState(
        count: 0,
        // Minimum is 2 (Title, Credits). Prevents divide by 0 errors.
        totalCount: 2,
        steps: [],
        status: ExportStatus.generateVideos,
        isCompleted: false,
        addName: false,
        resolution: ExportResolution.hd,
      );
}
