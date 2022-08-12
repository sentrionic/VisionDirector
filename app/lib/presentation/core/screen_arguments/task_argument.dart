import 'package:vision_director/domain/tasks/task.dart';

/// Type-safe route argument to provide a [task].
class TaskArgument {
  final Task task;
  TaskArgument(this.task);
}
