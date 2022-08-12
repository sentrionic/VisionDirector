import 'package:flutter/material.dart';

/// A [Divider] with some vertical spacing.
class SpacedDivider extends StatelessWidget {
  const SpacedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 25,
    );
  }
}
