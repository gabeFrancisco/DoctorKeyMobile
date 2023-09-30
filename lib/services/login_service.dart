// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:doctorkey/models/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static Future<void> getLogin(String username, String password) async {
    final response = await http.post(
        Uri.parse('http://10.0.10.250:5003/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    User user;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      user = User.fromJson(data["user"]);
      const storage = FlutterSecureStorage();
      await storage.write(key: 'user', value: jsonEncode(user));
      await storage.write(key: "user_token", value: data['token']);
      final val = await storage.read(key: 'user');
      print(val);
    } else {
      throw Exception("Failed to load!");
    }
  }
}
