import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/Key.dart';
import 'package:http/http.dart' as http;

class KeyService {
  static Future<List<KeyModel>> fetchAll() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'user_token');
    final response = await http.get(Uri.parse('http://10.0.10.250:5003/keys'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((e) => KeyModel.fromJson(e)).toList();
    } else {
      throw Exception(response);
    }
  }
}
