import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vision_director/application/steps/record_audio/record_audio_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/hooks/sound_recorder_hook.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/hooks/video_controller_hook.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/widgets/audio_media_preview.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/widgets/audio_player_widget.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/widgets/audio_record_widget.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/widgets/timer_widget.dart';

class AddAudioDialog extends StatelessWidget {
  final Step step;
  final StepInput input;
  const AddAudioDialog({
    super.key,
    required this.step,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RecordAudioCubit>()..initialize(),
      child: _AddAudioForm(step: step, input: input),
    );
  }
}

class _AddAudioForm extends HookWidget {
  final Step step;
  final StepInput input;
  const _AddAudioForm({
    required this.step,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    final betterPlayerController = useVideoController(step, input);
    final recorder = useSoundRecorder();
    final timerController = TimerController();

    return BlocBuilder<RecordAudioCubit, RecordAudioState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.appBackground,
          leading: IconButton(
            tooltip: "Close",
            onPressed: state.newRecording
                ? () => showConfirmationDialog(
                      context,
                      title: "Discard Changes",
                      body: "Are you sure you want to discard your changes?",
                      buttonPrompt: "Discard",
                      buttonColor: ThemeColors.themeBlue,
                      onSubmit: () {
                        // Close dialog and pop back
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                    )
                : () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
          title: const Text("Record Audio"),
          actions: [
            IconButton(
              tooltip: "Save",
              onPressed: () {
                Navigator.of(context).pop(state.file);
                buildSuccesFlushbar(message: "Successfully recorded the audio")
                    .show(context);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  InfoLabel(label: "Recording Info"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "The new audio will replace the original audio track if it exists.",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "The recording may only be as long as the media's duration.",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SpacedDivider(),
                  InfoLabel(label: "Media Preview"),
                ],
              ),
            ),
            AudioMediaPreview(
              playerController: betterPlayerController,
              media: step.media,
              input: input.media,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimerWidget(
                      controller: timerController,
                      mediaDuration: input.duration.inSeconds,
                      onLimitReached: () {
                        recorder.toggleRecording(state.file!.path).then((_) {
                          context.read<RecordAudioCubit>().setIsRecording(
                                isRecording: recorder.isRecording,
                              );
                          context
                              .read<RecordAudioCubit>()
                              .setNewRecording(newRecording: true);

                          timerController.stopTimer();
                        });
                      },
                    ),
                    if (state.file != null)
                      AudioRecordWidget(
                        recorder: recorder,
                        timerController: timerController,
                        videoController: betterPlayerController,
                      ),
                    if (_getAudioPath(state) != null)
                      AudioPlayerWidget(audioPath: _getAudioPath(state)!)
                    else
                      const SizedBox(
                        height: 50,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _getAudioPath(RecordAudioState state) {
    if (state.newRecording) return state.file!.path;
    if (input.audio != null) {
      return input.audio!.file.getOrCrash().path;
    }
    if (step.audio != null) return step.audio!.fileUrl;
    return null;
  }
}
