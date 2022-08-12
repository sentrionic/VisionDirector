import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';

/// Displays the given duration with a dark overlay.
class DurationWidget extends StatelessWidget {
  final int seconds;
  const DurationWidget({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black.withAlpha(200),
        ),
        height: 30,
        width: 60,
        child: Text(
          getDurationString(seconds),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
