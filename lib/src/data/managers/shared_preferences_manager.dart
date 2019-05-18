import 'package:flutter_door_buzzer/src/data/repositories/preferences_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// One of the possible Implementation of PreferencesService Interface
class SharedPreferencesManager implements PreferencesRepository {
  static const String _KEY_OAUTH_ACCESS_TOKEN = 'OAUTH_ACCESS_TOKEN';
  static const String _KEY_OAUTH_ACCESS_TOKEN_EXPIRATION =
      'OAUTH_ACCESS_TOKEN_EXPIRATION';
  static const String _KEY_OAUTH_REFRESH_TOKEN = 'OAUTH_REFRESH_TOKEN';
  static const String _KEY_OAUTH_REFRESH_TOKEN_EXPIRATION =
      'OAUTH_REFRESH_TOKEN_EXPIRATION';
  static const String _KEY_AUTH_CONNECTED = 'AUTH_CONNECTED';
  static const String _KEY_USER_ID = 'USER_ID';
  static const String _KEY_USER_EMAIL = 'USER_EMAIL';
  static const String _KEY_APP_THEME = 'APP_THEME';

  FlutterSecureStorage storage;

  SharedPreferencesManager() {
    storage = FlutterSecureStorage();
  }

  /// ----------------------------------------------------------
  /// ------------------------- Tokens -------------------------
  /// ----------------------------------------------------------

  Future<String> getAccessToken() async {
    return await storage.read(key: _KEY_OAUTH_ACCESS_TOKEN);
  }

  Future<void> setAccessToken(String accessToken) async {
    return await storage.write(
      key: _KEY_OAUTH_ACCESS_TOKEN,
      value: accessToken,
    );
  }

  Future<void> deleteAccessToken() async {
    return await storage.delete(key: _KEY_OAUTH_ACCESS_TOKEN);
  }

  Future<int> getAccessTokenExpiration() async {
    return (await storage.read(key: _KEY_OAUTH_ACCESS_TOKEN_EXPIRATION)) ?? 0;
  }

  Future<void> setAccessTokenExpiration(int accessTokenExpiration) async {
    return await storage.write(
      key: _KEY_OAUTH_ACCESS_TOKEN_EXPIRATION,
      value: accessTokenExpiration as String,
    );
  }

  Future<void> deleteAccessTokenExpiration() async {
    return await storage.delete(key: _KEY_OAUTH_ACCESS_TOKEN_EXPIRATION);
  }

  Future<String> getRefreshToken() async {
    return await storage.read(key: _KEY_OAUTH_REFRESH_TOKEN);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    return await storage.write(
      key: _KEY_OAUTH_REFRESH_TOKEN,
      value: refreshToken,
    );
  }

  Future<void> deleteRefreshToken() async {
    return await storage.delete(key: _KEY_OAUTH_REFRESH_TOKEN);
  }

  Future<String> getRefreshTokenExpiration() async {
    return storage.read(key: _KEY_OAUTH_REFRESH_TOKEN_EXPIRATION) ?? '';
  }

  Future<void> setRefreshTokenExpiration(String refreshTokenExpiration) async {
    return storage.write(
      key: _KEY_OAUTH_REFRESH_TOKEN_EXPIRATION,
      value: refreshTokenExpiration,
    );
  }

  Future<void> deleteRefreshTokenExpiration() async {
    return storage.delete(key: _KEY_OAUTH_REFRESH_TOKEN_EXPIRATION);
  }

  /// ----------------------------------------------------------
  /// ----------------------- Connected ------------------------
  /// ----------------------------------------------------------

  Future<bool> isAuthConnected() async {
    return storage.read(key: _KEY_AUTH_CONNECTED) as bool;
  }

  Future<void> setAuthConnected(bool connected) async {
    return storage.write(
      key: _KEY_AUTH_CONNECTED,
      value: connected as String,
    );
  }

  Future<void> deleteAuthConnected() async {
    return storage.delete(key: _KEY_AUTH_CONNECTED);
  }

  /// ----------------------------------------------------------
  /// ------------------------- User ---------------------------
  /// ----------------------------------------------------------

  Future<void> setUserId(String userId) async {
    return storage.write(
      key: _KEY_USER_ID,
      value: userId,
    );
  }

  Future<String> getUserId() async {
    return storage.read(key: _KEY_USER_ID);
  }

  Future<void> deleteUserId() async {
    return storage.delete(key: _KEY_USER_ID);
  }

  Future<void> setUserEmail(String userEmail) async {
    return storage.write(
      key: _KEY_USER_EMAIL,
      value: userEmail,
    );
  }

  Future<String> getUserEmail() async {
    return storage.read(key: _KEY_USER_EMAIL);
  }

  Future<void> deleteUserEmail() async {
    return storage.delete(key: _KEY_USER_EMAIL);
  }

  /// ----------------------------------------------------------
  /// ------------------------- Theme --------------------------
  /// ----------------------------------------------------------

  Future<String> getAppTheme() async {
    return storage.read(key: _KEY_APP_THEME);
  }

  Future<void> setAppTheme(String theme) async {
    return storage.write(
      key: _KEY_APP_THEME,
      value: theme,
    );
  }

  Future<void> deleteAppTheme() async {
    return storage.delete(key: _KEY_APP_THEME);
  }

  /// ----------------------------------------------------------
  /// -------------------------- All ---------------------------
  /// ----------------------------------------------------------

  Future deleteAll() async {
    storage.deleteAll();
  }
}
