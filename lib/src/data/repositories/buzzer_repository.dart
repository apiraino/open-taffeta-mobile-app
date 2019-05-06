import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

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
