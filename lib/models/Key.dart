import 'package:doctorkey/models/BaseEntity.dart';
import 'package:doctorkey/models/User.dart';

class Key extends BaseEntity {
  String manufactor;
  String model;
  String keyType;
  String bladeType;
  String serviceType;
  String year;
  String buttons;
  String price;
  String observation;
  String userId;

  Key({
    required this.manufactor,
    required this.model,
    required this.keyType,
    required this.bladeType,
    required this.serviceType,
    required this.year,
    required this.buttons,
    required this.price,
    required this.observation,
    required this.userId,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });

  factory Key.fromMap(Map<String, dynamic> json) {
    return Key(
        id: json['id'],
        manufactor: json['manufactor'],
        model: json['model'],
        keyType: json['keytype'],
        bladeType: json['bladetype'],
        serviceType: json['servicetype'],
        year: json['year'],
        buttons: json['buttons'],
        price: json['price'],
        observation: json['observation'],
        userId: json['userid'],
        createdAt: json['createdat'],
        updatedAt: json['updatedat']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'manufactor': manufactor,
        'model': model,
        'keyType:': keyType,
        'bladeType': bladeType,
        'serviceType': serviceType,
        'year': year,
        'buttons': buttons,
        'price': price,
        'observation': observation,
        'userId': userId,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
