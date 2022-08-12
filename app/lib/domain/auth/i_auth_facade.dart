import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/domain/auth/auth_failure.dart';
import 'package:vision_director/domain/auth/value_objects.dart';

/// Contains repository calls related to the user's account.
abstract class IAuthFacade {
  /// Registers the user on the server.
  ///
  /// Returns either the user's details or an [AuthFailure].
  Future<Either<AuthFailure, Account>> register({
    required EmailAddress emailAddress,
    required Password password,
    required Username username,
  });

  /// Logins the user on the server.
  ///
  /// Returns either the user's details or an [AuthFailure].
  Future<Either<AuthFailure, Account>> login({
    required EmailAddress emailAddress,
    required Password password,
  });

  /// Updates the user's info on the server.
  ///
  /// Returns either the user's details or an [AuthFailure].
  Future<Either<AuthFailure, Account>> updateAccount({
    required EmailAddress emailAddress,
    required Username username,
  });

  /// Changes the current user's password.
  ///
  /// Returns either the user's details or an [AuthFailure].
  Future<Either<AuthFailure, Unit>> changePassword({
    required Password currentPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  });

  /// Signs out the user.
  Future<void> logout();

  /// Checks if the user is already authenticated.
  Future<bool> checkAuthenticated();
}
