import 'package:flutter/material.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// An [ElevatedButton] that has the maximum width.
///
/// * [onClick] is the function to be executed on press. If null, disables the button. Automatically closes the keyboard.
/// * [label] is the text appearing on the button.
class LongButton extends StatelessWidget {
  final Function? onClick;
  final String label;

  const LongButton({
    super.key,
    required this.onClick,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ThemeColors.themeBlue,
            ),
            onPressed: onClick == null
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    onClick!();
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
