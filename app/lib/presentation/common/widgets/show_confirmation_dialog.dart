import 'package:flutter/material.dart';

/// Displays an [AlertDialog] that confirms the user's action.
///
/// * [title] is the title of the dialog.
/// * [body] is the body of the dialog.
/// * [buttonPrompt] is the positive action of the dialog.
/// * [buttonColor] is the color of the positive action button.
/// * [onSubmit] gets called on confirmation.
void showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String body,
  required String buttonPrompt,
  required Color buttonColor,
  required void Function() onSubmit,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
          ],
        ),
        content: Text(
          body,
          style: const TextStyle(
            color: Colors.white70,
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
            onPressed: () => onSubmit(),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
            ),
            child: Text(buttonPrompt),
          ),
        ],
      );
    },
  );
}
