import 'package:vision_director/domain/core/constants.dart';

/// Prints a string representation of the object to the console only if the app is not running in `production` mode.
void debugLog(Object? object) {
  if (!const bool.fromEnvironment('dart.vm.product')) {
    // ignore: avoid_print
    print(object);
  }
}

/// Validates if the time is within the guidelines durations.
bool isWithinGuidelines(Duration duration) =>
    duration.inSeconds >= Guidelines.defaultDuration &&
    duration.inSeconds <= Guidelines.maxDuration;
