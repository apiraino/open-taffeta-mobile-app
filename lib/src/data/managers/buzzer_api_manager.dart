import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_door_buzzer/src/data/interceptors/api_interceptor.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

class BuzzerApiManager {
  final String baseUrl;
  final ApiInterceptor apiInterceptor;

  BuzzerApiManager({
    @required this.baseUrl,
    @required this.apiInterceptor,
    int connectTimeoutSecond = 10,
  })  : assert(baseUrl != null, 'No base url given'),
        assert(apiInterceptor != null, 'No $ApiInterceptor given') {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeoutSecond * 1000,
      contentType: ContentType.json,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _dio.interceptors.add(apiInterceptor.interceptorWrapper);
  }

  Dio _dio;

  final String _pathSignUp = '/signup';
  final String _pathLogin = '/login';
  final String _pathDoors = '/door';
  final String _pathUsers = '/users';

  /// Login
  Future<AuthResponseModel> login({
    @required String email,
    @required String password,
  }) async {
    final request = AuthLoginRequestModel(
      email: email,
      password: password,
    );

    final Response<Map<String, dynamic>> response =
        await _dio.post(_pathLogin, data: jsonEncode(request));

    return AuthResponseModel.fromJson(response.data);
  }

  /// Register
  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  }) async {
    final request = AuthSignUpRequestModel(
      email: email,
      password: password,
    );

    final Response<Map<String, dynamic>> response =
        await _dio.post(_pathSignUp, data: jsonEncode(request));

    return AuthResponseModel.fromJson(response.data);
  }

  /// Logout
  Future<void> logout() async {
    await apiInterceptor.deleteAuthData();
  }

  /// Open door
  Future<BuzzerResponseModel> openDoor({
    @required int doorId,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio.post(
      '$_pathDoors/$doorId',

      // Needed if content-type header is specified
      data: {},
    );
    return BuzzerResponseModel.fromJson(response.data);
  }

  /// Fetch User details
 Future<UserResponseModel> getUser({@required int userId})async{
   final Response<Map<String, dynamic>> response = await _dio.get(
     '$_pathUsers/$userId',
   );
   return UserResponseModel.fromJson(response.data);
 }
}
