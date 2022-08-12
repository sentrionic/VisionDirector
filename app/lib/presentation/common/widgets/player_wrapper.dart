import 'package:flutter/material.dart';

/// Wraps the [child] inside an [AspectRatio] of 16/9.
class PlayerWrapper extends StatelessWidget {
  final Widget child;
  const PlayerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black38,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
