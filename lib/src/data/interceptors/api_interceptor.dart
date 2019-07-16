import 'dart:io';

import 'package:dio/dio.dart';

class ApiInterceptor {
  String _accessToken;
  InterceptorsWrapper _interceptorWrapper;

  InterceptorsWrapper get interceptorWrapper => _interceptorWrapper;

  ApiInterceptor({String accessToken}) {
    _accessToken = accessToken;
    _interceptorWrapper =
        InterceptorsWrapper(onRequest: _onRequest, onResponse: _onResponse);
  }

  RequestOptions _onRequest(RequestOptions options) {
    if (_accessToken != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: '$_accessToken',
      });
    }
    return options;
  }

  Response _onResponse(Response<dynamic> response) {
    final data = response.data;
    if (data['auth'] != null && data['auth']['token'] != null) {
      _accessToken = data['auth']['token'] as String;
    }
    return response;
  }

  Future<void> deleteAuthData() async {
    _accessToken = null;
  }
}
