import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/value_objects.dart';
import 'package:vision_director/domain/core/value_validators.dart';

/// Type-safe value to store and validate the comment's body.
class CommentBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 2000;

  factory CommentBody(String input) {
    return CommentBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const CommentBody._(this.value);
}

/// Type-safe value to store and validate the template's name.
class TemplateName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TemplateName(String input) {
    return TemplateName._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const TemplateName._(this.value);
}

/// Type-safe value to store and validate the template's description.
class TemplateDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 500;

  factory TemplateDescription(String input) {
    return TemplateDescription._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const TemplateDescription._(this.value);
}
