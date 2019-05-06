import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';

/// From https://medium.com/@sokrato/storing-your-secret-keys-in-flutter-c0b9af1c0f69
class FileConfigManager implements ConfigRepository {
  static const _secretPath = 'config.json';

  String _clientId;
  String _clientSecret;

  FileConfigManager() {
    rootBundle.loadStructuredData<String>(
      _secretPath,
      (jsonStr) {
        Map<String, dynamic> jsonMap = json.decode(jsonStr);

        _clientId = jsonMap['clientId'];
        _clientSecret = jsonMap['clientSecret'];
      },
    );
  }

  @override
  String getClientId() => _clientId;

  @override
  String getClientSecret() => _clientSecret;
}
