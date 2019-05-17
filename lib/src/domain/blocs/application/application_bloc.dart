import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/data/repositories/preferences_repository.dart';

class ThemeType {
  static const String LIGHT = 'THEME_LIGHT';
  static const String DARK = 'THEME_DARK';
}

/// Business Logic Component for Application UI behaviors
///
/// Use [ApplicationEvent] for events and [ApplicationState] for states
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final String _tag = '$ApplicationBloc';

  final PreferencesRepository preferencesRepository;

  ApplicationBloc({
    this.preferencesRepository,
  })  : assert(
            preferencesRepository != null, 'No $PreferencesRepository given'),
        super();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  ApplicationState get initialState => AppInitialized(theme: ThemeType.LIGHT);

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    print('$_tag:mapEventToState($event)');
    if (event is AppInitialization) {
      String theme = await preferencesRepository.getAppTheme();
      yield AppInitialized(theme: theme);
    }
    if (event is AppThemeToggled) {
      String _theme = event.theme;
      preferencesRepository.setAppTheme(_theme);
      yield AppInitialized(theme: _theme);
    }
  }
}
