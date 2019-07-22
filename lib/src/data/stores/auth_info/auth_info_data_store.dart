abstract class AuthInfoDataStore {
  /// --------------------------------------------------------------------------
  ///                                Tokens
  /// --------------------------------------------------------------------------

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

  /// --------------------------------------------------------------------------
  ///                              Connected
  /// --------------------------------------------------------------------------

  Future<int> getUserId();

  Future<void> setUserId(int userId);

  Future<void> deleteUserId();

  /// --------------------------------------------------------------------------
  ///                                  All
  /// --------------------------------------------------------------------------

  Future<void> deleteAll();
}
