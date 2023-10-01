import 'dart:convert';

import 'package:doctorkey/views/init_view.dart';
import 'package:doctorkey/views/new_key_screen.dart';
import 'package:doctorkey/widgets/key_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/User.dart';
import '../widgets/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.read(key: 'user'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade300),
                ),
              );
            case ConnectionState.none:
              return const Center(
                child: Text("Ocorreu um erro ao carregar os dados!"),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Ocorreu um erro ao carregar os dados!"),
                );
              } else {
                User user = User.fromJson(json.decode(snapshot.data));
                return buildScaffold(context, user, storage);
              }
          }
        });
  }
}

Widget buildScaffold(BuildContext context, User user, FlutterSecureStorage storage) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          onPressed: () {
            storage.deleteAll();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InitScreen()));
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
    bottomNavigationBar: const BottomNavigation(),
    floatingActionButton: Container(
      margin: const EdgeInsets.all(15),
      child: FloatingActionButton(
          onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewKeyScreen()))},
          backgroundColor: Colors.green.shade300,
          elevation: 5,
          child: const Icon(Icons.add, color: Colors.white)),
    ),
  );
}
