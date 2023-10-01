// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:doctorkey/models/User.dart';
import 'package:doctorkey/views/home_view.dart';
import 'package:doctorkey/views/init_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<bool> getLogin(String username, String password, BuildContext context) async {
    final response = await http.post(Uri.parse('http://10.0.10.250:5003/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      User user = User.fromJson(data["user"]);
      await _storage.write(key: 'user', value: jsonEncode(user));
      await _storage.write(key: "user_token", value: data['token']);
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }

      return true;
    } else if (response.statusCode == 401) {
      return false;
    }

    return false;
  }

  static Future<void> clearLoginData(BuildContext context) async {
    await _storage.deleteAll().then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InitScreen())));
  }
}
