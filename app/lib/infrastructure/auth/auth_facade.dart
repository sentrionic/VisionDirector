import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/domain/auth/auth_failure.dart';
import 'package:vision_director/domain/auth/i_auth_facade.dart';
import 'package:vision_director/domain/auth/value_objects.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/infrastructure/auth/auth_dto.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthFacade(this._dio, this._storage);

  @override
  Future<Either<AuthFailure, Account>> login({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailString = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final response = await _dio.post(
        '/account/login',
        data: {"email": emailString, "password": passwordStr},
      );

      final results = jsonDecode(response.data);
      final body = AuthDto.fromJson(results);
      _saveToken(body.token);

      return right(body.user.toDomain());
    } on DioError catch (err) {
      if (err.response?.statusCode == 401) {
        return left(const AuthFailure.invalidCredentials());
      }
      return left(const AuthFailure.serverError());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Account>> register({
    required EmailAddress emailAddress,
    required Username username,
    required Password password,
  }) async {
    final emailString = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final usernameStr = username.getOrCrash();

    try {
      final response = await _dio.post(
        '/account/register',
        data: {
          "email": emailString,
          "password": passwordStr,
          "username": usernameStr
        },
      );

      final results = jsonDecode(response.data);
      final body = AuthDto.fromJson(results);
      _saveToken(body.token);

      return right(body.user.toDomain());
    } on DioError catch (err) {
      debugLog(err);
      return left(const AuthFailure.serverError());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Account>> updateAccount({
    required EmailAddress emailAddress,
    required Username username,
  }) async {
    final emailString = emailAddress.getOrCrash();
    final usernameStr = username.getOrCrash();

    try {
      final response = await _dio.put(
        '/account',
        data: {"email": emailString, "username": usernameStr},
      );

      final results = jsonDecode(response.data);
      final body = AuthDto.fromJson(results);
      _saveToken(body.token);

      return right(body.user.toDomain());
    } on DioError catch (err) {
      debugLog(err);
      debugLog(err.response);
      return left(const AuthFailure.serverError());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> changePassword({
    required Password currentPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  }) async {
    final currentPasswordStr = currentPassword.getOrCrash();
    final newPasswordStr = newPassword.getOrCrash();
    final confirmNewPasswordStr = confirmNewPassword.getOrCrash();

    try {
      await _dio.put(
        '/account/change-password',
        data: {
          "currentPassword": currentPasswordStr,
          "newPassword": newPasswordStr,
          "confirmNewPassword": confirmNewPasswordStr
        },
      );

      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      return left(const AuthFailure.serverError());
    } on SocketException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<bool> checkAuthenticated() async {
    final token = await _storage.read(key: AppConstants.tokenKey);
    return token != null;
  }

  @override
  Future<void> logout() async => _storage.delete(key: AppConstants.tokenKey);

  /// Stores the token on the phone
  Future<void> _saveToken(String authToken) async =>
      _storage.write(key: AppConstants.tokenKey, value: authToken);
}
