import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [AuthenticationEvent] that must be dispatch to [AuthenticationBloc]
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token})
      : assert(token != null, 'No token given'),
        super([token]);

  @override
  String toString() => '$runtimeType{ token: $token }';
}

class LoggedOut extends AuthenticationEvent {}

class RegisterIn extends AuthenticationEvent {
  RegisterIn({@required this.username, @required this.password})
      : super([username, password]);

  String username;
  String password;

  @override
  String toString() => '$runtimeType{ username: $username, password: HIDDEN }';
}

class RegisterOut extends AuthenticationEvent {}
