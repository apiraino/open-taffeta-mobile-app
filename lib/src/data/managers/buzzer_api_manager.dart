import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_door_buzzer/src/data/managers/api_interceptors.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

/// [BuzzerApiManager] is the direct and should be the only one to manage
/// the communication with the BuzzerAPI
///
/// It can use many interceptors to keep the communication stateless
/// (e.g. authentication).
class BuzzerApiManager {
  final String baseUrl;
  final TokenInterceptor tokenInterceptor;

  BuzzerApiManager({
    @required this.baseUrl,
    @required this.tokenInterceptor,
    int connectTimeoutSecond = 10,
  })  : assert(baseUrl != null, 'No base url given'),
        assert(tokenInterceptor != null, 'No $TokenInterceptor given') {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeoutSecond * 1000,
      contentType: ContentType.json,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);

    // Add all interceptors
    _dio.interceptors.add(tokenInterceptor.interceptorWrapper);

    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: checkApiResponse,
      onError: apiErrorCatcher,
    ));
  }

  Dio _dio;

  final String _pathSignUp = '/signup';
  final String _pathLogin = '/login';
  final String _pathDoors = '/door';
  final String _pathUsers = '/users';

  /// --------------------------------------------------------------------------
  ///                                   Auth
  /// --------------------------------------------------------------------------

  /// Login
  Future<AuthResponseModel> authenticate({
    @required String email,
    @required String password,
  }) async {
    try {
      final request = AuthLoginRequestModel(
        email: email,
        password: password,
      );

      final Response<Map<String, dynamic>> response =
          await _dio.post(_pathLogin, data: jsonEncode(request));

      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.error ?? e;
    }
  }

  /// Register with [email] and [password]
  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  }) async {
    try {
      final request = AuthSignUpRequestModel(
        email: email,
        password: password,
      );

      final Response<Map<String, dynamic>> response =
          await _dio.post(_pathSignUp, data: jsonEncode(request));

      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.error ?? e;
    }
  }

  /// Logout
  Future<void> logout() async {
    await tokenInterceptor.deleteAuthData();
  }

  /// --------------------------------------------------------------------------
  ///                                   Doors
  /// --------------------------------------------------------------------------

  /// Open door [doorId]
  Future<BuzzerResponseModel> openDoor({
    @required int doorId,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.post(
        '$_pathDoors/$doorId',

        // Needed if content-type header is specified
        data: {},
      );
      return BuzzerResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.error ?? e;
    }
  }

  /// --------------------------------------------------------------------------
  ///                                  Users
  /// --------------------------------------------------------------------------

  /// Fetch User [userId] details
  Future<UserResponseModel> getUser({@required int userId}) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.get(
        '$_pathUsers/$userId',
      );

      return UserResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.error ?? e;
    }
  }
}
