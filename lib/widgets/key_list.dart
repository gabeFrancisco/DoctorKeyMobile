import 'package:doctorkey/models/Key.dart';
import 'package:doctorkey/services/key_service.dart';
import 'package:doctorkey/widgets/key_card.dart';
import 'package:flutter/material.dart';

class KeyList extends StatefulWidget {
  const KeyList({super.key});

  @override
  State<KeyList> createState() => _KeyListState();
}

class _KeyListState extends State<KeyList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: KeyService.fetchAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.green.shade300),
                  strokeWidth: 5.0,
                ),
              );
            case ConnectionState.none:
              return const Center(
                child: Text("Nenhuma chave cadastrada!"),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Ocorreu um erro ao carregar os dados!"),
                );
              } else {
                return buildList(context, snapshot.data);
              }
          }
        });
  }
}

Widget buildList(BuildContext context, List<KeyModel> keys) {
  return ListView(
    children: keys.map((e) => KeyCard(model: e)).toList(),
  );
}
