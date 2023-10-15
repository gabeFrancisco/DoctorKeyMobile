import 'package:doctorkey/repositories/keys_repository.dart';
import 'package:doctorkey/widgets/key_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeyList extends StatefulWidget {
  const KeyList({super.key});

  @override
  State<KeyList> createState() => _KeyListState();
}

class _KeyListState extends State<KeyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<KeysRepository>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    var keys = Provider.of<KeysRepository>(context, listen: true).list;
    return Consumer<KeysRepository>(builder: (context, cart, child) {
      if (cart.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade400),
          ),
        );
      } else if (cart.list.isEmpty) {
        return const Center(
          child: Text("Nenhuma chave cadastrada!"),
        );
      } else {
        return ListView(
          children: keys.map((e) => KeyCard(model: e)).toList(),
        );
      }
    });
  }
}
