import 'package:flutter/material.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

/// Displays the [step]'s media error message.
class FileErrorMessage extends StatelessWidget {
  final StepInput step;
  const FileErrorMessage({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final errorMessage = getErrorMessage(context);

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeColors.brandRed),
            left: BorderSide(color: ThemeColors.brandRed),
            right: BorderSide(color: ThemeColors.brandRed),
          ),
          color: ThemeColors.inputBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            if (errorMessage != null)
              Text(
                errorMessage,
                style: const TextStyle(
                  color: ThemeColors.errorRed,
                  fontSize: 12,
                ),
              ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  String? getErrorMessage(BuildContext context) {
    final l10n = context.l10n;

    // Check if the duration is too long
    if (step.duration.inSeconds > Guidelines.maxDuration) {
      return l10n.videoTooLongError;
    }

    if (step.duration.inSeconds < Guidelines.defaultDuration) {
      return "This video is too short.";
    }

    // Check if the step's media got an error
    if (step.media != null) {
      return step.media!.failureOption.fold(
        () => null,
        (f) => f.maybeMap(
          exceedingSize: (_) => l10n.fileTooBigError,
          invalidAspectRatio: (_) => l10n.invalidAspectRationError,
          orElse: () => null,
        ),
      );
    }

    return null;
  }
}
