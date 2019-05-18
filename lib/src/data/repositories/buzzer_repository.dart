import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

/// Interface for all Buzzer repositories
abstract class BuzzerRepository {
  Future<AuthLoginResponseModel> login({
    @required String email,
    @required String password,
  });

  Future<AuthSignupResponseModel> register({
    @required String email,
    @required String password,
  });

  Future<BuzzerResponseModel> buzzDoor({
    @required int doorId,
  });
}
