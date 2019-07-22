// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return UserDataModel(
      id: json['id'] as int,
      email: json['email'] as String,
      role: json['role'] as String,
      isActive: json['is_active'] as bool);
}

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'is_active': instance.isActive
    };
