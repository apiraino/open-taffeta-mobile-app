import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [ApplicationEvent] that must be dispatch to [ApplicationBloc]
abstract class ApplicationEvent extends Equatable {
  ApplicationEvent([List props = const []]) : super(props);

  @override
  String toString() => 'ApplicationEvent{}';
}

class AppInitialization extends ApplicationEvent {
  AppInitialization() : super();

  @override
  String toString() => 'AppInitialization {}';
}

class AppThemeToggled extends ApplicationEvent {
  final String theme;

  AppThemeToggled({@required this.theme})
      : assert(theme != null),
        super();

  @override
  String toString() => 'AppThemeToggled{}';
}
