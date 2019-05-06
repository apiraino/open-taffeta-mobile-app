import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_models.g.dart';

////////////////////////////////////////////////////////////////////////////////
//                              Auth                                          //
////////////////////////////////////////////////////////////////////////////////
@JsonSerializable()
class AuthSignupRequestModel {
  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  AuthSignupRequestModel({
    this.email,
    this.password,
  });

  factory AuthSignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSignupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSignupRequestModelToJson(this);
}

@JsonSerializable()
class AuthSignupResponseModel {
  @JsonKey(name: 'user')
  final UserModel user;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'detail')
  final String detail;

  AuthSignupResponseModel({
    this.user,
    this.status,
    this.detail,
  });

  factory AuthSignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSignupResponseModelToJson(this);
}

@JsonSerializable()
class AuthLoginRequestModel {
  @JsonKey(name: 'username')
  String username;

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
class AuthLoginResponseModel {
  @JsonKey(name: 'user')
  final UserModel user;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'detail')
  final String detail;

  AuthLoginResponseModel({
    this.user,
    this.status,
    this.detail,
  });

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginResponseModelToJson(this);
}

////////////////////////////////////////////////////////////////////////////////
//                           Buzzer                                           //
////////////////////////////////////////////////////////////////////////////////
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
