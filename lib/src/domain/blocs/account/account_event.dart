import 'package:equatable/equatable.dart';

/// [AccountEvent] that must be dispatch to [AccountBloc]
abstract class AccountEvent extends Equatable {
  AccountEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AccountRefresh extends AccountEvent {}
