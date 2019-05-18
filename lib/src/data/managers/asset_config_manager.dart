import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';

/// From https://medium.com/@sokrato/storing-your-secret-keys-in-flutter-c0b9af1c0f69
class AssetConfigManager implements ConfigRepository {
  static const _configPath = 'config.json';

  String _serverUrl;
  String _clientId;
  String _clientSecret;

  Future<void> _load() async {
    await rootBundle.loadStructuredData<String>(
      _configPath,
      (jsonStr) {
        Map<String, dynamic> jsonMap = json.decode(jsonStr);
        _serverUrl = jsonMap['serverUrl'];
        _clientId = jsonMap['clientId'];
        _clientSecret = jsonMap['clientSecret'];
      },
    );
  }

  @override
  Future<String> getServerUrl() async {
    if (_serverUrl == null) await _load();
    return Future.value(_serverUrl);
  }

  @override
  Future<String> getClientId() async {
    if (_clientId == null) await _load();
    return Future.value(_clientId);
  }

  @override
  Future<String> getClientSecret() async {
    if (_clientSecret == null) await _load();
    return Future.value(_clientSecret);
  }
}
