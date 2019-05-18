import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// [ApplicationState] that must be dispatch to [ApplicationBloc]
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppLoading extends ApplicationState {}

class AppInitialized extends ApplicationState {
  final String theme;

  AppInitialized({@required this.theme}) : super([theme]);

  @override
  String toString() => '$runtimeType{ theme: $theme }';
}

class AppFailure extends ApplicationState {
  final Error error;

  AppFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: $error }';
}
