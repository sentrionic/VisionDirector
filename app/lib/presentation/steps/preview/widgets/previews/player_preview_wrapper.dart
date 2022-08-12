import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';

class PlayerPreviewWrapper extends StatelessWidget {
  final Step step;
  final Widget child;
  const PlayerPreviewWrapper({
    super.key,
    required this.child,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return PlayerWrapper(
      // Display all text over the preview.
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          child,
          if (step.annotation != null)
            _TextOverlay(
              text: step.annotation!.getOrCrash(),
            ),
          BlocBuilder<PreviewScenarioCubit, PreviewScenarioState>(
            buildWhen: (p, c) => p.displayName != c.displayName,
            builder: (context, state) => state.displayName
                ? Positioned(
                    left: 5,
                    bottom: 5,
                    child: _TextOverlay(
                      text: "${step.position + 1}. ${step.name.getOrCrash()}",
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _TextOverlay extends StatelessWidget {
  final String text;
  const _TextOverlay({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black26.withAlpha(150),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
