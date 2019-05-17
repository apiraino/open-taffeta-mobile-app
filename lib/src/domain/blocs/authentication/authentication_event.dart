import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [AuthenticationEvent] that must be dispatch to [AuthenticationBloc]
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  AppStarted() : super();

  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { sessionId: $token }';
}

class LoggedOut extends AuthenticationEvent {
  LoggedOut() : super();

  @override
  String toString() => 'LoggedOut';
}

class RegisterIn extends AuthenticationEvent {
  RegisterIn({@required this.username, @required this.password})
      : super([username, password]);

  String username;
  String password;

  @override
  String toString() => 'RegisterIn';
}

class RegisterOut extends AuthenticationEvent {
  RegisterOut() : super();

  @override
  String toString() => 'RegisterOut';
}
