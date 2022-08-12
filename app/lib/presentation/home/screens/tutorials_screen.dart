import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/steps/edit/edit_onboarding_screen.dart';
import 'package:vision_director/presentation/steps/editor/editor_onboarding_screen.dart';
import 'package:vision_director/presentation/steps/preview/preview_onboarding_screen.dart';

enum _Screen {
  start,
  timeline,
  editor,
  preview,
}

class TutorialsScreen extends StatefulWidget {
  static const routeName = "/tutorials";

  const TutorialsScreen({super.key});

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

// Very simple and quickly made screen to display the onboarding screens again.
class _TutorialsScreenState extends State<TutorialsScreen> {
  var _screen = _Screen.start;

  @override
  Widget build(BuildContext context) {
    switch (_screen) {
      case _Screen.start:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tutorials"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CardWrapper(
                child: ListTile(
                  leading: const Text(
                    "#1",
                    style: TextStyle(fontSize: 20),
                  ),
                  title: const Text("Timeline"),
                  onTap: () => setState(() => _screen = _Screen.timeline),
                ),
              ),
              CardWrapper(
                child: ListTile(
                  leading: const Text(
                    "#2",
                    style: TextStyle(fontSize: 20),
                  ),
                  title: const Text("Editor"),
                  onTap: () => setState(() => _screen = _Screen.editor),
                ),
              ),
              CardWrapper(
                child: ListTile(
                  leading: const Text(
                    "#3",
                    style: TextStyle(fontSize: 20),
                  ),
                  title: const Text("Preview"),
                  onTap: () => setState(() => _screen = _Screen.preview),
                ),
              ),
            ],
          ),
        );
      case _Screen.timeline:
        return EditorOnboardingScreen(
          toggleShow: () => setState(() {
            _screen = _Screen.start;
          }),
        );
      case _Screen.editor:
        return EditOnboardingScreen(
          toggleShow: () => setState(() {
            _screen = _Screen.start;
          }),
        );
      case _Screen.preview:
        return PreviewOnboardingScreen(
          toggleShow: () => setState(() {
            _screen = _Screen.start;
          }),
        );
    }
  }
}
