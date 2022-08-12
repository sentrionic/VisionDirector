import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class EditTransitionDialog extends HookWidget {
  final StepInput input;
  final StepTransition transition;
  final Function(StepTransition newTransition) onSave;
  const EditTransitionDialog({
    super.key,
    required this.transition,
    required this.onSave,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    final state = useState(transition);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Transition"),
        backgroundColor: ThemeColors.appBackground,
        actions: [
          TextButton(
            onPressed: () {
              onSave(state.value);
              Navigator.of(context).pop();
              buildSuccesFlushbar(message: "Successfully set the transition")
                  .show(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: FormWrapper(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                InfoLabel(label: "Transition Info"),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "You can set the transition going to this step here.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: Text(
              "Current: ${_getTransitionText(state.value)}",
            ),
          ),
          const SpacedDivider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Transition Preview".toUpperCase(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(_getTransitionGif(state.value)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  value: StepTransition.none,
                  child: Text(_getTransitionText(StepTransition.none)),
                ),
                DropdownMenuItem(
                  value: StepTransition.fadeIn,
                  child: Text(_getTransitionText(StepTransition.fadeIn)),
                ),
                DropdownMenuItem(
                  value: StepTransition.fadeOut,
                  child: Text(_getTransitionText(StepTransition.fadeOut)),
                ),
                DropdownMenuItem(
                  value: StepTransition.fadeInOut,
                  child: Text(_getTransitionText(StepTransition.fadeInOut)),
                ),
              ],
              value: state.value,
              onChanged: (value) => state.value = value! as StepTransition,
            ),
          ),
        ],
      ),
    );
  }

  String _getTransitionGif(StepTransition transition) {
    switch (transition) {
      case StepTransition.fadeIn:
        return "assets/resources/fadeIn.gif";
      case StepTransition.fadeOut:
        return "assets/resources/fadeOut.gif";
      case StepTransition.fadeInOut:
        return "assets/resources/fadeInOut.gif";
      case StepTransition.none:
        return "assets/resources/none.gif";
    }
  }

  String _getTransitionText(StepTransition transition) {
    switch (transition) {
      case StepTransition.fadeIn:
        return "Fade In";
      case StepTransition.fadeOut:
        return "Fade Out";
      case StepTransition.fadeInOut:
        return "Fade In & Out";
      case StepTransition.none:
        return "None";
    }
  }
}
