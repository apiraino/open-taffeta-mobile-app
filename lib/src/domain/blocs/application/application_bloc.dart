import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';

class ThemeType {
  static const String LIGHT = 'THEME_LIGHT';
  static const String DARK = 'THEME_DARK';
}

/// Business Logic Component for Application UI behaviors
///
/// Use [ApplicationEvent] for events and [ApplicationState] for states
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final String _tag = '$ApplicationBloc';

  final AppPreferencesRepository appPreferencesRepository;

  ApplicationBloc({
    this.appPreferencesRepository,
  })  : assert(appPreferencesRepository != null,
            'No $AppPreferencesRepository given'),
        super();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  ApplicationState get initialState => AppInitialized(theme: ThemeType.LIGHT);

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    print('$_tag:$mapEventToState($event)');
    if (event is AppInitialization) {
      String theme = await appPreferencesRepository.getAppTheme();
      yield AppInitialized(theme: theme);
    }
    if (event is AppThemeToggled) {
      String _theme = event.theme;
      appPreferencesRepository.setAppTheme(_theme);
      yield AppInitialized(theme: _theme);
    }
  }
}
