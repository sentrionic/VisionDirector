import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';
import 'package:vision_director/domain/scenarios/value_objects.dart';

part 'upload_video_state.dart';
part 'upload_video_cubit.freezed.dart';

/// [UploadVideoCubit] handles the upload of the finished vision video.
@injectable
class UploadVideoCubit extends Cubit<UploadVideoState> {
  final IScenarioRepository _repository;
  UploadVideoCubit(this._repository) : super(UploadVideoState.initial());

  /// Uploads the given [video] for the given [scenarioId].
  ///
  /// Emits the url of the uploaded file if successful, [ScenarioFailure] otherwise.
  Future<void> uploadVideo(String scenarioId, File video) async {
    Either<ScenarioFailure, String>? failureOrSuccess;

    final file = ScenarioVideo(video);

    if (file.isValid()) {
      emit(
        state.copyWith(
          isSubmitting: true,
          scenarioFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.uploadVideo(
        scenarioId,
        video.path,
        (sent, total) => emit(state.copyWith(progress: sent / total * 100)),
      );
    } else {
      failureOrSuccess = left(const ScenarioFailure.fileTooLarge());
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        scenarioFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
