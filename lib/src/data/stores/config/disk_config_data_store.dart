import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_door_buzzer/src/data/models/config_model.dart';
import 'package:flutter_door_buzzer/src/data/stores/config/config_data_store.dart';

class DiskConfigDataStore implements ConfigDataStore {
  static const _configPath = 'config.json';
  ConfigDataModel _config;

  DiskConfigDataStore();

  Future<void> _load() async {
    await rootBundle.loadStructuredData(
      _configPath,
      (jsonStr) {
        Map<String, dynamic> jsonMap =
            json.decode(jsonStr) as Map<String, dynamic>;
        _config = ConfigDataModel.fromJson(jsonMap);
      },
    );
  }

  @override
  Future<String> getApiServerUrl() async {
    if (_config == null) await _load();
    return Future.value(_config.apiServerUrl);
  }

  @override
  Future<String> getClientId() async {
    if (_config == null) await _load();
    return Future.value(_config.clientId);
  }

  @override
  Future<String> getClientSecret() async {
    if (_config == null) await _load();
    return Future.value(_config.clientSecret);
  }

  @override
  Future<int> getDoorId() async {
    if (_config == null) await _load();
    return Future.value(_config.doorId);
  }
}
