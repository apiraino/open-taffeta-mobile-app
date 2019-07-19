/// Domain layer's interface for the application preferences repositories
abstract class AppPreferencesRepository {
  Future<bool> getDarkMode();

  Future<void> toggleDarkMode(bool darkMode);

  Future<void> deleteDarkMode();

  Future deleteAll();
}
