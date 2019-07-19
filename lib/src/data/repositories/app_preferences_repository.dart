import 'package:flutter_door_buzzer/src/data/stores/app_preferences/app_preferences_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/app_preferences_repository.dart';
import 'package:meta/meta.dart';

///
class ImplAppPreferencesRepository implements AppPreferencesRepository {
  final AppPreferencesDataStoreFactory factory;

  ImplAppPreferencesRepository({@required this.factory})
      : assert(
          factory != null,
          'No $AppPreferencesDataStoreFactory given',
        );

  @override
  Future<bool> getDarkMode() async {
    return await factory.create().getDarkMode();
  }

  @override
  Future<void> toggleDarkMode(bool darkMode) async {
    return await factory.create().toggleDarkMode(darkMode);
  }

  @override
  Future<void> deleteDarkMode() async {
    return await factory.create().deleteDarkMode();
  }

  @override
  Future<void> deleteAll() async {
    return await factory.create().deleteAll();
  }
}
