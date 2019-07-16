import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:meta/meta.dart';

enum ThemeType {
  /// Light theme
  light,

  /// Dark theme
  dark,
}

class _ThemeType {
  static const String LIGHT = 'THEME_LIGHT';
  static const String DARK = 'THEME_DARK';
}

String themeTypeToString(ThemeType theme) {
  if (theme == ThemeType.light) return _ThemeType.LIGHT;
  if (theme == ThemeType.dark) return _ThemeType.DARK;

  return _ThemeType.LIGHT;
}

ThemeType themeToEnum(String theme) {
  if (theme == _ThemeType.LIGHT) return ThemeType.light;
  if (theme == _ThemeType.DARK) return ThemeType.dark;
  return ThemeType.light;
}

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
  ApplicationState get initialState => AppInitialized(theme: ThemeType.light);

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    print('$_tag:$mapEventToState($event)');
    if (event is AppInitialization) {
      final String theme = await appPreferencesRepository.getAppTheme();
      yield AppInitialized(theme: themeToEnum(theme));
    } else if (event is AppThemeToggled) {
      final ThemeType _theme = event.theme;
      await appPreferencesRepository.setAppTheme(themeTypeToString(_theme));
      yield AppInitialized(theme: _theme);
    }
  }
}
