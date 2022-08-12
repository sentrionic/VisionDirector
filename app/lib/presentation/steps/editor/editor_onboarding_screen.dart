import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:vision_director/presentation/common/utils/setup_hive.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class EditorOnboardingScreen extends StatelessWidget {
  final Function() toggleShow;
  const EditorOnboardingScreen({super.key, required this.toggleShow});

  void _onFinish() {
    final box = Hive.box(HiveBoxes.onboardingBox);
    box.put(HiveBoxes.onboardingTimeline, false);
    toggleShow();
  }

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey<IntroductionScreenState>();
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: const _PageBody(
            body:
                "The timeline contains all scenes in chronological order. The currently selected item is highlighted with a blue border. Hold and drag the bottom handle to move the item to a new position.",
          ),
          image: const _PageImage(image: "timeline-1.png"),
          decoration: _pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: const _PageBody(
            body:
                "The current item's data is displayed in the highlighted areas. If it contains data (e.g. media, audio), the relevant field is highlighted. Click on the video to interact with it.",
          ),
          image: const _PageImage(image: "timeline-2.png"),
          decoration: _pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: const _PageBody(
            body:
                "The title and credits will be automatically generated on export. To add a new step click on the + button",
          ),
          image: const _PageImage(image: "timeline-3.png"),
          decoration: _pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: const _PageBody(
            body:
                "For more options (e.g. tasks, preview, export) click on the options icon.",
          ),
          image: const _PageImage(image: "timeline-4.png"),
          decoration: _pageDecoration,
        ),
      ],
      onDone: () => _onFinish(),
      onSkip: () => _onFinish(),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black87,
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      controlsMargin: const EdgeInsets.all(10),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black54,
        activeSize: Size(22.0, 10.0),
        activeColor: ThemeColors.themeBlue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: Colors.white.withAlpha(200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

const _pageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
  bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  imagePadding: EdgeInsets.zero,
  contentMargin: EdgeInsets.symmetric(
    horizontal: 16,
  ),
  bodyFlex: 3,
  fullScreen: true,
);

class _PageImage extends StatelessWidget {
  final String image;
  const _PageImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/onboarding/$image');
  }
}

class _PageBody extends StatelessWidget {
  final String body;
  const _PageBody({required this.body});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withAlpha(200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          body,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
