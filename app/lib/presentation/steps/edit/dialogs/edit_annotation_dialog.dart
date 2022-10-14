import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// Displays a dialog where the user can edit the annotation.
void showEditAnnotationDialog(
  BuildContext context,
  Function(String? annotation) onSave,
  Annotation? annotation,
) {
  showDialog(
    context: context,
    builder: (context) => _EditAnnotationDialog(
      onSave: onSave,
      annotation: annotation,
    ),
  );
}

class _EditAnnotationDialog extends HookWidget {
  final Annotation? annotation;
  final Function(String? annotation) onSave;
  const _EditAnnotationDialog({
    this.annotation,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final textEditingController =
        useTextEditingController(text: annotation?.getOrCrash() ?? "");
    final key = GlobalKey<FormState>();
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Edit Annotation",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
        ],
      ),
      content: Form(
        key: key,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Annotation',
          ),
          minLines: 3,
          maxLines: null,
          maxLength: Annotation.maxLength,
          controller: textEditingController,
          textInputAction: TextInputAction.newline,
          style: const TextStyle(fontSize: 18),
          autocorrect: false,
          onSaved: (value) => onSave(value),
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
            key.currentState?.save();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.themeBlue,
          ),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
