import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/bloc/blocs/login/login.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Login
///
/// Use [LoginEvent] for events and [LoginState] for states
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String _tag = '$LoginBloc';

  final BuzzerRepository buzzerRepository;

  LoginBloc({
    @required this.buzzerRepository,
  })  : assert(buzzerRepository != null),
        super();

  @override
  void dispose() {
    print('$_tag:$dispose()');
    super.dispose();
  }

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print('$_tag:$mapEventToState($event)');

    if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedEventToState(event);
    }
  }

  /// --------------------------------------------------------------------------
  ///                       All Event map to State
  /// --------------------------------------------------------------------------

  /// Map [LoginButtonPressedTriggered] to [LoginState]
  ///
  /// ```dart
  /// yield* _mapLoginTriggeredEventToState(event);
  /// ```
  Stream<LoginState> _mapLoginButtonPressedEventToState(
      LoginButtonPressed event) async* {
    try {
      yield LoginLoading();
      final response = await buzzerRepository.login(
          email: event.email, password: event.password);

      if (response.auth?.accessToken != null) {
        yield LoginSucceed(auth: response.auth, user: response.user);
      } else {
        // TODO: Add no login exception
        yield LoginFailure();
      }
    } catch (error) {
      print(
          '$_tag:$_mapLoginButtonPressedEventToState -> ${error.runtimeType}');
      yield LoginFailure(error: error);
    }
  }
}
