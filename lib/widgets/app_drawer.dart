import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/User.dart';
import '../views/dashboard_view.dart';
import '../views/init_view.dart';
import '../views/key_list_view.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.read(key: "user"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center();
          } else {
            User user = User.fromJson(json.decode(snapshot.data));
            return Drawer(
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.green.shade400),
                      child: Column(
                        children: [
                          Text(
                            "Bem-vindo ${user?.username}!",
                            style: const TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                storage.deleteAll();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const InitScreen()));
                              },
                              child: const Text(
                                "Sair",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.bar_chart_sharp,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        selectedColor: Colors.green.shade400,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const DashboardView()));
                        },
                        title: Text(
                          "Painel",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.key,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        selectedColor: Colors.green.shade400,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const KeyListView()));
                        },
                        title: Text(
                          "Chaves",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Icon(
                            Icons.description,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          title: Text(
                            "Ordens de Serviço",
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.task,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        title: Text(
                          "Checklists",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.group,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        title: Text(
                          "Clientes",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
