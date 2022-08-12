import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';

/// Type-safe route argument to provide a [scenario] and [step].
class ScenarioStepArgument {
  final Scenario scenario;
  final Step step;
  ScenarioStepArgument(this.scenario, this.step);
}
