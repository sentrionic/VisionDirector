import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';

class VisionVideoScreen extends StatelessWidget {
  static const routeName = "/vision-video";

  const VisionVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vision Videos",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoLabel(label: "1. What is a Vision Video?"),
              SizedBox(
                height: 10,
              ),
              _Point(
                text:
                    "A vision video is a video that represents a vision or parts of it for achieving shared understanding among all parties involved by disclosing, discussing, and aligning their mental models of the future system.",
              ),
              SpacedDivider(),
              InfoLabel(label: "2. What are they used for?"),
              SizedBox(
                height: 10,
              ),
              _Point(
                text: "• Documentations of requirements.",
              ),
              _Point(
                text: "• Visualising future systems.",
              ),
              _Point(
                text: "• Verifying if the envisioned system is the right one.",
              ),
              SpacedDivider(),
              InfoLabel(
                label:
                    "3. What is the difference between a Vision Video and a normal one?",
              ),
              SizedBox(
                height: 10,
              ),
              _Point(
                text:
                    "A Vision Video is basically a normal video and should be treated as such. A Vision Video is a specific type of video that contains the problem, the solution to said problem and the value of said solution.",
              ),
              SpacedDivider(),
              InfoLabel(
                label: "4. Examples",
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
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
