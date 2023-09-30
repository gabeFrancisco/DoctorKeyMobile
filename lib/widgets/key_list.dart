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
          if (snapshot.hasData) {
            return buildList(context, snapshot.data);
          } else {
            return Container(
              padding: EdgeInsets.all(30),
              color: Colors.blue,
            );
          }
        });
  }
}

Widget buildList(BuildContext context, List<KeyModel> keys) {
  return ListView.builder(
      itemCount: keys.length,
      itemBuilder: (BuildContext context, int index) {
        return KeyCard();
      });
}
