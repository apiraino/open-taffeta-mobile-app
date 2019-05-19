import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// One of the possible Implementation of PreferencesService Interface
class AuthSharedPreferencesManager {
  final String _keyOAuthAccessToken = 'OAUTH_ACCESS_TOKEN';
  final String _keyOAuthAccessTokenExpiration = 'OAUTH_ACCESS_TOKEN_EXPIRATION';
  final String _keyOAuthRefreshToken = 'OAUTH_REFRESH_TOKEN';
  final String _keyOAuthRefreshTokenExpiration =
      'OAUTH_REFRESH_TOKEN_EXPIRATION';
  final String _keyAuthConnected = 'AUTH_CONNECTED';

  FlutterSecureStorage storage;

  AuthSharedPreferencesManager() {
    storage = FlutterSecureStorage();
  }

  /// ----------------------------------------------------------
  /// ------------------------- Tokens -------------------------
  /// ----------------------------------------------------------

  Future<String> getAccessToken() async {
    return await storage.read(key: _keyOAuthAccessToken);
  }

  Future<void> setAccessToken(String accessToken) async {
    return await storage.write(
      key: _keyOAuthAccessToken,
      value: accessToken,
    );
  }

  Future<void> deleteAccessToken() async {
    return await storage.delete(key: _keyOAuthAccessToken);
  }

  Future<int> getAccessTokenExpiration() async {
    return (await storage.read(key: _keyOAuthAccessTokenExpiration)) ?? 0;
  }

  Future<void> setAccessTokenExpiration(int accessTokenExpiration) async {
    return await storage.write(
      key: _keyOAuthAccessTokenExpiration,
      value: accessTokenExpiration as String,
    );
  }

  Future<void> deleteAccessTokenExpiration() async {
    return await storage.delete(key: _keyOAuthAccessTokenExpiration);
  }

  Future<String> getRefreshToken() async {
    return await storage.read(key: _keyOAuthRefreshToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    return await storage.write(
      key: _keyOAuthRefreshToken,
      value: refreshToken,
    );
  }

  Future<void> deleteRefreshToken() async {
    return await storage.delete(key: _keyOAuthRefreshToken);
  }

  Future<String> getRefreshTokenExpiration() async {
    return storage.read(key: _keyOAuthRefreshTokenExpiration) ?? '';
  }

  Future<void> setRefreshTokenExpiration(String refreshTokenExpiration) async {
    return storage.write(
      key: _keyOAuthRefreshTokenExpiration,
      value: refreshTokenExpiration,
    );
  }

  Future<void> deleteRefreshTokenExpiration() async {
    return storage.delete(key: _keyOAuthRefreshTokenExpiration);
  }

  /// ----------------------------------------------------------
  /// ----------------------- Connected ------------------------
  /// ----------------------------------------------------------

  Future<bool> isAuthConnected() async {
    return storage.read(key: _keyAuthConnected) as bool;
  }

  Future<void> setAuthConnected(bool connected) async {
    return storage.write(
      key: _keyAuthConnected,
      value: connected as String,
    );
  }

  Future<void> deleteAuthConnected() async {
    return storage.delete(key: _keyAuthConnected);
  }

  /// ----------------------------------------------------------
  /// -------------------------- All ---------------------------
  /// ----------------------------------------------------------

  Future deleteAll() async {
    storage.deleteAll();
  }
}
