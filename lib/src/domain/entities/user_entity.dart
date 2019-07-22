import 'package:flutter_door_buzzer/src/domain/entities/base_entity.dart';

abstract class UserEntity extends BaseEntity {
  String email;

  String role;

  bool isActive;
}
