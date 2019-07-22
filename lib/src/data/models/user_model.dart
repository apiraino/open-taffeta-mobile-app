import 'package:flutter_door_buzzer/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserDataModel implements UserEntity {
  @JsonKey(name: 'id')
  @override
  int id;

  @JsonKey(name: 'email')
  @override
  String email;

  @JsonKey(name: 'role')
  @override
  String role;

  @JsonKey(name: 'is_active')
  @override
  bool isActive;

  UserDataModel({
    this.id,
    this.email,
    this.role,
    this.isActive,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
