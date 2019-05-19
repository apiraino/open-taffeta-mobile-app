import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/door/door.dart';
import 'package:meta/meta.dart';

class BuzzerBloc extends Bloc<DoorEvent, DoorState> {
  final String _tag = '$BuzzerBloc';
  final BuzzerRepository buzzerRepository;

  BuzzerBloc({
    @required this.buzzerRepository,
  })  : assert(buzzerRepository != null),
        super();

  @override
  void dispose() {
    print('$_tag:$dispose()');
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

  /// Map [DoorBuzzed] to [DoorState]
  ///
  /// ```dart
  /// yield* _mapBuzzerDoorPressedEventToState(event);
  /// ```
  Stream<DoorState> _mapBuzzerDoorPressedEventToState(DoorBuzzed event) async* {
    try {
      yield DoorLoading();
      var response = await buzzerRepository.buzzDoor(
        doorId: event.doorId,
      );
      yield DoorSucceed(message: response.details);
    } catch (error) {
      print('$_tag:$_mapBuzzerDoorPressedEventToState -> ${error.runtimeType}');
      yield DoorFailure(error: error);
    }
  }
}
