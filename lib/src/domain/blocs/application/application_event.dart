import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:meta/meta.dart';

/// [ApplicationEvent] that must be dispatch to [ApplicationBloc]
abstract class ApplicationEvent extends Equatable {
  ApplicationEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppInitialization extends ApplicationEvent {}

class AppDarkModeToggled extends ApplicationEvent {
  final bool darkMode;

  AppDarkModeToggled({@required this.darkMode})
      : assert(darkMode != null),
        super([darkMode]);

  @override
  String toString() => '$runtimeType{ '
      'darkMode: $darkMode'
      ' }';
}
