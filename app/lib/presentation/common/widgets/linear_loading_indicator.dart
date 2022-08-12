import 'package:flutter/material.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// Indeterminate linear loading indicator with top spacing.
class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(height: 15),
        LinearProgressIndicator(
          color: ThemeColors.themeBlue,
        ),
      ],
    );
  }
}
