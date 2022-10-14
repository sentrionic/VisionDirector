import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/record_audio/record_audio_cubit.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/helpers/sound_recorder.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/widgets/timer_widget.dart';

/// Widget to toggle a new recording.
class AudioRecordWidget extends StatefulWidget {
  final SoundRecorder recorder;
  final TimerController timerController;
  final BetterPlayerController videoController;

  const AudioRecordWidget({
    super.key,
    required this.recorder,
    required this.timerController,
    required this.videoController,
  });

  @override
  State<AudioRecordWidget> createState() => _AudioRecordWidgetState();
}

// Needs to be stateful to check if it's mounted.
class _AudioRecordWidgetState extends State<AudioRecordWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordAudioCubit, RecordAudioState>(
      builder: (context, state) {
        return SizedBox(
          width: 85,
          height: 85,
          child: ElevatedButton(
            onPressed: () async {
              await widget.recorder.toggleRecording(state.file!.path);
              if (!mounted) return;
              context
                  .read<RecordAudioCubit>()
                  .setIsRecording(isRecording: widget.recorder.isRecording);
              if (widget.recorder.isRecording) {
                widget.timerController.startTimer();

                // Play the video while recording
                if (widget.videoController.isVideoInitialized() ?? false) {
                  await widget.videoController.seekTo(Duration.zero);
                  await widget.videoController.play();
                }
              } else {
                widget.timerController.stopTimer();
                context
                    .read<RecordAudioCubit>()
                    .setNewRecording(newRecording: true);

                // Stop the video as well
                if (widget.videoController.isVideoInitialized() ?? false) {
                  await widget.videoController.pause();
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
            ),
            child: state.isRecording
                ? Container(
                    width: 25,
                    height: 25,
                    color: Colors.red,
                  )
                : const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.red,
                  ),
          ),
        );
      },
    );
  }
}
