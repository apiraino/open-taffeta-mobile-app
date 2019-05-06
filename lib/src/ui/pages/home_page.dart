import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/data/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/data/blocs/buzzer/buzzer.dart';
import 'package:flutter_door_buzzer/src/ui/commons/colors.dart';
import 'package:flutter_door_buzzer/src/ui/commons/dimensions.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  final _tag = 'HomePage';

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');
    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationAuthenticated) {
          return _AuthenticatedHome();
        }
        return Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.defaultCardPadding),
              child: Text(BuzzerLocalizations.of(context).homeWelcome),
            ),
          ),
        );
      },
    );
  }
}

class _AuthenticatedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuzzerBloc _buzzerBloc = BlocProvider.of<BuzzerBloc>(context);

    return BlocListener(
      bloc: _buzzerBloc,
      listener: (BuildContext context, BuzzerState state) {
        if (state is BuzzerSucceed) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${BuzzerLocalizations.of(context).buzzerDoorSucceed} : ${state.message}'),
              backgroundColor: AppColors.successColor,
            ),
          );
        } else if (state is BuzzerFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${BuzzerLocalizations.of(context).buzzerDoorFailed} : ${state.error.toString()}'),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
      },
      child: BlocBuilder(
        bloc: _buzzerBloc,
        builder: (BuildContext context, BuzzerState state) {
          if (state is BuzzerLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            Icon icon = Icon(MdiIcons.doorClosed);
            if (state is BuzzerSucceed) icon = Icon(MdiIcons.doorOpen);
            if (state is BuzzerFailure)
              icon = Icon(MdiIcons.informationOutline);
            return Center(
              child: IconButton(
                tooltip: BuzzerLocalizations.of(context).buzzerDoorCTA,
                iconSize: 100,
                icon: icon,
                onPressed: () =>
                    _buzzerBloc.dispatch(BuzzerDoorPressed(doorId: 1)),
              ),
            );
          }
        },
      ),
    );
  }
}
