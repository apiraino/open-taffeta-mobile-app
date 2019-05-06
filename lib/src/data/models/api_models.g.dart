// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSignupRequestModel _$AuthSignupRequestModelFromJson(
    Map<String, dynamic> json) {
  return AuthSignupRequestModel(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$AuthSignupRequestModelToJson(
        AuthSignupRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

AuthSignupResponseModel _$AuthSignupResponseModelFromJson(
    Map<String, dynamic> json) {
  return AuthSignupResponseModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      detail: json['detail'] as String);
}

Map<String, dynamic> _$AuthSignupResponseModelToJson(
        AuthSignupResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'detail': instance.detail
    };

AuthLoginRequestModel _$AuthLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return AuthLoginRequestModel(
      email: json['email'] as String, password: json['password'] as String)
    ..username = json['username'] as String;
}

Map<String, dynamic> _$AuthLoginRequestModelToJson(
        AuthLoginRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password
    };

AuthLoginResponseModel _$AuthLoginResponseModelFromJson(
    Map<String, dynamic> json) {
  return AuthLoginResponseModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      detail: json['detail'] as String);
}

Map<String, dynamic> _$AuthLoginResponseModelToJson(
        AuthLoginResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'detail': instance.detail
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
