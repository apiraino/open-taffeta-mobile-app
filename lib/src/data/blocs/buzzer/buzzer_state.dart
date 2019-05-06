import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BuzzerState extends Equatable {
  BuzzerState([List props = const []]) : super(props);

  @override
  String toString() => 'BuzzerState{}';
}

class BuzzerInitial extends BuzzerState {
  BuzzerInitial() : super();

  @override
  String toString() => 'BuzzerInitial {}';
}

class BuzzerLoading extends BuzzerState {
  BuzzerLoading() : super();

  @override
  String toString() => 'BuzzerLoading {}';
}

class BuzzerSucceed extends BuzzerState {
  final String message;

  BuzzerSucceed({@required this.message})
      : assert(message != null),
        super();

  @override
  String toString() => 'BuzzerSucceed { message: $message }';
}

class BuzzerFailure extends BuzzerState {
  final Error error;

  BuzzerFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'BuzzerFailure { error: $error }';
}
