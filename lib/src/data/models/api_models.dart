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

/// ----------------------------------------------------------------------------
///                              User
/// ----------------------------------------------------------------------------

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

/// ----------------------------------------------------------------------------
///                            Envelop
/// ----------------------------------------------------------------------------

abstract class _Envelop {
  @JsonKey(name: 'error')
  final bool error;

  @JsonKey(name: 'message')
  final String message;

  _Envelop({
    this.error,
    this.message,
  });
}

@JsonSerializable()
class DataEnvelop<T> extends _Envelop {
  @_GenericListConverter()
  T data;

  DataEnvelop({
    bool error,
    String message,
    this.data,
  }) : super(error: error, message: message);

  factory DataEnvelop.fromJson(Map<String, dynamic> json) =>
      _$DataEnvelopFromJson<T>(json);

  Map<String, dynamic> toJson() => _$DataEnvelopToJson<T>(this);
}

@JsonSerializable()
class DataArrayEnvelop<T> extends _Envelop {
  @_GenericListConverter()
  List<T> data;

  int total;

  DataArrayEnvelop({
    bool error,
    String message,
    this.data,
    this.total,
  }) : super(error: error, message: message);

  factory DataArrayEnvelop.fromJson(Map<String, dynamic> json) =>
      _$DataArrayEnvelopFromJson<T>(json);

  Map<String, dynamic> toJson() => _$DataArrayEnvelopToJson<T>(this);
}

/// Example of model with GenericCollection
/// https://github.com/dart-lang/json_serializable/blob/ee2c5c788279af01860624303abe16811850b82c/example/lib/json_converter_example.dart
class _GenericListConverter<T> implements JsonConverter<T, Object> {
  const _GenericListConverter();

  @override
  T fromJson(Object json) {
    print('fromJson');
    final T t = (T as dynamic)?.fromJson(json) as T
        // This will only work if `json` is a native JSON type:
        //   num, String, bool, null, etc
        // *and* is assignable to `T`.
        ??
        json as T;

    if (t == null) {
      throw Exception('Type $T no supported');
    }
    return t;
  }

  @override
  Object toJson(T object) {
    print('toJson');
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return (object as dynamic)?.toJson() ?? object;
  }
}
