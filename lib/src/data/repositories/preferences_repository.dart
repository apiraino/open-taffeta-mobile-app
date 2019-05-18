/// Interface for all Preferences repositories
abstract class PreferencesRepository {
  Future<String> getAccessToken();

  Future<void> setAccessToken(String accessToken);

  Future<void> deleteAccessToken();

  Future<int> getAccessTokenExpiration();

  Future<void> setAccessTokenExpiration(int accessTokenExpiration);

  Future<void> deleteAccessTokenExpiration();

  Future<String> getRefreshToken();

  Future<void> setRefreshToken(String refreshToken);

  Future<void> deleteRefreshToken();

  Future<String> getRefreshTokenExpiration();

  Future<void> setRefreshTokenExpiration(String refreshTokenExpiration);

  Future<void> deleteRefreshTokenExpiration();

  Future<bool> isAuthConnected();

  Future<void> setAuthConnected(bool connected);

  Future<void> deleteAuthConnected();

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
