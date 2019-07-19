import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application_bloc.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ThemeSwitchTile extends StatelessWidget {
  const ThemeSwitchTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc _appBloc = BlocProvider.of<ApplicationBloc>(context);

    return BlocBuilder<ApplicationEvent, ApplicationState>(
      bloc: _appBloc,
      builder: (BuildContext context, ApplicationState state) {
        if (state is AppInitialized) {
          final bool darkMode = state.isDarkMode;
          return SwitchListTile(
            secondary: Icon(
              darkMode ? MdiIcons.weatherSunny : MdiIcons.whiteBalanceSunny,
            ),
            title: Text(BuzzerLocalizations.of(context).settingsToggleDarkModeCTA),
            value: darkMode,
            onChanged: (bool newValue) =>
                _appBloc.dispatch(AppDarkModeToggled(darkMode: newValue)),
          );
        }
        return Container(child: Text('${state.runtimeType} state unhandled'));
      },
    );
  }
}
