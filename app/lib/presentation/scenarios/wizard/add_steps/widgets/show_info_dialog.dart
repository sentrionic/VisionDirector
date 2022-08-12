import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';

class ShowInfoDialog extends StatelessWidget {
  const ShowInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Step Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Wrap(
              runSpacing: 10,
              children: const [
                Text(
                  "• Hold & Drag the handle to reorder.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "• Slide right to delete an item.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                InfoLabel(label: "Examples"),
                Text(
                  "User opens their app",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: const Icon(Icons.help_center),
    );
  }
}
