import 'dart:convert';
import 'package:doctorkey/repositories/keys_repository.dart';
import 'package:doctorkey/views/dashboard_view.dart';
import 'package:doctorkey/views/init_view.dart';
import 'package:doctorkey/views/new_key_screen.dart';
import 'package:doctorkey/widgets/app_drawer.dart';
import 'package:doctorkey/widgets/bottom_navigation.dart';
import 'package:doctorkey/widgets/delegates/CustomSearchDelegate.dart';
import 'package:doctorkey/widgets/key_list.dart';
import 'package:doctorkey/widgets/numbered_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../models/User.dart';

class KeyListView extends StatefulWidget {
  const KeyListView({super.key});

  @override
  State<KeyListView> createState() => _KeyListViewState();
}

class _KeyListViewState extends State<KeyListView> {
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
  var keyList = Provider.of<KeysRepository>(context, listen: true).list;
  return Scaffold(
    appBar: AppBar(
      foregroundColor: Colors.white,
      title: const Text("Chaves"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () =>
              {showSearch(context: context, delegate: CustomSearchDelegate(keyList.toList()))},
          icon: const Icon(
            Icons.search,
            size: 28,
          ),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewKeyScreen()))
          },
          icon: const Icon(
            Icons.add,
            size: 32,
          ),
          color: Colors.white,
        )
      ],
      backgroundColor: Colors.green.shade400,
    ),
    body: const Center(child: KeyList()),
  );
  // drawer: AppDrawer());
}
