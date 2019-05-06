import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/data/blocs/application/application.dart';
import 'package:flutter_door_buzzer/src/data/blocs/application/application_bloc.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ThemeSwitchTile extends StatelessWidget {
  const ThemeSwitchTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationBloc _appBloc = BlocProvider.of<ApplicationBloc>(context);

    return BlocBuilder<ApplicationEvent, ApplicationState>(
      bloc: _appBloc,
      builder: (BuildContext context, ApplicationState state) {
        if (state is AppUninitialized) {
          return Container();
        }
        if (state is AppInitialized) {
          String theme = state.theme;
          return SwitchListTile(
            secondary: Icon(
              theme == ThemeType.DARK
                  ? MdiIcons.weatherSunny
                  : MdiIcons.whiteBalanceSunny,
            ),
            title: Text(BuzzerLocalizations.of(context).settingsThemeCTA),
            value: theme == ThemeType.DARK ? true : false,
            onChanged: (bool enable) {
              if (enable)
                _appBloc.dispatch(AppThemeToggled(theme: ThemeType.DARK));
              else
                _appBloc.dispatch(AppThemeToggled(theme: ThemeType.LIGHT));
            },
          );
        }
        return Container(child: Text('$state unhandled'));
      },
    );
  }
}
