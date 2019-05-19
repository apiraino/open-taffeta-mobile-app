import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/utils/navigation.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/error_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountPage extends StatelessWidget {
  final String _tag = '$AccountPage';

  AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');

    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return SafeArea(
      left: false,
      right: false,
      child: BlocBuilder(
        bloc: _authBloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUnauthenticated) {
            return _NotConnectedAccountPage();
          } else if (state is AuthenticationAuthenticated) {
            return _AccountPageConnected();
          }
          return Container(child: Text('unhandled state $state'));
        },
      ),
    );
  }
}

class _NotConnectedAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(BuzzerLocalizations.of(context).loginCTA),
        onPressed: () => navigateToLogin(context),
      ),
    );
  }
}

class _AccountPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountBloc _accountBloc = BlocProvider.of<AccountBloc>(context);
    return BlocBuilder(
      bloc: _accountBloc,
      builder: (BuildContext context, AccountState state) {
        if (state is AccountLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AccountUninitialized) {
          return Container(child: Text('Nothing to display'));
        } else if (state is AccountInitialized) {
          return ListView(
            children: <Widget>[
              ExpansionTile(
                leading: Icon(MdiIcons.accountBoxMultiple),
                title: Text(BuzzerLocalizations.of(context).account),
                children: <Widget>[],
              ),
            ],
          );
        } else if (state is AccountFailure) {
          return ErrorCard(message: '${state.error.runtimeType}');
        }
        return Container();
      },
    );
  }
}
