import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';

import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/step_widgets/icon_label.dart';
import 'package:vision_director/presentation/common/step_widgets/info_box_wrapper.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class EditStepFormInfo extends StatelessWidget {
  final Step step;
  const EditStepFormInfo({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditStepCubit, EditStepState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              _TotalTimeLabel(
                input: state.input,
              ),
              const Divider(
                thickness: 2,
              ),
              InfoBoxWrapper(
                children: [
                  IconLabel(
                    icon: _getMediaIcon(step.media, state.input.media),
                    isSet: step.media != null || state.input.media != null,
                    label: _getMediaLabel(step.media, state.input.media),
                  ),
                  IconLabel(
                    icon: Icons.description,
                    isSet: step.annotation != null ||
                        state.input.annotation != null,
                    label: "Annotation",
                  ),
                  IconLabel(
                    icon: Icons.audiotrack,
                    isSet: step.audio != null || state.input.audio != null,
                    label: "Audio",
                  ),
                  IconLabel(
                    icon: Icons.person,
                    isSet:
                        step.assignee != null || state.input.assignee != null,
                    label: "Assigned",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getMediaIcon(Media? media, MediaInput? input) {
    if (media == null && input == null) return Icons.attach_file;
    // Prefer input over remote media.
    if (input != null && input.mimeType.contains("video")) {
      return Icons.video_collection_rounded;
    }
    if (input != null && input.mimeType.contains("image")) {
      return Icons.video_collection_rounded;
    }
    if (media != null && media.mimeType.contains("video")) {
      return Icons.video_collection_rounded;
    }
    if (media != null && media.mimeType.contains("image")) {
      return Icons.video_collection_rounded;
    }
    return Icons.question_mark;
  }

  String _getMediaLabel(Media? media, MediaInput? input) {
    if (media == null && input == null) return "Media";
    // Prefer input over remote media.
    if (input != null && input.mimeType.contains("video")) {
      return "Video";
    }
    if (input != null && input.mimeType.contains("image")) {
      return "Image";
    }
    if (media != null && media.mimeType.contains("video")) {
      return "Video";
    }
    if (media != null && media.mimeType.contains("image")) {
      return "Image";
    }
    return "Unknown";
  }
}

class _TotalTimeLabel extends StatelessWidget {
  final StepInput input;
  const _TotalTimeLabel({required this.input});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: BlocBuilder<StepListCubit, StepListState>(
          builder: (context, state) => state.maybeWhen(
            loadSuccess: (steps) {
              // Sum of all durations
              final duration =
                  // Ignore the old duration
                  steps.where((e) => e.id != input.id).toList().fold<int>(
                        0,
                        (p, c) => p + (c.duration.inSeconds),
                      );
              final totalDuration = duration +
                  Guidelines.autoGeneratedLength +
                  input.duration.inSeconds;
              return Text(
                "Total time: ${getDurationString(totalDuration)} / ${getDurationString(Guidelines.maxTotalDuration)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: totalDuration > Guidelines.maxTotalDuration
                      ? ThemeColors.brandRed
                      : Colors.white,
                  fontSize: 16,
                ),
              );
            },
            orElse: () => Container(),
          ),
        ),
      ),
    );
  }
}
