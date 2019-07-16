import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/application/application.dart';
import 'package:meta/meta.dart';

/// [ApplicationState] that must be dispatch to [ApplicationBloc]
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class AppLoading extends ApplicationState {}

class AppInitialized extends ApplicationState {
  final ThemeType theme;

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
