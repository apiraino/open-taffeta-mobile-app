import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [BuzzerEvent] that must be dispatch to [BuzzerBloc]
abstract class BuzzerEvent extends Equatable {
  BuzzerEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class BuzzerDoorPressed extends BuzzerEvent {
  final int doorId;

  BuzzerDoorPressed({@required this.doorId})
      : assert(doorId != null, 'No door ID given'),
        super([doorId]);

  @override
  String toString() => '$runtimeType{ doorId: $doorId }';
}
