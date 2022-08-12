import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/value_objects.dart';
import 'package:vision_director/domain/core/value_validators.dart';

/// Type-safe value to store and validate the scenario's name.
class ScenarioName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory ScenarioName(String input) {
    return ScenarioName._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const ScenarioName._(this.value);
}

/// Type-safe value to store and validate the scenario's description.
class ScenarioDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 2000;

  factory ScenarioDescription(String input) {
    return ScenarioDescription._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const ScenarioDescription._(this.value);
}

/// Type-safe value to store and validate the scenario's vision video.
class ScenarioVideo extends ValueObject<File> {
  @override
  final Either<ValueFailure<File>, File> value;

  factory ScenarioVideo(File input) {
    return ScenarioVideo._(
      validateMaxFileSize(input, Guidelines.maxVisionVideoSize),
    );
  }

  const ScenarioVideo._(this.value);
}
