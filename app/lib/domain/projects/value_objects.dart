import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/value_objects.dart';
import 'package:vision_director/domain/core/value_validators.dart';

/// Type-safe value to store and validate the project invite.
class InviteLink extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory InviteLink(String input) {
    return InviteLink._(
      validateStringNotEmpty(input),
    );
  }

  const InviteLink._(this.value);
}
