import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/Key.dart';

class KeysRepository extends ChangeNotifier {
  List<KeyModel> _list = [];
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool isLoading = false;

  Future<Map<String, String>> getHeaders() async {
    var token = await _storage.read(key: "user_token");
    return <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
  }

  UnmodifiableListView<KeyModel> get list => UnmodifiableListView(_list);

  Future<void> getAll() async {
    isLoading = true;
    final response = await http.get(Uri.parse('http://10.0.10.250:5003/keys'), headers: await getHeaders());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      _list = data.reversed.map((e) => KeyModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }
  }
}
