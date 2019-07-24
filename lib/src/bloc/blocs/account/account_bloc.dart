import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/bloc.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/auth_info_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final String _tag = '$AccountBloc';

  final AuthInfoRepository authRepo;
  final BuzzerRepository buzzerRepo;
  final AuthenticationBloc authBloc;

  StreamSubscription authBlocSubscription;

  AccountBloc({
    @required this.authRepo,
    @required this.buzzerRepo,
    @required this.authBloc,
  })  : assert(authRepo != null, 'No $AuthInfoRepository given'),
        assert(buzzerRepo != null, 'No $BuzzerRepository given'),
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
    print('$_tag:mapEventToState($event)');
    if (event is AccountRefresh) {
      yield AccountLoading();

      final int userId = await authRepo.getUserId();

      final user = await buzzerRepo.getUser(userId: userId);
      yield AccountLoaded(user: user);
    }
  }
}
