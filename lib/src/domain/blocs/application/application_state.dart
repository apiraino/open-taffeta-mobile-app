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

class AppUninitialized extends ApplicationState {}

class AppInitialized extends ApplicationState {
  final bool isDarkMode;

  AppInitialized({@required this.isDarkMode}) : super([isDarkMode]);

  @override
  String toString() => '$runtimeType{ isDarkMode: $isDarkMode }';
}

class AppFailure extends ApplicationState {
  final dynamic error;

  AppFailure({@required this.error}) : super([error]);

  @override
  String toString() => '$runtimeType{ error: $error }';
}
