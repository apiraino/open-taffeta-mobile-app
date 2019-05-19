import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/interceptors/api_interceptor.dart';
import 'package:flutter_door_buzzer/src/data/managers/app_shared_preferences_manager.dart';
import 'package:flutter_door_buzzer/src/data/managers/auth_shared_preferences_manager.dart';
import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/managers/config_assets_manager.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/auth_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/cloud_buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/local_app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/local_auth_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/local_config_repository.dart';

import 'configuration.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final String _tag = '$ConfigurationBloc';

  ConfigurationBloc() : super();

  /// Interceptors
  ApiInterceptor _apiInterceptor;

  /// Managers
  BuzzerApiManager _buzzerApiManager;

  /// Repositories
  BuzzerRepository _buzzerRepository;
  AuthPreferencesRepository _authPreferencesRepository;
  AppPreferencesRepository _appPreferencesRepository;
  ConfigRepository _configRepository;

  @override
  ConfigurationState get initialState => ConfigLoading();

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is AppLaunched) {
      yield* _mapAppLaunchedEventToState();
    }
  }

  Stream<ConfigurationState> _mapAppLaunchedEventToState() async* {
    try {
      yield ConfigLoading();

      final _authSharedPreferencesManager = AuthSharedPreferencesManager();

      /// Interceptors
      _apiInterceptor = ApiInterceptor(
        accessToken: await _authSharedPreferencesManager.getAccessToken(),
      );

      /// Managers
      final _localConfigManager = ConfigAssetsManager();
      final _appSharedPreferencesManager = AppSharedPreferencesManager();

      _configRepository = LocalConfigRepository(
        localConfigManager: _localConfigManager,
      );

      _buzzerApiManager = BuzzerApiManager(
        baseUrl: await _configRepository.getApiServerUrl(),
        apiInterceptor: _apiInterceptor,
      );

      /// Repositories
      _authPreferencesRepository = LocalAuthPreferencesRepository(
        authSharedPreferencesManager: _authSharedPreferencesManager,
      );

      _appPreferencesRepository = LocalAppPreferencesRepository(
        appSharedPreferencesManager: _appSharedPreferencesManager,
      );

      _buzzerRepository = CloudBuzzerRepository(
        buzzerApiManager: _buzzerApiManager,
      );

      yield ConfigLoaded(
        buzzerRepository: _buzzerRepository,
        authPreferencesRepository: _authPreferencesRepository,
        appPreferencesRepository: _appPreferencesRepository,
        configRepository: _configRepository,
      );
    } catch (error) {
      print('$_tag:$_mapAppLaunchedEventToState -> ${error.runtimeType}');
      throw error;
    }
  }
}
