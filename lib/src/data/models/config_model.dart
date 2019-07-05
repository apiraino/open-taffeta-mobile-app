import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'config_model.g.dart';

@JsonSerializable()
class ConfigDataModel {
  @JsonKey(name: 'apiServerUrl')
  String apiServerUrl;
  @JsonKey(name: 'clientId')
  String clientId;
  @JsonKey(name: 'clientSecret')
  String clientSecret;
  @JsonKey(name: 'doorId')
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

  @override
  String toString() =>
      '$runtimeType{ apiServerUrl: $apiServerUrl, clientId: $clientId, clientSecret: $clientSecret, doorId: $doorId }';
}
