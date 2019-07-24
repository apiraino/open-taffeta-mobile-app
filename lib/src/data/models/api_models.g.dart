// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignUpRequestModel _$AuthSignUpRequestModelFromJson(
    Map<String, dynamic> json) {
  return AuthSignUpRequestModel(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$AuthSignUpRequestModelToJson(
        AuthSignUpRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

AuthLoginRequestModel _$AuthLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return AuthLoginRequestModel(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$AuthLoginRequestModelToJson(
        AuthLoginRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return AuthResponseModel(
      auth: json['auth'] == null
          ? null
          : AuthModel.fromJson(json['auth'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserDataModel.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{'auth': instance.auth, 'user': instance.user};

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return AuthModel(
      clientId: json['client_id'] as String,
      accessTokenExpiration:
          json['exp'] == null ? null : DateTime.parse(json['exp'] as String),
      accessToken: json['token'] as String,
      userId: json['user_id'] as int);
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'client_id': instance.clientId,
      'exp': instance.accessTokenExpiration?.toIso8601String(),
      'token': instance.accessToken,
      'user_id': instance.userId
    };

BuzzerRequestModel _$BuzzerRequestModelFromJson(Map<String, dynamic> json) {
  return BuzzerRequestModel(authorization: json['authorization'] as String);
}

Map<String, dynamic> _$BuzzerRequestModelToJson(BuzzerRequestModel instance) =>
    <String, dynamic>{'authorization': instance.authorization};

BuzzerResponseModel _$BuzzerResponseModelFromJson(Map<String, dynamic> json) {
  return BuzzerResponseModel(
      status: json['status'] as String, details: json['detail'] as String);
}

Map<String, dynamic> _$BuzzerResponseModelToJson(
        BuzzerResponseModel instance) =>
    <String, dynamic>{'status': instance.status, 'detail': instance.details};

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) {
  return UserResponseModel(
      user: json['user'] == null
          ? null
          : UserDataModel.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{'user': instance.user};

DataEnvelop<T> _$DataEnvelopFromJson<T>(Map<String, dynamic> json) {
  return DataEnvelop<T>(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : _GenericListConverter<T>().fromJson(json['data']));
}

Map<String, dynamic> _$DataEnvelopToJson<T>(DataEnvelop<T> instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data == null
          ? null
          : _GenericListConverter<T>().toJson(instance.data)
    };

DataArrayEnvelop<T> _$DataArrayEnvelopFromJson<T>(Map<String, dynamic> json) {
  return DataArrayEnvelop<T>(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          ?.map(
              (e) => e == null ? null : _GenericListConverter<T>().fromJson(e))
          ?.toList(),
      total: json['total'] as int);
}

Map<String, dynamic> _$DataArrayEnvelopToJson<T>(
        DataArrayEnvelop<T> instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data
          ?.map((e) => e == null ? null : _GenericListConverter<T>().toJson(e))
          ?.toList(),
      'total': instance.total
    };
