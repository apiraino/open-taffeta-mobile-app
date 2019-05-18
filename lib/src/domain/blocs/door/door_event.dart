import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [DoorEvent] that must be dispatch to [BuzzerBloc]
abstract class DoorEvent extends Equatable {
  DoorEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class DoorBuzzed extends DoorEvent {
  final int doorId;

  DoorBuzzed({@required this.doorId})
      : assert(doorId != null, 'No door ID given'),
        super([doorId]);

  @override
  String toString() => '$runtimeType{ doorId: $doorId }';
}
