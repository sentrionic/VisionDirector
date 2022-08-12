import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/core/constants.dart';

/// Module used for injecting singletons and the server urls
@module
abstract class InjectableModule {
  /// The server's base url.
  @Named("BaseUrl")
  String get baseUrl => "http://192.168.2.148:5000";

  /// The server's url for REST requests.
  @Named("HttpUrl")
  String get httpUrl => "$baseUrl/api";

  /// The server's url for Websockets requests related to scenario events.
  @Named("WSUrl")
  String get wsUrl => "$baseUrl/ws";

  /// The server's url for Websockets requests related to task events.
  @Named("ChatUrl")
  String get chatUrl => "$baseUrl/chat";

  /// An instance of the `Dio` client that automatically adds the `AuthToken`
  /// and `HttpUrl` to each request.
  @lazySingleton
  Dio dio(
    @Named("HttpUrl") String url,
    FlutterSecureStorage storage,
  ) {
    final dio = Dio(
      BaseOptions(baseUrl: url, responseType: ResponseType.plain),
    );

    // add the authorization token to each request if it exists
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: AppConstants.tokenKey);
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options); // continue
        },
      ),
    );

    return dio;
  }

  /// An instance of `FlutterSecureStorage` to store info.
  @lazySingleton
  FlutterSecureStorage storage() => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );
}
