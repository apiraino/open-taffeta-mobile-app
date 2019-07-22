import 'package:flutter_door_buzzer/data.dart';

class AuthInfoDataStoreFactory {
  /// Stores

  DiskAuthInfoDataStore _diskDataStore;

  AuthInfoDataStoreFactory({DiskAuthInfoDataStore diskDataStore})
      : _diskDataStore = diskDataStore;

  /// Create delegation to return the sustainable [AuthDataStore]
  AuthInfoDataStore create() {
    return _diskDataStore ??= DiskAuthInfoDataStore();
  }
}
