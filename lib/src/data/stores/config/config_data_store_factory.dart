import 'package:flutter_door_buzzer/src/data/stores/buzzer/buzzer_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/config/config_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/config/disk_config_data_store.dart';

class ConfigDataStoreFactory {
  /// Stores

  DiskConfigDataStore _diskDataStore;

  ConfigDataStoreFactory({DiskConfigDataStore diskDataStore})
      : _diskDataStore = diskDataStore;

  /// Create delegation to return the sustainable [BuzzerDataStore]
  ConfigDataStore create() {
    return _diskDataStore ??= DiskConfigDataStore();
  }
}
