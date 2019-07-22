import 'package:equatable/equatable.dart';

/// [DoorEvent] that must be dispatch to [BuzzerBloc]
abstract class DoorEvent extends Equatable {
  DoorEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class DoorBuzzed extends DoorEvent {
  final int doorId;

  DoorBuzzed({this.doorId}) : super([doorId]);

  @override
  String toString() => '$runtimeType{ '
      'doorId: $doorId'
      ' }';
}
