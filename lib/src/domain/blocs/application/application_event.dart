import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [ApplicationEvent] that must be dispatch to [ApplicationBloc]
abstract class ApplicationEvent extends Equatable {
  ApplicationEvent([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppInitialization extends ApplicationEvent {}

class AppThemeToggled extends ApplicationEvent {
  final String theme;

  AppThemeToggled({@required this.theme})
      : assert(theme != null),
        super();

  @override
  String toString() => '$runtimeType{ theme: $theme }';
}
