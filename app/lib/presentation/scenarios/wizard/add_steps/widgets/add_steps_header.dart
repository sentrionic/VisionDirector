import 'package:flutter/material.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/show_info_dialog.dart';

class AddStepsHeader extends StatelessWidget {
  const AddStepsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "1. Add Steps",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Start by defining the steps of your vision.\nClick on the + to add them.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            InfoLabel(label: "Up to ${Guidelines.maxSteps} steps"),
            ShowInfoDialog(),
          ],
        ),
      ],
    );
  }
}
