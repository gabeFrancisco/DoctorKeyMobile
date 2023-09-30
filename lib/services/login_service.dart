import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static Future<http.Response> getLogin(
      String username, String password) async {
    final response = await http.post(
        Uri.parse('http://10.0.10.250:5003/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    final Map data = jsonDecode(response);
  }
}
