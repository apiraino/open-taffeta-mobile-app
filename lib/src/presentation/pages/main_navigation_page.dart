import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/bloc.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class MainNavigationPage extends StatelessWidget {
  final String _tag = '$MainNavigationPage';

  MainNavigationPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    return Scaffold(
      appBar: AppBar(
        title: Text(BuzzerLocalizations.of(context).appName),
        centerTitle: true,
      ),
      body: BlocListener<AuthenticationEvent, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        listener: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationAuthenticated) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppStyles.successColor,
                content: const Text('Authenticated'),
              ),
            );
          } else if (state is AuthenticationUnauthenticated) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppStyles.warningColor,
                content: const Text('Not authenticated'),
              ),
            );
          }
        },
        child: HomePage(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MenuButton(),
          ],
        ),
      ),
    );
  }
}
