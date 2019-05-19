/// Interface for all app preferences repositories
abstract class AppPreferencesRepository {
  Future<void> setUserId(String userId);

  Future<String> getUserId();

  Future<void> deleteUserId();

  Future<void> setUserEmail(String userEmail);

  Future<String> getUserEmail();

  Future<void> deleteUserEmail();

  Future<String> getAppTheme();

  Future<void> setAppTheme(String theme);

  Future<void> deleteAppTheme();

  Future deleteAll();
}
