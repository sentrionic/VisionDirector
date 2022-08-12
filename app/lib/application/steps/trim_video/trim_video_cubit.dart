import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/storage_dir.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/trimmer.dart';

part 'trim_video_state.dart';
part 'trim_video_cubit.freezed.dart';

/// [TrimVideoCubit] handles trimming a video.
@injectable
class TrimVideoCubit extends Cubit<TrimVideoState> {
  TrimVideoCubit() : super(TrimVideoState.initial());

  /// Loads the video into the state's trimmer.
  void initVideo(File video) => state.trimmer.loadVideo(videoFile: video);

  /// Emits the new video start value in ms.
  void changeStartValue(double startValue) =>
      emit(state.copyWith(startValue: startValue));

  /// Emits the new video end value in ms.
  void changeEndValue(double endValue) =>
      emit(state.copyWith(endValue: endValue));

  /// Toggles and emits the new [isPlaying] value.
  void togglePlaying({required bool isPlaying}) =>
      emit(state.copyWith(isPlaying: isPlaying));

  /// Trims the video with the values stored in the state.
  ///
  /// Emits the path of the trimmed video.
  void trimVideo() {
    emit(state.copyWith(isTrimming: true));
    state.trimmer.saveTrimmedVideo(
      startValue: state.startValue,
      endValue: state.endValue,
      storageDir: StorageDir.temporaryDirectory,
      onSave: (outputPath) {
        emit(state.copyWith(isTrimming: false, videoUrl: outputPath));
      },
    );
  }
}
