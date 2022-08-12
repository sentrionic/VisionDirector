import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';

/// Type-safe route argument to provide a [scenario] and [stepTask].
class StepTaskArgument {
  final Scenario scenario;
  final StepTask stepTask;
  StepTaskArgument(this.scenario, this.stepTask);
}
