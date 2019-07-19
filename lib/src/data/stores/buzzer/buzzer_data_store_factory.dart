import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/stores/buzzer/buzzer_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/buzzer/cloud_buzzer_data_store.dart';
import 'package:meta/meta.dart';

class BuzzerDataStoreFactory {
  final BuzzerApiManager apiManager;

  /// Stores

  CloudBuzzerDataStore _cloudBuzzerDataStore;

  BuzzerDataStoreFactory({@required this.apiManager})
      : assert(apiManager != null, 'No $BuzzerApiManager given');

  /// Create delegation to return the sustainable [BuzzerDataStore]
  BuzzerDataStore create() {
    return _cloudBuzzerDataStore ??= CloudBuzzerDataStore(apiManager);
  }
}
