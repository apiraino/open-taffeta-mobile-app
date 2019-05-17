import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [BuzzerEvent] that must be dispatch to [BuzzerBloc]
abstract class BuzzerEvent extends Equatable {
  BuzzerEvent([List props = const []]) : super(props);
}

class BuzzerDoorPressed extends BuzzerEvent {
  final int doorId;

  BuzzerDoorPressed({@required this.doorId}) : super([doorId]);

  @override
  String toString() => 'BuzzerDoorPressed { doorId: $doorId }';
}
