import 'package:flutter_door_buzzer/src/data/managers/buzzer_api_manager.dart';
import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

class CloudBuzzerRepository extends BuzzerRepository {
  final BuzzerApiManager buzzerApiManager;

  CloudBuzzerRepository({@required this.buzzerApiManager})
      : assert(buzzerApiManager != null),
        super();

  @override
  Future<AuthResponseModel> login({
    @required String email,
    @required String password,
  }) async {
    return await buzzerApiManager.login(email: email, password: password);
  }

  @override
  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  }) async {
    return await buzzerApiManager.register(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await buzzerApiManager.logout();
  }

  @override
  Future<BuzzerResponseModel> buzzDoor({@required int doorId}) async {
    return await buzzerApiManager.openDoor(doorId: doorId);
  }

  @override
  Future<UserModel> getUser({@required int userId}) async {
    final response = await buzzerApiManager.getUser(userId: userId);
    return response.user;
  }
}
