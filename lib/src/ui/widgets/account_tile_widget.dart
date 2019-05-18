import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account_bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:flutter_door_buzzer/src/ui/localizations/buzzer_localization.dart';
import 'package:flutter_door_buzzer/src/ui/utils/navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AuthenticationUnauthenticated) {
          return _AccountTileNotConnected();
        }
        if (state is AuthenticationAuthenticated) {
          return _AccountTileConnected();
        }
      },
    );
  }
}

class _AccountTileConnected extends StatelessWidget {
  final String _tag = '_AccountTileConnected';

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    AccountBloc _accountBloc = BlocProvider.of<AccountBloc>(context);

    return BlocBuilder<AccountEvent, AccountState>(
      bloc: _accountBloc,
      builder: (BuildContext context, AccountState state) {
        String email = '';
        String username = '';
        if (state is AccountUninitialized) {
        } else if (state is AccountInitialized) {
          UserModel userModel = state.user;
          email = userModel.email;
          username = userModel.username;
        }
        return ListTile(
          ///leading: InitialCircleAvatar(text: username),
          title: Text(BuzzerLocalizations.of(context).account),
          subtitle: Text(email),
          trailing: IconButton(
            icon: Icon(MdiIcons.logout),
            onPressed: () => _authBloc.dispatch(LoggedOut()),
          ),
        );
      },
    );
  }
}

class _AccountTileNotConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Center(child: Text(BuzzerLocalizations.of(context).loginCTA)),
        trailing: Icon(MdiIcons.login),
      ),
      onTap: () => navigateToLogin(context),
    );
  }
}
