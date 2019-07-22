import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_door_buzzer/bloc.dart';
import 'package:flutter_door_buzzer/domain.dart';
import 'package:flutter_door_buzzer/presentation.dart';

class MenuButton extends StatelessWidget {
  final String _tag = '$MenuButton';

  MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$_tag:$build');

    final AuthenticationBloc _authBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
//        if (state is AuthenticationAuthenticated) {
//          return _MenuButtonConnected();
//        }
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
    final AccountBloc _accountBloc = BlocProvider.of<AccountBloc>(context);

    return BlocBuilder<AccountEvent, AccountState>(
      bloc: _accountBloc,
      builder: (BuildContext context, AccountState state) {
        if (state is AccountLoaded) {
          final UserEntity userEntity = state.user;
          return Padding(
            padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
            child: IconButton(
              onPressed: () => openMenuBottomSheet(context),
              icon: InitialCircleAvatar(
                text: userEntity.email,
              ),
            ),
          );
        }
        return _DefaultMenuButton();
      },
    );
  }
}
