import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/login/login.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/register/register.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/auth_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Authentication
///
/// Use [AuthenticationEvent] for events and [AuthenticationState] for states
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final String _tag = '$AuthenticationBloc';

  final BuzzerRepository buzzerRepository;
  final AuthRepository authPreferencesRepository;

  final LoginBloc loginBloc;
  final RegisterBloc registerBloc;

  StreamSubscription registerBlocSubscription;
  StreamSubscription loginBlocSubscription;

  AuthenticationBloc({
    @required this.buzzerRepository,
    @required this.authPreferencesRepository,
    @required this.loginBloc,
    @required this.registerBloc,
  })  : assert(
          buzzerRepository != null,
          'No $BuzzerRepository given',
        ),
        assert(
          authPreferencesRepository != null,
          'No $AuthRepository given',
        ),
        assert(
          loginBloc != null,
          'No $LoginBloc given',
        ),
        assert(
          registerBloc != null,
          'No $RegisterBloc given',
        ),
        super() {
    loginBlocSubscription = loginBloc.state.listen((state) {
      if (state is LoginSucceed) {
        dispatch(Authenticated(auth: state.auth, user: state.user));
      }
    });

    registerBlocSubscription = registerBloc.state.listen((state) {
      if (state is RegisterSucceed) {
        dispatch(Authenticated(auth: state.auth, user: state.user));
      }
    });
  }

  @override
  void dispose() {
    print('$_tag:$dispose()');
    loginBlocSubscription?.cancel();
    registerBlocSubscription?.cancel();
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
    } else if (event is Authenticated) {
      yield* _mapAuthenticatedEventToState(event);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutEventToState(event);
    }
  }

  /// -----------------------------------------------------------------------
  ///                       All Event map to State
  /// -----------------------------------------------------------------------

  /// Map [AppStarted] to [AuthenticationState]
  ///
  /// ```dart
  /// yield* _mapAppStartedToState(event);
  /// ```
  Stream<AuthenticationState> _mapAppStartedToState(AppStarted event) async* {
    try {
      yield AuthenticationLoading();

      final String token = await authPreferencesRepository.getAccessToken();

      if (token != null) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    } catch (e) {
      print('$_tag:$_mapAppStartedToState -> ${e.runtimeType}');
      yield AuthenticationFailed(error: e);
    }
  }

  /// Map [Authenticated] to [AuthenticationState]
  ///
  /// ```dart
  /// yield* _mapAuthenticatedEventToState(event);
  /// ```
  Stream<AuthenticationState> _mapAuthenticatedEventToState(
      Authenticated event) async* {
    try {
      yield AuthenticationLoading();
      await authPreferencesRepository.setAccessToken(event.auth.accessToken);
      await authPreferencesRepository.setUserId(event.auth.userId);
      yield AuthenticationAuthenticated();
    } catch (e) {
      print('$_tag:$_mapAuthenticatedEventToState -> ${e.runtimeType}');
      yield AuthenticationFailed(error: e);
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
      await authPreferencesRepository.deleteUserId();

      await buzzerRepository.logout();

      yield AuthenticationUnauthenticated();
    } catch (e) {
      print('$_tag:$_mapLoggedOutEventToState -> ${e.runtimeType}');
      yield AuthenticationFailed(error: e);
    }
  }
}
