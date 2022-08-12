import 'dart:io';

import 'package:vision_director/domain/scenarios/scenario.dart';

/// Type-safe route argument to provide a [scenario] and [video].
class ScenarioVideoArgument {
  final Scenario scenario;
  final File video;
  ScenarioVideoArgument(this.scenario, this.video);
}
