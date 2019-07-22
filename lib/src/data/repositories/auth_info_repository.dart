import 'package:flutter_door_buzzer/data.dart';
import 'package:flutter_door_buzzer/domain.dart';
import 'package:meta/meta.dart';

/// The only possible implementation of [AuthInfoRepository]
///
/// Is not using any data store since it should only fetch local info ATM
class ImplAuthInfoRepository implements AuthInfoRepository {
  final AuthInfoDataStoreFactory factory;

  ImplAuthInfoRepository({@required this.factory})
      : assert(factory != null, 'No $AuthInfoDataStoreFactory given');

  /// --------------------------------------------------------------------------
  ///                               Access Tokens
  /// --------------------------------------------------------------------------

  @override
  Future<String> getAccessToken() {
    return factory.create().getAccessToken();
  }

  @override
  Future<void> setAccessToken(String accessToken) {
    return factory.create().setAccessToken(accessToken);
  }

  @override
  Future<void> deleteAccessToken() {
    return factory.create().deleteAccessToken();
  }

  @override
  Future<int> getAccessTokenExpiration() {
    return factory.create().getAccessTokenExpiration();
  }

  @override
  Future<void> setAccessTokenExpiration(int accessTokenExpiration) {
    return factory.create().setAccessTokenExpiration(accessTokenExpiration);
  }

  @override
  Future<void> deleteAccessTokenExpiration() {
    return factory.create().deleteAccessTokenExpiration();
  }

  /// --------------------------------------------------------------------------
  ///                               Refresh Tokens
  /// --------------------------------------------------------------------------

  @override
  Future<String> getRefreshToken() {
    return factory.create().getRefreshToken();
  }

  @override
  Future<void> setRefreshToken(String refreshToken) {
    return factory.create().setRefreshToken(refreshToken);
  }

  @override
  Future<void> deleteRefreshToken() {
    return factory.create().deleteRefreshToken();
  }

  @override
  Future<String> getRefreshTokenExpiration() {
    return factory.create().getRefreshTokenExpiration();
  }

  @override
  Future<void> setRefreshTokenExpiration(String refreshTokenExpiration) {
    return factory.create().setRefreshTokenExpiration(refreshTokenExpiration);
  }

  @override
  Future<void> deleteRefreshTokenExpiration() {
    return factory.create().deleteRefreshTokenExpiration();
  }

  /// --------------------------------------------------------------------------
  ///                              Connected
  /// --------------------------------------------------------------------------

  @override
  Future<int> getUserId() {
    return factory.create().getUserId();
  }

  @override
  Future<void> setUserId(int userId) {
    return factory.create().setUserId(userId);
  }

  @override
  Future<void> deleteUserId() {
    return factory.create().deleteUserId();
  }

  /// --------------------------------------------------------------------------
  ///                                  All
  /// --------------------------------------------------------------------------
  @override
  Future<void> deleteAll() {
    return factory.create().deleteAccessTokenExpiration();
  }
}
