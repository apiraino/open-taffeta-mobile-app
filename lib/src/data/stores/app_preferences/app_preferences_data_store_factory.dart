import 'package:flutter_door_buzzer/src/data/stores/app_preferences/app_preferences_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/app_preferences/disk_app_preferences_data_store.dart';

class AppPreferencesDataStoreFactory {
  DiskAppPreferencesDataStore diskDataStore;

  /// Create delegation to return the sustainable [AppPreferencesDataStore]
  AppPreferencesDataStore create() {
    return diskDataStore ??= DiskAppPreferencesDataStore();
  }
}
