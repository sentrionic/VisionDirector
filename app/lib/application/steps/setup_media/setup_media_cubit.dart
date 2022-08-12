import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';

part 'setup_media_cubit.freezed.dart';

part 'setup_media_state.dart';

/// [SetupMediaCubit] downloads the network file if it doesn't already exist on
/// the phone.
@injectable
class SetupMediaCubit extends Cubit<SetupMediaState> {
  final IStepRepository _repository;

  SetupMediaCubit(this._repository) : super(SetupMediaState.initial());

  /// Checks if the file already exists on the phone and downloads it if it does not.
  ///
  /// * [path] The file path.
  /// * [fileName] The name of the file.
  Future<void> setupMedia(String path, String? fileName) async {
    // path is a url
    if (isURL(path)) {
      await getApplicationDocumentsDirectory().then((appDir) async {
        final mediaDirectory = "${appDir.path}/${AppConstants.mediaDirectory}";

        // File does not exist on the phone yet, so download it
        if (!File('$mediaDirectory/$fileName').existsSync()) {
          emit(state.copyWith(isDownloading: true));
          final file =
              await File('$mediaDirectory/$fileName').create(recursive: true);
          await _repository.downloadMedia(
            path,
            file.path,
            (sent, total) =>
                emit(state.copyWith(downloadProgress: sent / total * 100)),
          );
          emit(
            state.copyWith(
              isDownloading: false,
              file: file,
            ),
          );
        } else {
          // File already exists on the phone
          emit(
            state.copyWith(
              file: File('$mediaDirectory/$fileName'),
            ),
          );
        }
      });
    } else {
      // Race Condition, so delay a little
      await Future<void>.delayed(const Duration(milliseconds: 50));
      emit(
        state.copyWith(
          file: File(path),
        ),
      );
    }
  }
}
