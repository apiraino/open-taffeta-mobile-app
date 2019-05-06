import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'token')
  String token;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
