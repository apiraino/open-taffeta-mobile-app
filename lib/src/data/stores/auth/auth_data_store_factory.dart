import 'package:flutter_door_buzzer/src/data/stores/auth/auth_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/auth/disk_auth_data_store.dart';

class AuthDataStoreFactory {
  /// Stores

  DiskAuthDataStore _diskDataStore;

  AuthDataStoreFactory({DiskAuthDataStore diskDataStore})
      : _diskDataStore = diskDataStore;

  /// Create delegation to return the sustainable [AuthDataStore]
  AuthDataStore create() {
    return _diskDataStore ??= DiskAuthDataStore();
  }
}
