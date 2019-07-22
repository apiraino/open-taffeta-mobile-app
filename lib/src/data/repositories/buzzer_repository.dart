import 'package:flutter_door_buzzer/src/data/models/api_models.dart';
import 'package:flutter_door_buzzer/src/data/models/user_model.dart';
import 'package:flutter_door_buzzer/src/data/stores/buzzer/buzzer_data_store_factory.dart';
import 'package:flutter_door_buzzer/src/domain/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

class ImplBuzzerRepository extends BuzzerRepository {
  final BuzzerDataStoreFactory factory;

  ImplBuzzerRepository({@required this.factory})
      : assert(factory != null),
        super();

  @override
  Future<AuthResponseModel> login({
    @required String email,
    @required String password,
  }) {
    return factory.create().login(email: email, password: password);
  }

  @override
  Future<AuthResponseModel> register({
    @required String email,
    @required String password,
  }) async {
    return await factory.create().register(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await factory.create().logout();
  }

  @override
  Future<BuzzerResponseModel> buzzDoor({@required int doorId}) {
    return factory.create().openDoor(doorId: doorId);
  }

  @override
  Future<UserDataModel> getUser({@required int userId}) async {
    final response = await factory.create().getUser(userId: userId);
    return response.user;
  }
}
