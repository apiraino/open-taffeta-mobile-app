import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [LoginEvent] that must be dispatch to [LoginBloc]
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  }) : super([email, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: HIDDEN }';
}
