import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);

  @override
  String toString() => 'RegisterState{}';
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super();

  @override
  String toString() => 'RegisterInitial {}';
}

class RegisterLoading extends RegisterState {
  RegisterLoading() : super();

  @override
  String toString() => 'RegisterLoading {}';
}

class RegisterSucceed extends RegisterState {
  RegisterSucceed() : super();

  @override
  String toString() => 'RegisterSucceed {}';
}

class RegisterFailure extends RegisterState {
  final Error error;

  RegisterFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'RegisterFailure { error: $error }';
}
