import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/bloc/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/app_preferences_repository.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Application UI behaviors
///
/// Use [ApplicationEvent] for events and [ApplicationState] for states
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final String _tag = '$ApplicationBloc';

  final AppPreferencesRepository appPreferencesRepository;

  ApplicationBloc({
    @required this.appPreferencesRepository,
  })  : assert(
          appPreferencesRepository != null,
          'No $AppPreferencesRepository given',
        ),
        super();

  @override
  ApplicationState get initialState => AppUninitialized();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    print('$_tag:mapEventToState($event)');
    if (event is AppInitialization) {
      yield* _mapAppInitToState(event);
    } else if (event is AppDarkModeToggled) {
      yield* _mapDarkModeToggleEventToState(event);
    }
  }

  /// --------------------------------------------------------------------------
  ///                       All Event map to State
  /// --------------------------------------------------------------------------

  /// Map [AppInitialization] to [ApplicationState]
  ///
  /// ```dart
  /// yield* _mapAppInitToState(event);
  /// ```
  Stream<ApplicationState> _mapAppInitToState(AppInitialization event) async* {
    try {
      yield AppLoading();
      final bool darkMode = await appPreferencesRepository.getDarkMode();
      yield AppInitialized(isDarkMode: darkMode);
    } catch (e) {
      print('$_tag:_mapAppInitToState -> ${e.runtimeType}');
      yield AppFailure(error: e);
    }
  }

  /// Map [AppDarkModeToggled] to [ApplicationState]
  ///
  /// ```dart
  /// yield* _mapDarkModeToggleEventToState(event);
  /// ```
  Stream<ApplicationState> _mapDarkModeToggleEventToState(
      AppDarkModeToggled event) async* {
    try {
      await appPreferencesRepository.toggleDarkMode(event.darkMode);
      yield AppInitialized(isDarkMode: event.darkMode);
    } catch (e) {
      print('$_tag:_mapDarkModeToggleEventToState -> ${e.runtimeType}');
      yield AppFailure(error: e);
    }
  }
}
