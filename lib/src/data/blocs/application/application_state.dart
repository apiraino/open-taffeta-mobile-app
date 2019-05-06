import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [ApplicationState] that must be dispatch to [ApplicationBloc]
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);
}

class AppUninitialized extends ApplicationState {
  AppUninitialized() : super();

  @override
  String toString() => 'AppUninitialized';
}

class AppInitialized extends ApplicationState {
  AppInitialized({@required this.theme}) : super([theme]);

  String theme;

  @override
  String toString() => 'AppInitialized { theme: $theme }';
}

class AppFailure extends ApplicationState {
  AppFailure({@required this.error}) : super([error]);

  Error error;

  @override
  String toString() => 'AppFailure { error: $error }';
}

class AppLoading extends ApplicationState {
  AppLoading() : super();

  @override
  String toString() => 'AppLoading';
}
