import 'package:flutter_door_buzzer/src/data/stores/auth/auth_data_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DiskAuthDataStore implements AuthDataStore {
  final String _keyOAuthAccessToken = 'OAUTH_ACCESS_TOKEN';
  final String _keyOAuthAccessTokenExpiration = 'OAUTH_ACCESS_TOKEN_EXPIRATION';
  final String _keyOAuthRefreshToken = 'OAUTH_REFRESH_TOKEN';
  final String _keyOAuthRefreshTokenExpiration =
      'OAUTH_REFRESH_TOKEN_EXPIRATION';
  final String _keyAuthUserId = 'AUTH_USER_ID';

  FlutterSecureStorage storage;

  DiskAuthDataStore() {
    storage = FlutterSecureStorage();
  }

  /// --------------------------------------------------------------------------
  ///                            Access Token
  /// --------------------------------------------------------------------------

  @override
  Future<String> getAccessToken() async {
    return await storage.read(key: _keyOAuthAccessToken);
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    return await storage.write(
      key: _keyOAuthAccessToken,
      value: accessToken,
    );
  }

  @override
  Future<void> deleteAccessToken() async {
    return await storage.delete(key: _keyOAuthAccessToken);
  }

  @override
  Future<int> getAccessTokenExpiration() async {
    return int.parse(await storage.read(key: _keyOAuthAccessTokenExpiration)) ??
        0;
  }

  @override
  Future<void> setAccessTokenExpiration(int accessTokenExpiration) async {
    return await storage.write(
      key: _keyOAuthAccessTokenExpiration,
      value: accessTokenExpiration as String,
    );
  }

  @override
  Future<void> deleteAccessTokenExpiration() async {
    return await storage.delete(key: _keyOAuthAccessTokenExpiration);
  }

  /// --------------------------------------------------------------------------
  ///                            Refresh Token
  /// --------------------------------------------------------------------------

  @override
  Future<String> getRefreshToken() async {
    return await storage.read(key: _keyOAuthRefreshToken);
  }

  @override
  Future<void> setRefreshToken(String refreshToken) async {
    return await storage.write(
      key: _keyOAuthRefreshToken,
      value: refreshToken,
    );
  }

  @override
  Future<void> deleteRefreshToken() async {
    return await storage.delete(key: _keyOAuthRefreshToken);
  }

  @override
  Future<String> getRefreshTokenExpiration() async {
    return await storage.read(key: _keyOAuthRefreshTokenExpiration) ?? '';
  }

  @override
  Future<void> setRefreshTokenExpiration(String refreshTokenExpiration) async {
    return await storage.write(
      key: _keyOAuthRefreshTokenExpiration,
      value: refreshTokenExpiration,
    );
  }

  @override
  Future<void> deleteRefreshTokenExpiration() async {
    return await storage.delete(key: _keyOAuthRefreshTokenExpiration);
  }

  /// --------------------------------------------------------------------------
  ///                              Connected
  /// --------------------------------------------------------------------------

  @override
  Future<int> getUserId() async {
    return int.parse(await storage.read(key: _keyAuthUserId));
  }

  @override
  Future<void> setUserId(int userId) async {
    return await storage.write(
      key: _keyAuthUserId,
      value: userId.toString(),
    );
  }

  @override
  Future<void> deleteUserId() async {
    return await storage.delete(key: _keyAuthUserId);
  }

  /// --------------------------------------------------------------------------
  ///                                  All
  /// --------------------------------------------------------------------------

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
