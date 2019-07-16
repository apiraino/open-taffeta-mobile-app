import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/ui/commons/paths.dart';
import 'package:flutter_door_buzzer/src/ui/commons/styles.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/pages/buzzer_page.dart';

class HomePage extends StatelessWidget {
  final String _tag = '$HomePage';

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');
    final AuthenticationBloc _authBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationAuthenticated) {
          return BuzzerPage();
        }
        return Center(
          child: Card(
            child: Padding(
              padding: AppStyles.cardDefaultPadding,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(BuzzerLocalizations.of(context).homeWelcome),
                    BlocBuilder<AuthenticationEvent, AuthenticationState>(
                      bloc: BlocProvider.of<AuthenticationBloc>(context),
                      builder:
                          (BuildContext context, AuthenticationState state) {
                        if (state is AuthenticationUnauthenticated) {
                          return FlatButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AppPaths.pathAuth),
                            child: Text(
                                BuzzerLocalizations.of(context).authLoginCTA),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
