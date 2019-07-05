import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DoorState extends Equatable {
  DoorState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class DoorInitial extends DoorState {}

class DoorLoading extends DoorState {}

class DoorSucceed extends DoorState {
  final String message;

  DoorSucceed({@required this.message})
      : assert(message != null),
        super();

  @override
  String toString() => '$runtimeType{ message: $message }';
}

class DoorFailure extends DoorState {
  final error;

  DoorFailure({
    @required this.error,
  })  : assert(error != null),
        super([error]);

  @override
  String toString() => '$runtimeType{ '
      'error: $error'
      ' }';
}
