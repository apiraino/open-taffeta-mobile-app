import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/src/data/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/data/blocs/account/account_bloc.dart';
import 'package:flutter_door_buzzer/src/data/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:flutter_door_buzzer/src/ui/utils/navigation.dart';
import 'package:flutter_door_buzzer/src/ui/widgets/initial_circle_avatar_widget.dart';

class MenuButton extends StatelessWidget {
  final _tag = 'MenuButton';

  const MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:build');

    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationAuthenticated) {
          return _MenuButtonConnected();
        }
        return _DefaultMenuButton();
      },
    );
  }
}

class _DefaultMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => openMenuBottomSheet(context),
      icon: Icon(Icons.menu),
    );
  }
}

class _MenuButtonConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountBloc _accountBloc = BlocProvider.of<AccountBloc>(context);

    return BlocBuilder<AccountEvent, AccountState>(
      bloc: _accountBloc,
      builder: (BuildContext context, AccountState state) {
        if (state is AccountInitialized) {
          UserModel userModel = state.user;
          return Padding(
              padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
              child: IconButton(
                onPressed: () => openMenuBottomSheet(context),
                icon: InitialCircleAvatar(text: userModel.username),
              ));
        }
        return _DefaultMenuButton();
      },
    );
  }
}
