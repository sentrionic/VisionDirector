import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/domain/auth/value_objects.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class AuthDto with _$AuthDto {
  const AuthDto._();

  const factory AuthDto({
    required String token,
    required UserDto user,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);
}

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String username,
    required String email,
    required String role,
  }) = _UserDto;

  Account toDomain() {
    return Account(
      id: id,
      username: Username(username),
      email: EmailAddress(email),
      role: Roles.values.firstWhere(
        (e) => describeEnum(e).toLowerCase() == role.toLowerCase(),
      ),
    );
  }

  factory UserDto.fromDomain(Account account) => UserDto(
        id: account.id,
        username: account.username.getOrCrash(),
        email: account.email.getOrCrash(),
        role: account.role.name,
      );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
