import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationUninitialized extends AuthenticationState {
  AuthenticationUninitialized() : super();

  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated() : super();

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  AuthenticationUnauthenticated() : super();

  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading() : super();

  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationFailed extends AuthenticationState {
  AuthenticationFailed({this.error}) : super();

  final Error error;

  @override
  String toString() => 'AuthenticationFailed';
}
