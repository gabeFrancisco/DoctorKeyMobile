import 'dart:convert';

import 'package:doctorkey/views/init_view.dart';
import 'package:doctorkey/widgets/key_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/User.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.read(key: 'user'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            User user = User.fromJson(json.decode(snapshot.data));
            return buildScaffold(context, user, storage);
          } else {
            return const Center();
          }
        });
  }
}

Widget buildScaffold(
    BuildContext context, User user, FlutterSecureStorage storage) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          onPressed: () {
            storage.deleteAll();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const InitScreen()));
          },
          icon: const Icon(Icons.logout),
          color: Colors.white,
        )
      ],
      title: Text(
        "Bem-vindo ${user.username}!",
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.green.shade300,
    ),
    body: const Center(child: KeyList()),
  );
}
