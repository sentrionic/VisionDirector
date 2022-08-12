import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/auth/value_objects.dart';
import 'package:vision_director/domain/core/failures.dart';

part 'account.freezed.dart';

/// [Account] represents the user's account details.
///
/// * [id] is the user's unique id.
/// * [username] is the user's name.
/// * [email] is the user's email.
/// * [role] is the user's role.
@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String id,
    required Username username,
    required EmailAddress email,
    required Roles role,
  }) = _Account;

  factory Account.empty() => Account(
        id: "0",
        username: Username(""),
        email: EmailAddress(""),
        role: Roles.user,
      );

  /// Validates if there are errors in the properties.
  Option<ValueFailure<dynamic>> get failureOption {
    return username.failureOrUnit
        .andThen(email.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}

/// [Roles] is the user's role.
///
/// * [admin] means the user is the admin.
/// * [moderator] means the user is a moderator.
/// * [user] means the user is just a user.
enum Roles {
  admin,
  moderator,
  user,
}
