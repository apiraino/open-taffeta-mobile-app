import 'package:flutter_door_buzzer/src/data/managers/app_shared_preferences_manager.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:meta/meta.dart';

class LocalAppPreferencesRepository implements AppPreferencesRepository {
  final AppSharedPreferencesManager appSharedPreferencesManager;

  LocalAppPreferencesRepository({@required this.appSharedPreferencesManager})
      : assert(
          appSharedPreferencesManager != null,
          'No $AppSharedPreferencesManager given',
        );

  @override
  Future deleteAll() async {
    // TODO: implement deleteAll
    return null;
  }

  @override
  Future<void> deleteAppTheme() async {
    // TODO: implement deleteAppTheme
    return null;
  }

  @override
  Future<void> deleteUserEmail() async {
    // TODO: implement deleteUserEmail
    return null;
  }

  @override
  Future<void> deleteUserId() async {
    // TODO: implement deleteUserId
    return null;
  }

  @override
  Future<String> getAppTheme() async {
    // TODO: implement getAppTheme
    return null;
  }

  @override
  Future<String> getUserEmail() async {
    // TODO: implement getUserEmail
    return null;
  }

  @override
  Future<String> getUserId() {
    // TODO: implement getUserId
    return null;
  }

  @override
  Future<void> setAppTheme(String theme) async {
    // TODO: implement setAppTheme
    return null;
  }

  @override
  Future<void> setUserEmail(String userEmail) async {
    // TODO: implement setUserEmail
    return null;
  }

  @override
  Future<void> setUserId(String userId) async {
    // TODO: implement setUserId
    return null;
  }
}
