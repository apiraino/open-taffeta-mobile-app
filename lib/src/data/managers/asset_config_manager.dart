import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';

/// From https://medium.com/@sokrato/storing-your-secret-keys-in-flutter-c0b9af1c0f69
class AssetConfigManager implements ConfigRepository {
  static const _secretPath = 'config.json';

  String _serverUrl;
  String _clientId;
  String _clientSecret;

  AssetConfigManager() {
    rootBundle.loadStructuredData<String>(
      _secretPath,
      (jsonStr) {
        Map<String, dynamic> jsonMap = json.decode(jsonStr);

        _serverUrl = jsonMap['serverUrl'];
        _clientId = jsonMap['clientId'];
        _clientSecret = jsonMap['clientSecret'];
      },
    );
  }

  @override
  Future<String> getServerUrl() => Future.value(_serverUrl);

  @override
  Future<String> getClientId() => Future.value(_clientId);

  @override
  Future<String> getClientSecret() => Future.value(_clientSecret);
}
