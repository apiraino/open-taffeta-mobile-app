import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {
  final AuthModel auth;
  final UserModel user;

  RegisterSucceed({
    @required this.auth,
    @required this.user,
  })  : assert(auth != null),
        assert(user != null),
        super([auth, user]);
}

class RegisterFailure extends RegisterState {
  final dynamic error;

  RegisterFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: ${error.runtimeType} }';
}
