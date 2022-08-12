import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/upload_video/upload_video_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/utils/better_player_configuration.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

class UploadVideoBody extends StatelessWidget {
  final Scenario scenario;
  final File video;

  const UploadVideoBody({
    super.key,
    required this.scenario,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<UploadVideoCubit, UploadVideoState>(
      listener: (context, state) {
        state.scenarioFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  fileTooLarge: (_) =>
                      "The generated file is too big. Maximum size is 500MB",
                  orElse: () => l10n.serverError,
                ),
              ).show(context);
            },
            (_) {
              buildSuccesFlushbar(message: "Successfully uploaded the video")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            // Clean up all the temp files.
            context.read<ExportScenarioCubit>().cleanup();
            return true;
          },
          child: state.isSubmitting
              ? UploadProgress(progress: state.progress)
              : Scaffold(
                  appBar: AppBar(
                    title: const Text("Upload Video"),
                    leading: IconButton(
                      tooltip: "Close",
                      onPressed: () => showConfirmationDialog(
                        context,
                        title: "Cancel Upload",
                        body:
                            "Are you sure you want to leave this screen? You will have to re-export the video.",
                        buttonPrompt: "Leave",
                        buttonColor: ThemeColors.brandRed,
                        onSubmit: () {
                          // Clean up all the temp files
                          context.read<ExportScenarioCubit>().cleanup();
                          // Close dialog and pop back
                          int count = 0;
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        },
                      ),
                      icon: const Icon(Icons.close),
                    ),
                    actions: [
                      if (scenario.isOwner)
                        IconButton(
                          tooltip: "Upload Video",
                          onPressed: () => context
                              .read<UploadVideoCubit>()
                              .uploadVideo(scenario.id, video),
                          icon: const Icon(
                            Icons.upload_file,
                          ),
                        ),
                    ],
                  ),
                  body: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: InfoLabel(label: "Exported Video"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // VideoPlayer for the newly created video.
                      PlayerWrapper(
                        child: BetterPlayer.file(
                          video.path,
                          betterPlayerConfiguration:
                              getBetterPlayerConfiguration(),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: LongButton(
                          onClick: () => GallerySaver.saveVideo(video.path)
                              .then((isSuccess) {
                            if (isSuccess == true) {
                              buildSuccesFlushbar(
                                message: "Successfully saved the video",
                              ).show(context);
                            } else {
                              buildErrorFlushbar(
                                message: "Error saving the video",
                              ).show(context);
                            }
                          }),
                          label: "Save Locally",
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
