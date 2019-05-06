import 'package:equatable/equatable.dart';

/// [AccountEvent] that must be dispatch to [AccountBloc]
abstract class AccountEvent extends Equatable {
  AccountEvent([List props = const []]) : super(props);

  @override
  String toString() => 'AccountEvent {}';
}

class AccountRefresh extends AccountEvent {
  AccountRefresh() : super();

  @override
  String toString() => 'AccountRefresh {}';
}
