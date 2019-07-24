import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/bloc/blocs/door/door.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/config_repository.dart';
import 'package:meta/meta.dart';

class BuzzerBloc extends Bloc<DoorEvent, DoorState> {
  final String _tag = '$BuzzerBloc';
  final BuzzerRepository buzzerRepository;
  final ConfigRepository configRepository;

  BuzzerBloc({
    @required this.buzzerRepository,
    @required this.configRepository,
  })  : assert(buzzerRepository != null, 'No $BuzzerRepository given'),
        assert(configRepository != null, 'No $ConfigRepository given'),
        super();

  @override
  void dispose() {
    print('$_tag:dispose()');
    super.dispose();
  }

  @override
  DoorState get initialState => DoorInitial();

  @override
  Stream<DoorState> mapEventToState(DoorEvent event) async* {
    if (event is DoorBuzzed) {
      yield* _mapBuzzerDoorPressedEventToState(event);
    }
  }

  /// --------------------------------------------------------------------------
  ///                       All Event map to State
  /// --------------------------------------------------------------------------

  /// Map [DoorBuzzed] to [DoorState]
  ///
  /// ```dart
  /// yield* _mapBuzzerDoorPressedEventToState(event);
  /// ```
  Stream<DoorState> _mapBuzzerDoorPressedEventToState(DoorBuzzed event) async* {
    try {
      yield DoorLoading();

      final int doorId = event?.doorId ?? await configRepository.getDoorId();

      final response = await buzzerRepository.buzzDoor(
        doorId: doorId,
      );
      yield DoorSucceed(message: response.details);
    } catch (error) {
      print('$_tag:_mapBuzzerDoorPressedEventToState -> ${error.runtimeType}');
      yield DoorFailure(error: error);
    }
  }
}
