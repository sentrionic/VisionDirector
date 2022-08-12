import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

part 'setup_export_state.dart';
part 'setup_export_cubit.freezed.dart';

/// [SetupExportCubit] checks if the scenario's steps already exist in the cache
/// and downloads the files that do not exist yet.
@injectable
class SetupExportCubit extends Cubit<SetupExportState> {
  final IStepRepository _repository;
  SetupExportCubit(this._repository) : super(SetupExportState.initial());

  /// Downloads all the step media if it does not exist in the cache yet.
  Future<void> downloadMedia(List<Step> steps) async {
    emit(
      state.copyWith(
        totalCount: steps.length,
        isDownloading: true,
      ),
    );

    final appDirectory = await getApplicationDocumentsDirectory();
    final mediaDirectory =
        "${appDirectory.path}/${AppConstants.mediaDirectory}";

    for (final step in steps) {
      final media = step.media;
      final audio = step.audio;

      var input = StepInput.fromStep(step);

      if (media != null) {
        // Media already exists on the phone
        if (await File('$mediaDirectory/${media.fileName}').exists()) {
          // Replace the remote url with the local file
          input = input.copyWith(
            media: MediaInput(
              file: StepMedia(File('$mediaDirectory/${media.fileName}')),
              mimeType: media.mimeType,
            ),
          );
          // Media needs to be downloaded
        } else {
          final file = await File('$mediaDirectory/${media.fileName}')
              .create(recursive: true);
          await _repository.downloadMedia(
            media.fileUrl,
            file.path,
            (sent, total) =>
                emit(state.copyWith(downloadProgress: sent / total * 100)),
          );
          // Replace the remote url with the local file
          input = input.copyWith(
            media: MediaInput(
              file: StepMedia(file),
              mimeType: media.mimeType,
            ),
          );
        }
      }

      if (audio != null) {
        // Audio already exists on the phone
        if (File('$mediaDirectory/${audio.fileName}').existsSync()) {
          // Replace the remote url with the local file
          input = input.copyWith(
            audio: MediaInput(
              file: StepMedia(File('$mediaDirectory/${audio.fileName}')),
              mimeType: audio.mimeType,
            ),
          );
        } else {
          // Download the audio
          final file = await File('$mediaDirectory/${audio.fileName}')
              .create(recursive: true);
          await _repository.downloadMedia(
            audio.fileUrl,
            file.path,
            (sent, total) =>
                emit(state.copyWith(downloadProgress: sent / total * 100)),
          );
          // Replace the remote url with the local file
          input = input.copyWith(
            audio: MediaInput(
              file: StepMedia(file),
              mimeType: audio.mimeType,
            ),
          );
        }
      }

      // Increment the counter and add the local file to the state
      emit(
        state.copyWith(
          downloadCount: state.downloadCount + 1,
          steps: [...state.steps, input],
        ),
      );
    }

    emit(
      state.copyWith(
        isDownloading: false,
        isCompleted: true,
      ),
    );
  }
}
