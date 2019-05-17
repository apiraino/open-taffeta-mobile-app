import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/managers/api_interceptor.dart';
import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/managers/file_config_manager.dart';
import 'package:flutter_door_buzzer/src/data/managers/shared_preferences_manager.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/cloud_buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/preferences_repository.dart';

import 'configuration.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final String _tag = 'ConfigurationBloc';

  ConfigurationBloc() : super();

  /// Interceptors
  ApiInterceptor _apiInterceptor;

  /// Managers
  BuzzerApiManager _buzzerApiManager;

  /// Repositories
  BuzzerRepository _buzzerRepository;
  PreferencesRepository _preferencesRepository;
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
      _preferencesRepository = SharedPreferencesManager();

      /// Interceptors
      _apiInterceptor = ApiInterceptor(
        accessToken: await _preferencesRepository.getAccessToken(),
      );

      /// Managers
      _buzzerApiManager = BuzzerApiManager(apiInterceptor: _apiInterceptor);

      /// Repositories
      _configRepository = FileConfigManager();
      _buzzerRepository =
          CloudBuzzerRepository(buzzerApiManager: _buzzerApiManager);

      yield ConfigLoaded(
        buzzerRepository: _buzzerRepository,
        preferencesRepository: _preferencesRepository,
        configRepository: _configRepository,
      );
    } catch (error) {
      print(error.toString());
    }
  }
}
