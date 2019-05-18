import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {}

class RegisterFailure extends RegisterState {
  final Error error;

  RegisterFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: ${error.runtimeType} }';
}
