import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_door_buzzer/domain.dart' as domain;
import 'package:flutter_door_buzzer/src/data/exceptions/api_exceptions.dart';

class TokenInterceptor {
  String _accessToken;
  InterceptorsWrapper _interceptorWrapper;

  InterceptorsWrapper get interceptorWrapper => _interceptorWrapper;

  TokenInterceptor({String accessToken}) {
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

/// Parse response to check if there is any error
dynamic checkApiResponse(Response response, {StackTrace stackTrace}) {
  // TODO: use Envelop type for Response body
  final Map<String, dynamic> body = response.data as Map<String, dynamic>;
  final String apiErrorCode = body['error'] as String;
  final String apiMessage = body['message'] as String;

  if (apiErrorCode != null) {
    throw ApiException.fromDioRequest(
      errorCode: apiErrorCode,
      message: apiMessage,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
  return response;
}

dynamic apiErrorCatcher(dynamic err) {
  if (err is DioError && err.response != null) {
    final Response response = err.response;

    checkApiResponse(response, stackTrace: err.stackTrace);

    final statusCode = err?.response?.statusCode;
    final statusMessage = err?.response?.statusMessage;
    final stackTrace = err?.stackTrace;
    if (statusCode != null) {
      throw domain.HttpException(
        statusCode: statusCode,
        statusMessage: statusMessage,
        stackTrace: stackTrace ?? StackTrace.current,
      );
    }
  }
  return err;
}
