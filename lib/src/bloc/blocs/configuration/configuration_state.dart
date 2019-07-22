import 'package:equatable/equatable.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/app_preferences_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/auth_info_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/config_repository.dart';
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
  final ConfigRepository configRepo;
  final AuthInfoRepository authRepo;
  final BuzzerRepository buzzerRepo;
  final AppPreferencesRepository appPrefsRepo;

  ConfigLoaded({
    @required this.configRepo,
    @required this.authRepo,
    @required this.buzzerRepo,
    @required this.appPrefsRepo,
  })  : assert(
          configRepo != null,
          'No $ConfigRepository given',
        ),
        assert(
          authRepo != null,
          'No $AuthInfoRepository given',
        ),
        assert(
          buzzerRepo != null,
          'No $BuzzerRepository given',
        ),
        assert(
          appPrefsRepo != null,
          'No $AppPreferencesRepository given',
        ),
        super([
          configRepo,
          authRepo,
          buzzerRepo,
          appPrefsRepo,
        ]);
}
