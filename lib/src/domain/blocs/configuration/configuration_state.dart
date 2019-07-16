import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/auth_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:meta/meta.dart';

abstract class ConfigurationState extends Equatable {
  ConfigurationState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class ConfigLoading extends ConfigurationState {}

class ConfigFailure extends ConfigurationState {
  final dynamic error;

  ConfigFailure({@required this.error}) : super([error]);
}

class ConfigLoaded extends ConfigurationState {
  final BuzzerRepository buzzerRepository;
  final AuthPreferencesRepository authPreferencesRepository;
  final AppPreferencesRepository appPreferencesRepository;
  final ConfigRepository configRepository;

  ConfigLoaded({
    @required this.buzzerRepository,
    @required this.authPreferencesRepository,
    @required this.appPreferencesRepository,
    @required this.configRepository,
  })  : assert(
          buzzerRepository != null,
          'No $AppPreferencesRepository given',
        ),
        assert(
          authPreferencesRepository != null,
          'No $AuthPreferencesRepository given',
        ),
        assert(
          appPreferencesRepository != null,
          'No $AppPreferencesRepository given',
        ),
        assert(
          configRepository != null,
          'No $ConfigRepository given',
        ),
        super([
          buzzerRepository,
          authPreferencesRepository,
          appPreferencesRepository,
          configRepository,
        ]);
}
