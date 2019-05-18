import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BuzzerState extends Equatable {
  BuzzerState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class BuzzerInitial extends BuzzerState {}

class BuzzerLoading extends BuzzerState {}

class BuzzerSucceed extends BuzzerState {
  final String message;

  BuzzerSucceed({@required this.message})
      : assert(message != null),
        super();

  @override
  String toString() => '$runtimeType{ message: $message }';
}

class BuzzerFailure extends BuzzerState {
  final Error error;

  BuzzerFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: $error }';
}
