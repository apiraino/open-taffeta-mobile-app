import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

/// [AuthenticationEvent] that must be dispatch to [AuthenticationBloc]
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppStarted extends AuthenticationEvent {}

class Authenticated extends AuthenticationEvent {
  final AuthModel auth;
  final UserModel user;

  Authenticated({
    @required this.auth,
    @required this.user,
  })  : assert(
          auth != null,
          'No $AuthModel given',
        ),
        assert(
          user != null,
          'No $UserModel given',
        ),
        super([auth, user]);

  @override
  String toString() => '$runtimeType{ '
      'auth: $auth, '
      'user: $user'
      ' }';
}

class LoggedOut extends AuthenticationEvent {}
