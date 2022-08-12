import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// Displays a dialog where the user can edit the step's duration.
void showEditDurationDialog(
  BuildContext context,
  Function(int duration) onSave,
  int duration,
) {
  showDialog(
    context: context,
    builder: (context) => _EditDurationDialog(
      onSave: onSave,
      duration: duration,
    ),
  );
}

class _EditDurationDialog extends HookWidget {
  final int duration;
  final Function(int duration) onSave;
  const _EditDurationDialog({
    required this.duration,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final textEditingController =
        useTextEditingController(text: duration.toString());
    final key = GlobalKey<FormState>();
    return AlertDialog(
      title: const Text(
        "Edit Duration",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Time this step is displayed in the final video. Must be between ${Guidelines.defaultDuration} and ${Guidelines.maxDuration} seconds.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Duration (s)',
              ),
              controller: textEditingController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 18),
              onSaved: (value) => onSave(int.parse(value!)),
              validator: (value) {
                final duration = int.tryParse(value!);
                if (duration == null) return "Not a number";
                if (duration < Guidelines.defaultDuration) {
                  return "Min duration is ${Guidelines.defaultDuration}s";
                }
                if (duration > Guidelines.maxDuration) {
                  return "Too long. Max duration is ${Guidelines.maxDuration}s";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (key.currentState?.validate() ?? false) {
              key.currentState?.save();
              Navigator.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.themeBlue,
          ),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
