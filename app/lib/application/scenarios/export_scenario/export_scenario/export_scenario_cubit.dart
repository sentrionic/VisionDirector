import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/ffmpeg_calls.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/common/export_status.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';

part 'export_scenario_cubit.freezed.dart';

part 'export_scenario_state.dart';

/// [ExportScenarioCubit] handles the creation of the final video.
@injectable
class ExportScenarioCubit extends Cubit<ExportScenarioState> {
  ExportScenarioCubit() : super(ExportScenarioState.initial());

  /// Initializes the process.
  Future<void> initialize() async {
    // Create a temporary directory containing all generated files that will
    // be deleted after the export.
    final appDir = await getApplicationDocumentsDirectory();
    final tempDir = Directory("${appDir.path}/videos");
    tempDir.createSync(recursive: true);

    emit(state.copyWith(tempDir: tempDir));
  }

  /// Toggles the [ExportScenarioState]'s [addName] value and emits it.
  void toggleAddNames() => emit(state.copyWith(addName: !state.addName));

  /// Sets the [ExportScenarioState]'s [resolution] value and emits it.
  void setExportResolution(ExportResolution resolution) =>
      emit(state.copyWith(resolution: resolution));

  /// Starts the process to create the video.
  ///
  /// Emits the current [ExportStatus] and the exported video.
  /// * [project] is the name of the [Project] used for the title.
  /// * [scenario] is the name of the [Scenario] used for the title.
  /// * [steps] are the scenario steps that will be converted.
  /// * [collaborators] is a list of [Collaborator] that worked on the project.
  Future<void> exportVideos(
    String project,
    String scenario,
    List<StepInput> steps,
    List<Collaborator> collaborators,
  ) async {
    emit(state.copyWith(totalCount: steps.length + 2));

    // 1. Turn all media into videos

    final titlePath = await generateTitle(
      project,
      scenario,
      state.tempDir!.path,
      state.resolution,
    );

    emit(state.copyWith(count: state.count + 1));

    // Turns steps into videos and add the text.
    for (final step in steps) {
      final media = step.media;

      // If no media, generate a placeholder video
      if (media == null) {
        final videoPath = await generatePlaceholder(
          state.tempDir!.path,
          step,
          state.resolution,
          addName: state.addName,
        );

        emit(
          state.copyWith(
            steps: [...state.steps, StepExport.fromInput(step, videoPath)],
          ),
        );
      } // If media is a video, apply padding if necessary
      else if (media.mimeType.contains("video")) {
        final videoPath = await transformVideo(
          step,
          state.tempDir!.path,
          state.resolution,
          addName: state.addName,
        );

        emit(
          state.copyWith(
            steps: [...state.steps, StepExport.fromInput(step, videoPath)],
          ),
        );
      }
      // If media is an image, turn it into a video
      else {
        final videoPath = await imageToVideo(
          media.file.getOrCrash(),
          state.tempDir!.path,
          step,
          state.resolution,
          addName: state.addName,
        );

        emit(
          state.copyWith(
            steps: [...state.steps, StepExport.fromInput(step, videoPath)],
          ),
        );
      }

      emit(state.copyWith(count: state.count + 1));
    }

    final creditsPath = await generateCredits(
      collaborators,
      state.tempDir!.path,
      state.resolution,
    );

    emit(state.copyWith(count: state.count + 1));

    // 2. Concat files

    emit(
      state.copyWith(
        count: 0,
        status: ExportStatus.concat,
      ),
    );

    // Concat input is of form "title.ts|video1.ts|...|credits.ts"
    final buffer = StringBuffer();

    // Add the title to the concat string
    buffer.write(await generateIntermediate(titlePath, state.tempDir!.path));

    // Add all the steps to the concat string
    for (final step in state.steps) {
      // If the step got audio, replace the original audio with the new one
      if (step.audioPath != null) {
        final mediaPath = await addAudioToVideo(
          step.mediaPath,
          step.audioPath!,
          state.tempDir!.path,
        );
        buffer.write(
          "|${await generateIntermediate(mediaPath, state.tempDir!.path)}",
        );
      } else {
        buffer.write(
          "|${await generateIntermediate(step.mediaPath, state.tempDir!.path)}",
        );
      }
    }

    // Add the credits to the concat string
    buffer.write(
      "|${await generateIntermediate(creditsPath, state.tempDir!.path)}",
    );

    // Concat all files
    final exportedVideo = await concatVideos(
      scenario,
      buffer.toString(),
      state.tempDir!.path,
    );

    emit(
      state.copyWith(
        isCompleted: true,
        status: ExportStatus.done,
        video: File(exportedVideo),
      ),
    );
  }

  /// Deletes the temporary directory used for the creation of the videos
  /// and the contents of the directory.
  Future<void> cleanup() async {
    // Wait for the initialization to finish
    await Future<void>.delayed(const Duration(milliseconds: 50));
    state.tempDir?.deleteSync(recursive: true);
  }
}
