abstract class BaseEntity {
  String id;
  String createdAt;
  late String updatedAt;

  BaseEntity({required this.id, required this.createdAt});
}
