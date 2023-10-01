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
  static Future<void> getLogin(
      String username, String password, BuildContext context) async {
    final response = await http.post(
        Uri.parse('http://10.0.10.250:5003/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      User user = User.fromJson(data["user"]);
      const storage = FlutterSecureStorage();
      await storage.write(key: 'user', value: jsonEncode(user));
      await storage.write(key: "user_token", value: data['token']);
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } else {
      throw Exception("Failed to load!");
    }
  }

  static Future<void> clearLoginData(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll().then((_) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const InitScreen())));
  }
}
