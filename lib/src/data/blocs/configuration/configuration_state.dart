import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/config_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/preferences_repository.dart';
import 'package:meta/meta.dart';

abstract class ConfigurationState extends Equatable {
  ConfigurationState([List props = const []]) : super(props);
}

class ConfigLoading extends ConfigurationState {}

class ConfigLoaded extends ConfigurationState {
  final BuzzerRepository buzzerRepository;
  final PreferencesRepository preferencesRepository;
  final ConfigRepository configRepository;

  ConfigLoaded({
    @required this.buzzerRepository,
    @required this.preferencesRepository,
    @required this.configRepository,
  })  : assert(buzzerRepository != null),
        assert(preferencesRepository != null),
        assert(configRepository != null),
        super([buzzerRepository, preferencesRepository]);
}
