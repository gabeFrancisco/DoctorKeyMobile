import 'dart:convert';

import 'package:doctorkey/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/User.dart';

class UserRepository extends ChangeNotifierProvider {
  final String _apiUrl = ApiUrls.list[1];
  late User _user;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool isLoading = false;

  UserRepository({super.key, required super.create});

  Future<Map<String, String>> getHeaders() async {
    var token = await _storage.read(key: "user_token");
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<int> login(String username, String password) async {
    final response = await http.post(Uri.parse('$_apiUrl/users/login'),
        body: jsonEncode(<String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      User user = User.fromJson(data["user"]);

      await _storage.write(key: 'user', value: jsonEncode(user));
      await _storage.write(key: "user_token", value: data['token']);
    }

    return response.statusCode;
  }
}
