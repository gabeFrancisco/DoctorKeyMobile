import 'package:doctorkey/models/base_entity.dart';

class User extends BaseEntity {
  String username;
  String name;
  String email;

  @override
  User(
      {required this.name,
      required this.username,
      required this.email,
      required super.id,
      required super.createdAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        email: json['email'],
        createdAt: json['createdAt']);
  }
}
