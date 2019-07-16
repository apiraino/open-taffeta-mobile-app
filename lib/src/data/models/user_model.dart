import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'role')
  String role;

  @JsonKey(name: 'is_active')
  bool isActive;

  UserModel({
    this.id,
    this.email,
    this.role,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
