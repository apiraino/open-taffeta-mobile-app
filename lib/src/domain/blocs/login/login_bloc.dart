import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/login/login.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Login and Registration
///
/// Use [LoginEvent] for events and [LoginState] for states
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String _tag = 'LoginBloc';

  final BuzzerRepository buzzerRepository;
  final AuthenticationBloc authBloc;

  LoginBloc({
    @required this.buzzerRepository,
    @required this.authBloc,
  })  : assert(buzzerRepository != null),
        assert(authBloc != null),
        super();

  @override
  void dispose() {
    print('$_tag:dispose()');
    super.dispose();
  }

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print('$_tag:mapEventToState($event)');

    try {
      if (event is LoginButtonPressed) {
        yield* _mapLoginButtonPressedEventToState(event);
      }
    } catch (error) {
      print('$_tag --> ${error.runtimeType}');
      yield LoginFailure(error: error);
    }
  }

  /// -----------------------------------------------------------------------
  ///                       All Event map to State
  /// -----------------------------------------------------------------------

  /// Map [LoginButtonPressedTriggered] to [LoginState]
  ///
  /// ```dart
  /// yield* _mapLoginTriggeredEventToState(event);
  /// ```
  Stream<LoginState> _mapLoginButtonPressedEventToState(
      LoginButtonPressed event) async* {
    yield LoginLoading();
//    var reponse = await buzzerRepository.login(
//        email: event.email, password: event.password);
//    yield LoginSucceed();
//    authBloc.dispatch(LoggedIn());
  }
}
