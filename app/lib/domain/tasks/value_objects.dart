import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/value_objects.dart';
import 'package:vision_director/domain/core/value_validators.dart';

/// Type-safe value to store and validate the task's title.
class TaskTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 150;

  factory TaskTitle(String input) {
    return TaskTitle._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const TaskTitle._(this.value);
}

/// Type-safe value to store and validate the task's body.
class TaskBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 2000;

  factory TaskBody(String input) {
    return TaskBody._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const TaskBody._(this.value);
}
