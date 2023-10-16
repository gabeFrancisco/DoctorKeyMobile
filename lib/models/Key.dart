import 'package:doctorkey/models/BaseEntity.dart';

class KeyModel extends BaseEntity {
  String manufactor;
  String model;
  String keyType;
  String bladeType;
  String serviceType;
  String year;
  int buttons;
  double price;
  String observation;
  String? userId;

  KeyModel({
    required this.manufactor,
    required this.model,
    required this.keyType,
    required this.bladeType,
    required this.serviceType,
    required this.year,
    required this.buttons,
    required this.price,
    required this.observation,
    this.userId,
    super.id,
    super.createdAt,
    super.updatedAt,
  });

  factory KeyModel.fromJson(Map<String, dynamic> json) {
    return KeyModel(
        id: json['id'],
        manufactor: json['manufactor'],
        model: json['model'],
        keyType: json['keyType'],
        bladeType: json['bladeType'],
        serviceType: json['serviceType'],
        year: json['year'],
        buttons: json['buttons'],
        price: json['price'],
        observation: json['observation'],
        userId: json['userId'],
        createdAt: '',
        updatedAt: '');
  }

  Map<String, dynamic> toJson() => {
        'manufactor': manufactor,
        'model': model,
        'keyType': keyType,
        'bladeType': bladeType,
        'serviceType': serviceType,
        'year': year,
        'buttons': buttons,
        'price': price,
        'observation': observation,
      };
}
