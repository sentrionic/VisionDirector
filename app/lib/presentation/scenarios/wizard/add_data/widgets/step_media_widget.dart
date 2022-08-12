import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/step_widgets/file_error_message.dart';
import 'package:vision_director/presentation/common/step_widgets/media_selection_widget.dart';
import 'package:vision_director/presentation/common/utils/media_utils.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class StepMediaWidget extends StatelessWidget {
  final StepInput step;

  const StepMediaWidget({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: InkWell(
            onTap: () => _showSelectionDialog(
              context,
              context.read<CreateStepsCubit>(),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: _isValid()
                    ? null
                    : const Border(
                        top: BorderSide(color: ThemeColors.brandRed),
                        left: BorderSide(color: ThemeColors.brandRed),
                        right: BorderSide(color: ThemeColors.brandRed),
                      ),
                color: Colors.black38,
              ),
              child: MediaSelection(
                step: step,
                onReset: () =>
                    context.read<CreateStepsCubit>().resetMedia(step.id),
              ),
            ),
          ),
        ),
        if (!_isValid()) FileErrorMessage(step: step),
      ],
    );
  }

  /// Returns `true` if the media does not contain an error and it's within the time limit.
  bool _isValid() =>
      (step.media?.failureOption.isNone() ?? true) &&
      isWithinGuidelines(step.duration);

  /// Displays an dialog where the user can either pick a video or an image.
  void _showSelectionDialog(BuildContext context, CreateStepsCubit cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ModalButton(
                label: "Image",
                icon: Icons.image,
                onClick: () {
                  Navigator.of(context).pop();
                  _pickImage(cubit);
                },
              ),
              const Divider(
                thickness: 1,
              ),
              _ModalButton(
                label: "Video",
                icon: Icons.video_collection_rounded,
                onClick: () {
                  Navigator.of(context).pop();
                  _pickVideo(cubit);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Opens the [ImagePicker] and sets the selected video in the state.
  Future<void> _pickVideo(CreateStepsCubit cubit) async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final media = File(pickedFile.path);
      final duration = await getVideoDuration(media.path);

      // Set the selected file in the state
      cubit.changeMedia(
        step.id,
        media,
        Duration(seconds: duration.round()),
        "video",
      );

      // Generate a thumbnail and set it in the state
      final thumbnail = await getThumbnail(media.path);
      cubit.changeThumbnail(step.id, thumbnail);

      // Confirm the aspect ratio
      if (!await checkIfVideoIsLandscape(media)) {
        cubit.changeIsPortrait(step.id, isPortrait: true);
      }
    }
  }

  /// Opens the [ImagePicker] and sets the selected image in the state.
  Future<void> _pickImage(CreateStepsCubit cubit) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final media = File(pickedFile.path);

      // Set the selected file in the state
      cubit.changeMedia(
        step.id,
        media,
        const Duration(seconds: Guidelines.defaultDuration),
        "image",
      );

      // Confirm the aspect ratio
      if (!await checkIfImageIsLandscape(media)) {
        cubit.changeIsPortrait(step.id, isPortrait: true);
      }
    }
  }
}

class _ModalButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onClick;

  const _ModalButton({
    required this.label,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => onClick(),
        style: TextButton.styleFrom(
          primary: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  size: 22,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
