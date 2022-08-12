import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';

/// Widget to display a placeholder indicating that the given step does not have media set yet.
class NoMediaPlaceholder extends StatelessWidget {
  const NoMediaPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return PlayerWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.schedule),
          SizedBox(
            height: 10,
          ),
          Text(
            "No media added yet",
          ),
        ],
      ),
    );
  }
}
