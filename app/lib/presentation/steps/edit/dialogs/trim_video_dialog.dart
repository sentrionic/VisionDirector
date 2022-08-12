import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/setup_media/setup_media_cubit.dart';
import 'package:vision_director/application/steps/trim_video/trim_video_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/control_button.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/trim_editor.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/trimmed_video.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/video_viewer.dart';

/// Checks if the file exists locally. Downloads it if necessary.
///
/// Sets it up for trimming after that.
class SetupMediaDialog extends StatelessWidget {
  final String fileUrl;
  final String? fileName;

  const SetupMediaDialog({super.key, required this.fileUrl, this.fileName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SetupMediaCubit>()..setupMedia(fileUrl, fileName),
      child: const _SetupForm(),
    );
  }
}

class _SetupForm extends StatelessWidget {
  const _SetupForm();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupMediaCubit, SetupMediaState>(
      listenWhen: (previous, current) => previous.file != current.file,
      listener: (context, state) {
        if (state.file != null) {
          onFinish(context, state.file!);
        }
      },
      builder: (context, state) {
        return state.isDownloading
            ? UploadProgress(
                progress: state.downloadProgress,
                isUploading: false,
              )
            : const Scaffold(
                body: SizedBox(),
              );
      },
    );
  }

  /// Replaces the current dialog with the TrimVideoDialog.
  ///
  /// Returns the trim result to the EditPage.
  Future<void> onFinish(BuildContext context, File file) async {
    final completer = Completer();
    final result = await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return _TrimVideoDialog(
            video: file,
          );
        },
        fullscreenDialog: true,
      ),
      result: completer.future,
    );
    completer.complete(result);
  }
}

/// Dialog to trim a local video.
class _TrimVideoDialog extends StatelessWidget {
  final File video;

  const _TrimVideoDialog({required this.video});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TrimVideoCubit>()..initVideo(video),
      child: const _TrimForm(),
    );
  }
}

class _TrimForm extends StatelessWidget {
  const _TrimForm();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrimVideoCubit, TrimVideoState>(
      listener: (context, state) {
        if (state.videoUrl != null) {
          final video = TrimmedVideo(
            state.videoUrl!,
            ((state.endValue - state.startValue) / 1000).round(),
          );

          Navigator.of(context).pop(video);
          buildSuccesFlushbar(message: "Successfully trimmed the video")
              .show(context);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Video Trimmer"),
                actions: [
                  TextButton(
                    // Prevent the user from trimming again.
                    onPressed: state.isTrimming
                        ? null
                        : () => context.read<TrimVideoCubit>().trimVideo(),
                    child: const Text(
                      "Trim",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            InfoLabel(label: "Trimmer Information"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Select a start and end position for the new video. The length must be between ${Guidelines.defaultDuration} and ${Guidelines.maxDuration}s long.",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SpacedDivider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InfoLabel(label: "Preview"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      VideoViewer(trimmer: state.trimmer),
                      const SizedBox(
                        height: 10,
                      ),
                      ControlButton(
                        onClick: () {
                          state.trimmer
                              .videPlaybackControl(
                                startValue: state.startValue,
                                endValue: state.endValue,
                              )
                              .then(
                                (value) => context
                                    .read<TrimVideoCubit>()
                                    .togglePlaying(isPlaying: value),
                              );
                        },
                        icon: state.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      const SpacedDivider(),
                      Center(
                        child: TrimEditor(
                          trimmer: state.trimmer,
                          viewerWidth: MediaQuery.of(context).size.width,
                          maxVideoLength: const Duration(seconds: 30),
                          onChangeStart: (value) => context
                              .read<TrimVideoCubit>()
                              .changeStartValue(value),
                          onChangeEnd: (value) => context
                              .read<TrimVideoCubit>()
                              .changeEndValue(value),
                          onChangePlaybackState: (value) => context
                              .read<TrimVideoCubit>()
                              .togglePlaying(isPlaying: value),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "New Duration",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${(state.endValue - state.startValue) ~/ 1000}s",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _SavingInProgressOverlay(isSaving: state.isTrimming),
          ],
        );
      },
    );
  }
}

class _SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const _SavingInProgressOverlay({required this.isSaving});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Material(
                type: MaterialType.transparency,
                child: Text(
                  'Trimming',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
