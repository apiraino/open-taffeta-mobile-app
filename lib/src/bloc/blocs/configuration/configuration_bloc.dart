import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/data.dart';
import 'package:flutter_door_buzzer/domain.dart';

import 'configuration.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final String _tag = '$ConfigurationBloc';

  ConfigurationBloc() : super();

  /// Repositories

  ConfigRepository _configRepo;
  AuthInfoRepository _authRepo;
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

      final DiskAuthInfoDataStore diskAuthInfoDataStore =
          DiskAuthInfoDataStore();
      final DiskConfigDataStore diskConfigDataStore = DiskConfigDataStore();

      // Managers

      final apiInterceptor = ApiInterceptor(
        accessToken: await diskAuthInfoDataStore.getAccessToken(),
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

      final AuthInfoDataStoreFactory authInfoDataStoreFactory =
          AuthInfoDataStoreFactory(diskDataStore: diskAuthInfoDataStore);

      // Repositories

      _configRepo = ImplConfigRepository(
        factory: configDataStoreFactory,
      );

      _authRepo = ImplAuthInfoRepository(
        factory: authInfoDataStoreFactory,
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
