abstract class BaseEntity {
  int id;

  @override
  String toString() => '$runtimeType{ '
      'id: $id'
      ' }';
}
