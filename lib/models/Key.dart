import 'dart:ffi';

import 'package:doctorkey/models/BaseEntity.dart';

class KeyModel extends BaseEntity {
  String manufactor;
  String model;
  String keyType;
  String bladeType;
  String serviceType;
  String year;
  String buttons;
  String price;
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
        buttons: json['buttons'].toString(),
        price: json['price'].toString(),
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
        'buttons': int.parse(buttons),
        'price': double.parse(price),
        'observation': observation,
      };
}
