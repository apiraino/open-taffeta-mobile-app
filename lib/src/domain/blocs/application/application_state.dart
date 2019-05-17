import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [ApplicationState] that must be dispatch to [ApplicationBloc]
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppInitialized extends ApplicationState {
  AppInitialized({@required this.theme}) : super([theme]);

  String theme;

  @override
  String toString() => '$runtimeType{ theme: $theme }';
}

class AppFailure extends ApplicationState {
  AppFailure({@required this.error}) : super([error]);

  Error error;

  @override
  String toString() => '$runtimeType{ error: $error }';
}

class AppLoading extends ApplicationState {}
