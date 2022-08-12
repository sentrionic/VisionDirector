import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

import 'faker.dart';

Step getStepFixture({int? position = 0}) => Step(
      id: getRandomId(),
      name: StepName(getRandomString(getRandomInt(10, 30))),
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      duration: Duration(seconds: getRandomInt(5, 30)),
      position: position!,
      isLocked: false,
      isCompleted: false,
      transition: StepTransition.none,
    );

StepInput getStepInputFixture() => StepInput.fromStep(getStepFixture());

List<Step> getStepListFixture() {
  final List<Step> steps = [];

  for (var i = 0; i < 5; i++) {
    steps.add(getStepFixture(position: i));
  }

  return steps;
}
