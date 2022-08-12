import 'dart:io';

import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';

import 'package:vision_director/application/steps/delete_step/delete_step_cubit.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_step_argument.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/add_audio_dialog.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/add_media_selection_sheet.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/assign_member_dialog.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/edit_annotation_dialog.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/edit_duration_dialog.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/main_task_screen.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/select_transition_dialog.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/trim_video_dialog.dart';
import 'package:vision_director/presentation/steps/edit/trimmer/trimmed_video.dart';

/// Displays a range of options to edit the given [step].
///
/// [step] represents the remote step values.
///
/// The state from the [BlocBuilder] represets the new local values, which have a higher priority.
class EditStepFormOptions extends StatelessWidget {
  final Step step;
  const EditStepFormOptions({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    final collaborators =
        context.read<ProjectListCubit>().getProjectCollaborators();
    return BlocBuilder<EditStepCubit, EditStepState>(
      builder: (context, state) {
        return Container(
          height: 100,
          color: Colors.black26,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              _EditOption(
                label: "Task",
                onClick: () {
                  final scenario =
                      context.read<ScenarioListCubit>().getCurrentScenario();
                  Navigator.of(context).pushNamed(
                    MainTaskScreen.routeName,
                    arguments: ScenarioStepArgument(
                      scenario!,
                      step,
                    ),
                  );
                },
                child: const Icon(
                  Icons.assignment_outlined,
                  size: 24,
                ),
              ),
              _EditOption(
                label: "Change Media",
                onClick: () => showMaterialModalBottomSheet(
                  backgroundColor: ThemeColors.appBackground,
                  context: context,
                  builder: (_) => AddMediaSelectionSheet(
                    cubit: context.read<EditStepCubit>(),
                  ),
                ),
                child: const Icon(
                  Icons.playlist_add,
                  size: 24,
                ),
              ),
              // If either a local or remote media file exists
              if (step.media != null || state.input.media != null) ...[
                _EditOption(
                  label: "Text",
                  onClick: () => showEditAnnotationDialog(
                    context,
                    (value) =>
                        context.read<EditStepCubit>().annotationChanged(value!),
                    state.input.annotation,
                  ),
                  child: const Text(
                    "Aa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                // Allow trimming if either the local or remote file is a video.
                if (_hasMediaToCut(state))
                  _EditOption(
                    label: "Trim",
                    onClick: () => Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SetupMediaDialog(
                            fileUrl: _getMediaPath(state),
                            fileName: step.media?.fileName,
                          );
                        },
                        fullscreenDialog: true,
                      ),
                    )
                        .then((value) {
                      if (value != null) {
                        // Update the local media value
                        final video = value as TrimmedVideo;
                        context.read<EditStepCubit>().changeMedia(
                              File(video.url),
                              Duration(seconds: video.duration),
                              "video",
                            );
                        // Save the trimmed video for reuse.
                        GallerySaver.saveVideo(video.url);
                      }
                    }),
                    child: const Icon(
                      Icons.cut,
                      size: 24,
                    ),
                  ),
              ],
              // Only allow setting the duration if it's not a video.
              if (_isMediaNotVideo(state))
                _EditOption(
                  label: "Duration",
                  onClick: () => showEditDurationDialog(
                    context,
                    (value) =>
                        context.read<EditStepCubit>().durationChanged(value),
                    state.input.duration.inSeconds,
                  ),
                  child: const Icon(
                    Icons.timer_outlined,
                    size: 24,
                  ),
                ),
              _EditOption(
                label: "Audio",
                onClick: () => Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddAudioDialog(
                        step: step,
                        input: state.input,
                      );
                    },
                    fullscreenDialog: true,
                  ),
                )
                    .then((value) {
                  if (value != null) {
                    context.read<EditStepCubit>().audioChanged(value as File);
                  }
                }),
                child: const Icon(
                  Icons.mic,
                  size: 24,
                ),
              ),
              _EditOption(
                label: "Transition",
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return EditTransitionDialog(
                        onSave: (newTransition) => context
                            .read<EditStepCubit>()
                            .changeTransition(newTransition),
                        transition: state.input.transition!,
                        input: state.input,
                      );
                    },
                    fullscreenDialog: true,
                  ),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  size: 24,
                ),
              ),
              _EditOption(
                label: "Assignee",
                onClick: () {
                  showAssignMemberDialog(
                    context,
                    collaborators,
                    (assignee) =>
                        context.read<EditStepCubit>().assigneeChanged(assignee),
                  );
                },
                child: const Icon(
                  Icons.person_add_alt_1_rounded,
                  size: 24,
                ),
              ),
              _EditOption(
                label: "Remove",
                onClick: () => showConfirmationDialog(
                  context,
                  title: "Remove Step",
                  body:
                      "Are you sure you want to remove this step? This action cannot be undone.",
                  buttonPrompt: "Remove",
                  buttonColor: ThemeColors.errorRed,
                  onSubmit: () {
                    final scenarioId = context
                        .read<ScenarioListCubit>()
                        .getCurrentScenarioId();
                    context
                        .read<DeleteStepCubit>()
                        .deleteStep(scenarioId, step.id);
                  },
                ),
                color: ThemeColors.errorRed,
                child: const Icon(
                  Icons.delete,
                  size: 24,
                  color: ThemeColors.errorRed,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Returns `true` if either a remote video or a local video exists.
  bool _hasMediaToCut(EditStepState state) =>
      (step.media != null && step.media!.mimeType.contains("video")) ||
      (state.input.media != null &&
          state.input.media!.mimeType.contains("video"));

  /// Returns `true` if neither the local nor remote media is a video.
  bool _isMediaNotVideo(EditStepState state) {
    final hasStepVideo = step.media?.mimeType.contains("video") ?? false;
    final hasInputVideo =
        state.input.media?.mimeType.contains("video") ?? false;
    return !(hasStepVideo || hasInputVideo);
  }

  /// Returns the path to the media file. Gives the local file a higher priority.
  String _getMediaPath(EditStepState state) {
    if (state.input.media != null) {
      return state.input.media!.file.getOrCrash().path;
    } else {
      return step.media!.fileUrl;
    }
  }
}

class _EditOption extends StatelessWidget {
  final String label;
  final Function onClick;
  final Widget child;
  final Color? color;
  const _EditOption({
    required this.label,
    required this.onClick,
    required this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 60;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black26,
            ),
            height: size,
            width: size,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () => onClick(),
              child: Center(child: child),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
