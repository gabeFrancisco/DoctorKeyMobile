import 'dart:convert';
import 'package:doctorkey/views/init_view.dart';
import 'package:doctorkey/views/new_key_screen.dart';
import 'package:doctorkey/widgets/key_list.dart';
import 'package:doctorkey/widgets/numbered_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/User.dart';

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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade400),
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
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 35,
          ),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }),
      centerTitle: true,
      title: const Text(
        "Chaves",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      actions: [
        IconButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewKeyScreen()))
          },
          icon: const Icon(
            Icons.add,
            size: 34,
          ),
          color: Colors.white,
        )
      ],
      backgroundColor: Colors.green.shade400,
    ),
    body: const Center(child: KeyList()),
    drawer: Drawer(
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
                    "Bem-vindo ${user.username}!",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        storage.deleteAll();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const InitScreen()));
                      },
                      child: const Text(
                        "Sair",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.bar_chart_sharp,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
                title: Text(
                  "Painel",
                  style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.key,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
                title: Text(
                  "Chaves",
                  style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Colors.grey.shade600,
                    size: 30,
                  ),
                  title: Text(
                    "Ordens de Serviço",
                    style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                  ),
                  trailing: const NumberedNotification(number: 3)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.task,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
                title: Text(
                  "Checklists",
                  style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.group,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
                title: Text(
                  "Clientes",
                  style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
