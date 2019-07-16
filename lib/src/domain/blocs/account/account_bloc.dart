import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/auth_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:meta/meta.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final String _tag = '$AccountBloc';

  final BuzzerRepository buzzerRepository;
  final AuthPreferencesRepository autPreferencesRepository;
  final AuthenticationBloc authBloc;

  StreamSubscription authBlocSubscription;

  AccountBloc({
    @required this.buzzerRepository,
    @required this.autPreferencesRepository,
    @required this.authBloc,
  })  : assert(buzzerRepository != null, 'No $BuzzerRepository given'),
        assert(autPreferencesRepository != null,
            'No $AuthPreferencesRepository given'),
        assert(authBloc != null, 'No $AuthenticationBloc given'),
        super() {
    authBlocSubscription = authBloc.state.listen((state) {
      if (state is AuthenticationAuthenticated) {
        dispatch(AccountRefresh());
      }
    });
  }

  @override
  void dispose() {
    authBlocSubscription?.cancel();
    super.dispose();
  }

  @override
  AccountState get initialState => AccountUninitialized();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    print('$_tag:$mapEventToState($event)');
    if (event is AccountRefresh) {
      yield AccountLoading();

      final int userId = await autPreferencesRepository.getUserId();

      final user = await buzzerRepository.getUser(userId: userId);
      yield AccountLoaded(user: user);
    }
  }
}
