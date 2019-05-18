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

AuthSignUpResponseModel _$AuthSignUpResponseModelFromJson(
    Map<String, dynamic> json) {
  return AuthSignUpResponseModel(
      auth: json['auth'] == null
          ? null
          : AuthModel.fromJson(json['auth'] as Map<String, dynamic>),
      isActive: json['is_active'] as bool);
}

Map<String, dynamic> _$AuthSignUpResponseModelToJson(
        AuthSignUpResponseModel instance) =>
    <String, dynamic>{'auth': instance.auth, 'is_active': instance.isActive};

AuthLoginRequestModel _$AuthLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return AuthLoginRequestModel(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$AuthLoginRequestModelToJson(
        AuthLoginRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

AuthLoginResponseModel _$AuthLoginResponseModelFromJson(
    Map<String, dynamic> json) {
  return AuthLoginResponseModel(
      auth: json['auth'] == null
          ? null
          : AuthModel.fromJson(json['auth'] as Map<String, dynamic>),
      isActive: json['is_active'] as bool);
}

Map<String, dynamic> _$AuthLoginResponseModelToJson(
        AuthLoginResponseModel instance) =>
    <String, dynamic>{'auth': instance.auth, 'is_active': instance.isActive};

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
