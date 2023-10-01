import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/Key.dart';

class KeysRepository extends ChangeNotifier {
  final List<KeyModel> _list = [];
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, String>> getheaders() async {
    var token = await _storage.read(key: "user_token");
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  UnmodifiableListView<KeyModel> get list => UnmodifiableListView(_list);

  getAll() async {}
}
