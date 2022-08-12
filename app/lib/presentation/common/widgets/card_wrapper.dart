import 'package:flutter/material.dart';

/// Wraps the [child] widget in a [Card] widget and applies some padding.
class CardWrapper extends StatelessWidget {
  final Widget child;
  const CardWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: child,
      ),
    );
  }
}
