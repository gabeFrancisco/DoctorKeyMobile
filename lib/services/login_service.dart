import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<http.Response> getLogin(
      String username, String password) async {
    return await http.post(Uri.parse('http://10.0.10.250:5003/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));
  }
}
