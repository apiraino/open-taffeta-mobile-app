import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

/// [AccountState] that must be dispatch to [AccountBloc]
abstract class AccountState extends Equatable {
  AccountState([List props = const []]) : super(props);

  @override
  String toString() => 'AccountState{}';
}

class AccountLoading extends AccountState {
  AccountLoading();

  @override
  String toString() => 'AccountLoading{}';
}

class AccountUninitialized extends AccountState {
  AccountUninitialized() : super();

  @override
  String toString() => 'AccountUninitialized{}';
}

class AccountInitialized extends AccountState {
  final UserModel user;

  AccountInitialized({this.user}) : super();

  @override
  String toString() => 'AccountInitialized { user: $user }';
}

class AccountFailure extends AccountState {
  final Error error;

  AccountFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'AccountFailure{}';
}
