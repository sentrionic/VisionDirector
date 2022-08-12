import 'package:flutter/material.dart';

import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/presentation/common/widgets/form_flow_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';

/// Displays a dialog that gives media recommendations to the user.
class OpenGuidelinesButton extends StatelessWidget {
  const OpenGuidelinesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Guidelines",
      onPressed: () => Navigator.of(context).pushNamed(
        GuidelinesScreen.routeName,
      ),
      icon: const Icon(Icons.info_outline_rounded),
    );
  }
}

class GuidelinesScreen extends StatelessWidget {
  static const routeName = '/guidelines';
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guidelines",
        ),
      ),
      body: FormFlowWrapper(
        children: [
          const Text(
            "The following guidelines may help you with the creation of your vision video:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const InfoLabel(label: "1. Story"),
          const SizedBox(
            height: 10,
          ),
          const _Point(
            text:
                "• Your story should have a beginning, middle, and end to create a clear structure.",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColoredBox(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _HighlightedText(
                      keyWord: "Beginning",
                      text: ": Introduce the key idea of the solution.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _HighlightedText(
                      keyWord: "Middle",
                      text: ": Emphasize the envisioned improvements.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _HighlightedText(
                      keyWord: "End",
                      text: ": Conclude with the benefits of your vision.",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const _Point(
            text: "• Keep it simple by addressing only a few topics.",
          ),
          const _Point(
            text:
                "• Your story should have a maximum of ${Guidelines.maxSteps} scenes.",
          ),
          const _Point(
            text: "• Deal with one topic at a time.",
          ),
          const SpacedDivider(),
          const InfoLabel(label: "2. Production"),
          const SizedBox(
            height: 10,
          ),
          const _Point(
            text:
                "• The maximum length of a scene is ${Guidelines.maxDuration} seconds.",
          ),
          _Point(
            text:
                "• The maximum length of the whole video is ${(Guidelines.maxTotalDuration / 60).toStringAsFixed(0)} minutes.",
          ),
          const _Point(text: "• The maximum file size per scene is 100MB."),
          const _Point(
            text:
                "• All steps must have a minimum duration of ${Guidelines.defaultDuration} seconds.",
          ),
          const _Point(
            text:
                "• The default duration of a scene is ${Guidelines.defaultDuration} seconds",
          ),
          const _Point(
            text:
                '• If no media is assigned to the step it will display "Needs more information" in the final video.',
          ),
          const _Point(
            text:
                '• The optional annotations will be displayed at the center top of the scene.',
          ),
          const SpacedDivider(),
          const InfoLabel(label: "3. Shooting"),
          const SizedBox(
            height: 10,
          ),
          const _Point(
            text: '• Landscape orientation is required.',
          ),
          const _Point(
            text: '• Let the camera handle the settings.',
          ),
          const _Point(
            text: '• Have the light shine from behind you.',
          ),
          const _Point(
            text: '• Ensure your motions are smooth and slow.',
          ),
          const _Point(
            text: "• Record in a resolution that's the closest to 16/9",
          ),
        ],
      ),
    );
  }
}

class _Point extends StatelessWidget {
  final String text;
  const _Point({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _HighlightedText extends StatelessWidget {
  final String keyWord;
  final String text;
  const _HighlightedText({
    required this.keyWord,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: keyWord,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: text),
        ],
      ),
    );
  }
}
