import 'package:flutter_door_buzzer/domain.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'config_model.g.dart';

@JsonSerializable()
class ConfigDataModel implements ConfigEntity {
  @JsonKey(name: 'apiServerUrl')
  @override
  String apiServerUrl;

  @JsonKey(name: 'clientId')
  @override
  String clientId;

  @JsonKey(name: 'clientSecret')
  @override
  String clientSecret;

  @JsonKey(name: 'doorId')
  @override
  int doorId;

  ConfigDataModel({
    @required this.apiServerUrl,
    @required this.clientId,
    @required this.clientSecret,
    @required this.doorId,
  }) : super();

  factory ConfigDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigDataModelToJson(this);
}
