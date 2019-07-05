import 'package:flutter_door_buzzer/src/data/managers/config_assets_manager.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:meta/meta.dart';

class LocalConfigRepository implements ConfigRepository {
  final ConfigAssetsManager localConfigManager;

  LocalConfigRepository({@required this.localConfigManager})
      : assert(
          localConfigManager != null,
          'No $LocalConfigRepository given',
        );

  @override
  Future<String> getApiServerUrl() async {
    return await localConfigManager.getApiServerUrl();
  }

  @override
  Future<String> getClientId() async {
    return await localConfigManager.getClientId();
  }

  @override
  Future<String> getClientSecret() async {
    return await localConfigManager.getClientSecret();
  }

  @override
  Future<int> getDoorId() async {
    return await localConfigManager.getDoorId();
  }

}
