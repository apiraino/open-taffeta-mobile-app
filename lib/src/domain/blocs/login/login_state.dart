import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {
  final AuthModel auth;
  final UserModel user;

  LoginSucceed({
    @required this.auth,
    @required this.user,
  })  : assert(auth != null),
        assert(user != null),
        super([auth, user]);
}

class LoginFailure extends LoginState {
  final dynamic error;

  LoginFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: ${error.runtimeType} }';
}
