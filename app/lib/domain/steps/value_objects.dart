import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/value_objects.dart';
import 'package:vision_director/domain/core/value_validators.dart';

/// Type-safe value to store and validate the step's name.
class StepName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory StepName(String input) {
    return StepName._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const StepName._(this.value);
}

/// Type-safe value to store and validate the step's annotation.
class Annotation extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 150;

  factory Annotation(String input) {
    return Annotation._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const Annotation._(this.value);
}

/// Type-safe value to store and validate the step's media.
class StepMedia extends ValueObject<File> {
  @override
  final Either<ValueFailure<File>, File> value;

  factory StepMedia(File input) {
    return StepMedia._(
      validateMaxFileSize(input, Guidelines.maxFileSize),
    );
  }

  const StepMedia._(this.value);
}
