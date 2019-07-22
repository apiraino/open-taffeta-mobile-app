import 'package:flutter_door_buzzer/src/domain/entities/base_entity.dart';

abstract class DoorEntity extends BaseEntity {
  String email;

  String role;

  bool isActive;

  @override
  String toString() => '$runtimeType{ '
      'id: $id, '
      'email: $email, '
      'role: $role, '
      'isActive: $isActive'
      ' }';
}
