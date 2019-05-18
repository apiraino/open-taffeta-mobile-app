import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_door_buzzer/src/data/managers/api_interceptor.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

class BuzzerApiManager {
  final String baseUrl;

  BuzzerApiManager({
    @required this.baseUrl,
    @required ApiInterceptor apiInterceptor,
    int connectTimeoutSecond = 10,
  })  : assert(baseUrl != null, 'No base url given'),
        assert(apiInterceptor != null, 'No $ApiInterceptor given') {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeoutSecond * 1000,
      contentType: ContentType.json,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _dio.interceptors.add(apiInterceptor.interceptorWrapper);
  }

  Dio _dio;

  final String _pathSignup = '/signup';
  final String _pathLogin = '/login';
  final String _pathDoors = '/door';

  /// Login
  Future<AuthLoginResponseModel> login({
    @required String email,
    @required String password,
  }) async {
    AuthLoginRequestModel request = AuthLoginRequestModel();

    Response response = await _dio.post(_pathLogin, data: jsonEncode(request));
    return AuthLoginResponseModel.fromJson(response.data);
  }

  /// Register
  Future<AuthSignupResponseModel> register({
    @required String email,
    @required String password,
  }) async {
    AuthSignupRequestModel request = AuthSignupRequestModel(
      email: email,
      password: password,
    );

    Response response = await _dio.post(_pathSignup, data: jsonEncode(request));

    return AuthSignupResponseModel.fromJson(response.data);
  }

  Future<BuzzerResponseModel> openDoor({
    @required int doorId,
  }) async {
    Response response = await _dio.post(
      '$_pathDoors/$doorId',

      /// Needed if content-type header must be added to the request
      data: {},
    );
    return BuzzerResponseModel.fromJson(response.data);
  }
}
