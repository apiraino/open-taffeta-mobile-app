import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:meta/meta.dart';

abstract class BuzzerDataStore {
  /// --------------------------------------------------------------------------
  ///                                   Auth
  /// --------------------------------------------------------------------------

  /// Login
  Future<AuthResponseModel> login({
    @required String email,
    @required String password,
  });

  /// Register
  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  });

  /// Logout
  Future<void> logout();

  /// --------------------------------------------------------------------------
  ///                                   Users
  /// --------------------------------------------------------------------------

  /// Fetch User details [userId]
  Future<UserResponseModel> getUser({@required int userId});

  /// --------------------------------------------------------------------------
  ///                                   Doors
  /// --------------------------------------------------------------------------

  /// Open door [doorId]
  Future<BuzzerResponseModel> openDoor({@required int doorId});
}
