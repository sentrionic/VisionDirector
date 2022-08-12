import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/domain/core/constants.dart';

part 'record_audio_state.dart';
part 'record_audio_cubit.freezed.dart';

/// [RecordAudioCubit] handles the recording of a new audio file.
@injectable
class RecordAudioCubit extends Cubit<RecordAudioState> {
  RecordAudioCubit() : super(RecordAudioState.initial());

  /// Initializes the file the new recording will be saved into.
  void initialize() {
    getApplicationDocumentsDirectory().then((directory) {
      final mediaDirectory = "${directory.path}/${AppConstants.mediaDirectory}";
      emit(
        state.copyWith(
          file: File('$mediaDirectory/audio_recording.aac'),
        ),
      );
    });
  }

  /// Sets the [isRecording] value and emits it.
  void setIsRecording({required bool isRecording}) =>
      emit(state.copyWith(isRecording: isRecording));

  /// Sets the [isPlaying] value and emits it.
  void setIsPlaying({required bool isPlaying}) =>
      emit(state.copyWith(isPlaying: isPlaying));

  /// Sets the [newRecording] value and emits it.
  void setNewRecording({required bool newRecording}) =>
      emit(state.copyWith(newRecording: newRecording));
}
