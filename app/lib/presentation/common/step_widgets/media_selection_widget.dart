import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/duration_widget.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

/// Widget to display a prompt for selecting media or a preview of the selected media.
class MediaSelection extends StatelessWidget {
  final StepInput step;
  final Function onReset;
  const MediaSelection({
    super.key,
    required this.step,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _Preview(step: step),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DurationWidget(
                seconds: step.duration.inSeconds,
              ),
              if (step.media != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.black.withAlpha(200),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      tooltip: "Remove",
                      onPressed: () => onReset(),
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

/// Widget to display a thumbnail of the selected media.
/// If media is null it will display a prompt to select an image.
class _Preview extends StatelessWidget {
  final StepInput step;
  const _Preview({required this.step});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (step.media == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add),
          Text(l10n.addMediaLabel),
        ],
      );
    }

    final media = step.media!;

    // Thumbnail is still being generated
    if (media.mimeType.contains("video") && step.thumbnail == null) {
      return Container();
    }

    // Select the thumbnail if it's the video or just the image otherwise.
    final file = media.mimeType.contains("video")
        ? File(step.thumbnail!)
        : media.file.getOrCrash();

    return Image.file(
      file,
      fit: BoxFit.fitWidth,
    );
  }
}
