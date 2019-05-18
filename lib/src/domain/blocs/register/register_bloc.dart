import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/authentication/authentication.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/register/register.dart';
import 'package:meta/meta.dart';

/// Business Logic Component for Login and Registration
///
/// Use [RegisterEvent] for events and [RegisterState] for states
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final String _tag = 'RegisterBloc';

  RegisterBloc({
    @required this.authBloc,
    @required this.buzzerRepository,
  })  : assert(authBloc != null),
        assert(buzzerRepository != null),
        super();

  final AuthenticationBloc authBloc;
  final BuzzerRepository buzzerRepository;

  @override
  void dispose() {
    print('$_tag:dispose()');
    super.dispose();
  }

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    print('$_tag:$mapEventToState($event)');

    if (event is RegisterButtonPressed) {
      yield* _mapRegisterButtonPressedEventToState(event);
    }
  }

  /// -----------------------------------------------------------------------
  ///                       All Event map to State
  /// -----------------------------------------------------------------------

  /// Map [RegisterButtonPressed] to [RegisterState]
  ///
  /// ```dart
  /// yield* _mapRegisterButtonPressedEventToState(event);
  /// ```
  Stream<RegisterState> _mapRegisterButtonPressedEventToState(
      RegisterButtonPressed event) async* {
    try {
      yield RegisterLoading();
      var response = await buzzerRepository.register(
        email: event.email,
        password: event.password,
      );
      if (response.auth?.accessToken != null) {
        final token = response.auth?.accessToken;
        authBloc.dispatch(LoggedIn(token: token));
        yield RegisterSucceed();
      } else {
        yield RegisterFailure();
      }
    } catch (error) {
      print(
          '$_tag:_mapRegisterButtonPressedEventToState -> ${error.runtimeType}');
      yield RegisterFailure(error: error);
    }
  }
}
