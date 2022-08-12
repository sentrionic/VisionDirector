import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';

class TimerController extends ValueNotifier<bool> {
  TimerController({bool isPlaying = false}) : super(isPlaying);

  void startTimer() => value = true;
  void stopTimer() => value = false;
}

class TimerWidget extends StatefulWidget {
  final TimerController controller;
  final int mediaDuration;
  final Function onLimitReached;

  const TimerWidget({
    super.key,
    required this.controller,
    required this.mediaDuration,
    required this.onLimitReached,
  });

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with SingleTickerProviderStateMixin {
  Duration duration = Duration.zero;
  late AnimationController _animationController;
  late Tween<double> _tween;
  late Animation<double> _animation;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.value) {
        startTimer();
      } else {
        stopTimer();
      }
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _tween = Tween<double>(
      begin: duration.inSeconds.toDouble(),
      end: duration.inSeconds.toDouble(),
    );
    _animation = _tween.animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _animationController,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void reset() => setState(() => duration = Duration.zero);

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
        _tween.begin = _tween.end;
        _animationController.reset();
        _tween.end = duration.inSeconds.toDouble();
        _animationController.forward();

        if (duration.inSeconds >= widget.mediaDuration) {
          widget.onLimitReached();
          _tween.begin = 0;
          _animationController.reset();
          _tween.end = 0;
          _animationController.forward();
        }
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (!mounted) return;
    if (resets) {
      reset();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (!mounted) return;
    if (resets) {
      reset();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return LinearProgressIndicator(
              value: _animation.value / widget.mediaDuration,
              color: Colors.white,
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${getDurationString(duration.inSeconds)} / ${getDurationString(widget.mediaDuration)}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
