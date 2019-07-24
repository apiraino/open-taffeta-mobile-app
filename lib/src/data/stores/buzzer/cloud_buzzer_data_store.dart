import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/stores/buzzer/buzzer_data_store.dart';

class CloudBuzzerDataStore implements BuzzerDataStore {
  final BuzzerApiManager apiManager;

  CloudBuzzerDataStore(this.apiManager)
      : assert(apiManager != null, 'No $BuzzerApiManager given');

  /// --------------------------------------------------------------------------
  ///                                   Auth
  /// --------------------------------------------------------------------------

  @override
  Future<AuthResponseModel> login({String email, String password}) {
    return apiManager.authenticate(email: email, password: password);
  }

  @override
  Future<AuthResponseModel> register({String email, String password}) {
    return apiManager.register(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return apiManager.logout();
  }

  /// --------------------------------------------------------------------------
  ///                                   Users
  /// --------------------------------------------------------------------------

  @override
  Future<UserResponseModel> getUser({int userId}) {
    return apiManager.getUser(userId: userId);
  }

  /// --------------------------------------------------------------------------
  ///                                   Doors
  /// --------------------------------------------------------------------------

  @override
  Future<BuzzerResponseModel> openDoor({int doorId}) {
    return apiManager.openDoor(doorId: doorId);
  }
}
