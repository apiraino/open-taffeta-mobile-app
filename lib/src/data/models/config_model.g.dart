// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigDataModel _$ConfigDataModelFromJson(Map<String, dynamic> json) {
  return ConfigDataModel(
      apiServerUrl: json['apiServerUrl'] as String,
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String);
}

Map<String, dynamic> _$ConfigDataModelToJson(ConfigDataModel instance) =>
    <String, dynamic>{
      'apiServerUrl': instance.apiServerUrl,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret
    };
