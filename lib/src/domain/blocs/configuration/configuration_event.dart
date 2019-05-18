import 'package:equatable/equatable.dart';

abstract class ConfigurationEvent extends Equatable {
  ConfigurationEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppLaunched extends ConfigurationEvent {}
