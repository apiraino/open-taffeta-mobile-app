import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [RegisterEvent] that must be dispatch to [RegisterBloc]
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);

  @override
  String toString() => 'RegisterEvent{}';
}

class RegisterButtonPressed extends RegisterEvent {
  RegisterButtonPressed({@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null),
        super([email, password]);

  final String email;
  final String password;

  @override
  String toString() =>
      'RegisterButtonPressed { email: $email, password: HIDDEN }';
}
