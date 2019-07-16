import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

/// Interface for all Buzzer repositories
abstract class BuzzerRepository {
  Future<AuthResponseModel> login({
    @required String email,
    @required String password,
  });

  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  });

  Future<void> logout();

  Future<BuzzerResponseModel> buzzDoor({
    @required int doorId,
  });

  Future<UserModel> getUser({
    @required int userId,
  });
}
