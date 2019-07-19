import 'package:flutter_door_buzzer/src/data/stores/config/config_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/config_repository.dart';
import 'package:meta/meta.dart';

/// Only implementation of [ConfigRepository]
///
/// Is not using any data store since it should only fetch local info ATM
///
/// From: https://medium.com/@sokrato/storing-your-secret-keys-in-flutter-c0b9af1c0f69
class ImplConfigRepository implements ConfigRepository {
  final ConfigDataStoreFactory factory;

  ImplConfigRepository({@required this.factory})
      : assert(factory != null, 'No $ConfigDataStoreFactory given');

  @override
  Future<String> getApiServerUrl() {
    return factory.create().getApiServerUrl();
  }

  @override
  Future<String> getClientId() {
    return factory.create().getClientId();
  }

  @override
  Future<String> getClientSecret() {
    return factory.create().getClientSecret();
  }

  @override
  Future<int> getDoorId() {
    return factory.create().getDoorId();
  }
}
