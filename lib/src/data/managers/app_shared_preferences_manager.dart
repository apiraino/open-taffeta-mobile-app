import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// One of the possible Implementation of PreferencesService Interface
class AppSharedPreferencesManager {
  final String _keyUserId = 'USER_ID';
  final String _keyUserEmail = 'USER_EMAIL';
  final String _keyAppTheme = 'APP_THEME';

  final FlutterSecureStorage storage;

  AppSharedPreferencesManager() : storage = FlutterSecureStorage();

  /// ----------------------------------------------------------
  /// ------------------------- User ---------------------------
  /// ----------------------------------------------------------

  Future<void> setUserId(String userId) async {
    return storage.write(
      key: _keyUserId,
      value: userId,
    );
  }

  Future<String> getUserId() async {
    return storage.read(key: _keyUserId);
  }

  Future<void> deleteUserId() async {
    return storage.delete(key: _keyUserId);
  }

  Future<void> setUserEmail(String userEmail) async {
    return storage.write(
      key: _keyUserEmail,
      value: userEmail,
    );
  }

  Future<String> getUserEmail() async {
    return storage.read(key: _keyUserEmail);
  }

  Future<void> deleteUserEmail() async {
    return storage.delete(key: _keyUserEmail);
  }

  /// ----------------------------------------------------------
  /// ------------------------- Theme --------------------------
  /// ----------------------------------------------------------

  Future<String> getAppTheme() async {
    return storage.read(key: _keyAppTheme);
  }

  Future<void> setAppTheme(String theme) async {
    return storage.write(
      key: _keyAppTheme,
      value: theme,
    );
  }

  Future<void> deleteAppTheme() async {
    return storage.delete(key: _keyAppTheme);
  }

  /// ----------------------------------------------------------
  /// -------------------------- All ---------------------------
  /// ----------------------------------------------------------

  Future deleteAll() async {
    storage.deleteAll();
  }
}
