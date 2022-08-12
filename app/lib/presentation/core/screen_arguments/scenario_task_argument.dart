import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/tasks/task.dart';

/// Type-safe route argument to provide a [scenario] and [task].
class ScenarioTaskArgument {
  final Scenario? scenario;
  final Task task;
  ScenarioTaskArgument(this.scenario, this.task);
}
