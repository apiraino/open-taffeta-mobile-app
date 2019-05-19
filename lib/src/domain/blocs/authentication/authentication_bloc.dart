import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/auth_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Authentication
///
/// Use [AuthenticationEvent] for events and [AuthenticationState] for states
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final String _tag = '$AuthenticationBloc';

  final BuzzerRepository buzzerRepository;
  final AuthPreferencesRepository authPreferencesRepository;
  final AccountBloc accountBloc;

  AuthenticationBloc({
    @required this.buzzerRepository,
    @required this.authPreferencesRepository,
    @required this.accountBloc,
  })  : assert(
          buzzerRepository != null,
          'No $BuzzerRepository given',
        ),
        assert(
          authPreferencesRepository != null,
          'No $AuthPreferencesRepository given',
        ),
        assert(
          accountBloc != null,
          'No $AccountBloc given',
        ),
        super();

  @override
  void dispose() {
    print('$_tag:$dispose()');
    super.dispose();
  }

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    print('$_tag:$mapEventToState($event)');
    if (event is AppStarted) {
      yield* _mapAppStartedToState(event);
    } else if (event is LoggedIn) {
      yield* _mapLoggedInEventToState(event);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutEventToState(event);
    }
  }

  // -----------------------------------------------------------------------
  //                       All Event map to State
  // -----------------------------------------------------------------------

  /// Map [AppStarted] to [AuthenticationState]
  ///
  /// ```dart
  /// yield* _mapAppStartedToState(event);
  /// ```
  Stream<AuthenticationState> _mapAppStartedToState(AppStarted event) async* {
    try {
      yield AuthenticationLoading();

      String token = await authPreferencesRepository.getAccessToken();
      if (token != null) {
        yield AuthenticationAuthenticated();
        accountBloc.dispatch(AccountRefresh());
      } else {
        yield AuthenticationUnauthenticated();
      }
    } catch (error) {
      print('$_tag:$_mapAppStartedToState -> ${error.runtimeType}');
      yield AuthenticationFailed(error: error);
    }
  }

  /// Map [LoggedIn] to [AuthenticationState]
  ///
  /// ```dart
  /// yield* _mapLoggedInEventToState(event);
  /// ```
  Stream<AuthenticationState> _mapLoggedInEventToState(LoggedIn event) async* {
    try {
      yield AuthenticationLoading();
      authPreferencesRepository.setAccessToken(event.token);
      yield AuthenticationAuthenticated();
    } catch (error) {
      print('$_tag:$_mapLoggedInEventToState -> ${error.runtimeType}');
      yield AuthenticationFailed(error: error);
    }
  }

  /// Map [LoggedOut] to [AuthenticationState]
  ///
  /// ```dart
  /// yield* _mapLoggedOutEventToState(event);
  /// ```
  Stream<AuthenticationState> _mapLoggedOutEventToState(
      LoggedOut event) async* {
    try {
      yield AuthenticationLoading();

      await authPreferencesRepository.deleteAccessToken();
      await authPreferencesRepository.deleteAccessTokenExpiration();
      await authPreferencesRepository.deleteRefreshToken();
      await authPreferencesRepository.deleteRefreshTokenExpiration();

      await buzzerRepository.logout();

      yield AuthenticationUnauthenticated();
    } catch (error) {
      print('$_tag:$_mapLoggedOutEventToState -> ${error.runtimeType}');
      yield AuthenticationFailed(error: error);
    }
  }
}
