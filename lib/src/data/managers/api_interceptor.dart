import 'dart:io';

import 'package:dio/dio.dart';

class ApiInterceptor {
  String _accessToken;
  InterceptorsWrapper _interceptorWrapper;

  InterceptorsWrapper get interceptorWrapper => _interceptorWrapper;

  ApiInterceptor({String accessToken}) {
    _accessToken = accessToken;
    _interceptorWrapper =
        InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse);
  }

  RequestOptions onRequest(RequestOptions options) {
    if (_accessToken != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: '$_accessToken',
      });
    }
    return options;
  }

  Response onResponse(Response<dynamic> response) {
    var data = response.data;
    if (data['user'] != null) {
      var token = data['user']['token'];
      if (token != null) {
        _accessToken = token;
      }
    }
    return response;
  }
}
