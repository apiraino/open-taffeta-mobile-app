import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/buzzer/buzzer.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/data/repositories/preferences_repository.dart';
import 'package:meta/meta.dart';

class BuzzerBloc extends Bloc<BuzzerEvent, BuzzerState> {
  final String _tag = 'BuzzerBloc';
  final BuzzerRepository buzzerRepository;
  final PreferencesRepository preferencesRepository;

  BuzzerBloc({
    @required this.buzzerRepository,
    @required this.preferencesRepository,
  })  : assert(buzzerRepository != null),
        assert(preferencesRepository != null),
        super();

  @override
  void dispose() {
    print('$_tag:dispose()');
    super.dispose();
  }

  @override
  BuzzerState get initialState => BuzzerInitial();

  @override
  Stream<BuzzerState> mapEventToState(BuzzerEvent event) async* {
    if (event is BuzzerDoorPressed) {
      yield* _mapBuzzerDoorPressedEventToState(event);
    }
  }

  /// Map [BuzzerDoorPressed] to [BuzzerState]
  ///
  /// ```dart
  /// yield* _mapBuzzerDoorPressedEventToState(event);
  /// ```
  Stream<BuzzerState> _mapBuzzerDoorPressedEventToState(
      BuzzerDoorPressed event) async* {
    try {
      yield BuzzerLoading();
      var response = await buzzerRepository.buzzDoor(
        doorId: event.doorId,
      );
      yield BuzzerSucceed(message: response.details);
    } catch (error) {
      print('$_tag:_mapBuzzerDoorPressedEventToState -> error.toString()');
      yield BuzzerFailure(error: error);
    }
  }
}
