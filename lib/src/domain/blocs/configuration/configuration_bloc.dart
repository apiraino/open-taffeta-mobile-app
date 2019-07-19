import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/managers/api_interceptor.dart';
import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/auth_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:flutter_door_buzzer/src/data/stores/app_preferences/app_preferences_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/data/stores/auth/auth_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/data/stores/auth/disk_auth_data_store.dart';
import 'package:flutter_door_buzzer/src/data/stores/buzzer/buzzer_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/data/stores/config/config_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/data/stores/config/disk_config_data_store.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/auth_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/config_repository.dart';

import 'configuration.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final String _tag = '$ConfigurationBloc';

  ConfigurationBloc() : super();

  /// Repositories

  ConfigRepository _configRepo;
  AuthRepository _authRepo;
  BuzzerRepository _buzzerRepo;
  AppPreferencesRepository _appPreferencesRepo;

  @override
  ConfigurationState get initialState => ConfigLoading();

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is ConfigApp) {
      yield* _mapAppLaunchedEventToState();
    }
  }

  /// --------------------------------------------------------------------------
  ///                       All Event map to State
  /// --------------------------------------------------------------------------

  Stream<ConfigurationState> _mapAppLaunchedEventToState() async* {
    try {
      yield ConfigLoading();

      // Disk Data Store (need access info for managers)

      final DiskAuthDataStore diskAuthDataStore = DiskAuthDataStore();
      final DiskConfigDataStore diskConfigDataStore = DiskConfigDataStore();

      // Managers

      final apiInterceptor = ApiInterceptor(
        accessToken: await diskAuthDataStore.getAccessToken(),
      );

      final BuzzerApiManager buzzerApiManager = BuzzerApiManager(
        baseUrl: await diskConfigDataStore.getApiServerUrl(),
        apiInterceptor: apiInterceptor,
      );

      // Data Store Factory

      final ConfigDataStoreFactory configDataStoreFactory =
          ConfigDataStoreFactory(diskDataStore: diskConfigDataStore);

      final AppPreferencesDataStoreFactory appPreferencesDataStoreFactory =
          AppPreferencesDataStoreFactory();

      final BuzzerDataStoreFactory buzzerDataStoreFactory =
          BuzzerDataStoreFactory(apiManager: buzzerApiManager);

      final AuthDataStoreFactory authDataStoreFactory =
          AuthDataStoreFactory(diskDataStore: diskAuthDataStore);

      // Repositories

      _configRepo = ImplConfigRepository(
        factory: configDataStoreFactory,
      );

      _authRepo = ImplAuthRepository(
        factory: authDataStoreFactory,
      );

      _appPreferencesRepo = ImplAppPreferencesRepository(
        factory: appPreferencesDataStoreFactory,
      );

      _buzzerRepo = ImplBuzzerRepository(
        factory: buzzerDataStoreFactory,
      );

      // Yield update

      yield ConfigLoaded(
        configRepo: _configRepo,
        authRepo: _authRepo,
        buzzerRepo: _buzzerRepo,
        appPrefsRepo: _appPreferencesRepo,
      );
    } catch (error) {
      print('$_tag:$_mapAppLaunchedEventToState -> ${error.runtimeType}');
      yield ConfigFailure(error: error);
    }
  }
}
