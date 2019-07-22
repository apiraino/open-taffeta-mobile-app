import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_models.g.dart';

/// ----------------------------------------------------------------------------
///                              Auth
/// ----------------------------------------------------------------------------

@JsonSerializable()
class AuthSignUpRequestModel {
  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  AuthSignUpRequestModel({
    this.email,
    this.password,
  });

  factory AuthSignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSignUpRequestModelToJson(this);
}

@JsonSerializable()
class AuthLoginRequestModel {
  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  AuthLoginRequestModel({
    this.email,
    this.password,
  });

  factory AuthLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginRequestModelToJson(this);
}

@JsonSerializable()
class AuthResponseModel {
  @JsonKey(name: 'auth')
  final AuthModel auth;

  @JsonKey(name: 'user')
  final UserDataModel user;

  AuthResponseModel({
    this.auth,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable()
class AuthModel {
  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'exp')
  final DateTime accessTokenExpiration;

  @JsonKey(name: 'token')
  final String accessToken;

  @JsonKey(name: 'user_id')
  final int userId;

  AuthModel({
    this.clientId,
    this.accessTokenExpiration,
    this.accessToken,
    this.userId,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

/// ----------------------------------------------------------------------------
///                           Buzzer
/// ----------------------------------------------------------------------------

@JsonSerializable()
class BuzzerRequestModel {
  @JsonKey(name: 'authorization')
  final String authorization;

  BuzzerRequestModel({
    this.authorization,
  });

  factory BuzzerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BuzzerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuzzerRequestModelToJson(this);
}

@JsonSerializable()
class BuzzerResponseModel {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'detail')
  final String details;

  BuzzerResponseModel({
    this.status,
    this.details,
  });

  factory BuzzerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BuzzerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuzzerResponseModelToJson(this);
}

/// Users
///

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: 'user')
  final UserDataModel user;

  UserResponseModel({
    this.user,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
