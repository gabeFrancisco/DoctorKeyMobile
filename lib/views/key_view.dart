import 'package:doctorkey/repositories/keys_repository.dart';
import 'package:doctorkey/views/home_view.dart';
import 'package:doctorkey/views/update_key_view.dart';
import 'package:doctorkey/widgets/key_view_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Key.dart';

class KeyView extends StatelessWidget {
  final KeyModel model;
  const KeyView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var keyRepository = Provider.of<KeysRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        title: Text("${model.manufactor} - ${model.model}",
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateKeyView(keyModel: model)));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        removeDialog(context, keyRepository, model.id!));
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 25),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.green.shade400,
                border: Border.all(color: Colors.green.shade400, width: 1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50), bottomRight: Radius.circular(35))),
          ),
          KeyViewInfo(label: "Tipo", data: model.keyType, icon: Icons.type_specimen),
          KeyViewInfo(
            label: "Lâmina",
            data: model.bladeType,
            icon: Icons.key,
          ),
          KeyViewInfo(label: "Serviço", data: model.serviceType, icon: Icons.room_service),
          KeyViewInfo(label: "Ano", data: model.year, icon: Icons.pin),
          KeyViewInfo(label: "Botões", data: model.buttons.toString(), icon: Icons.dialpad),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.text_fields,
                      size: 30,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Observações: ",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(model.observation))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Preço: ",
                  style: TextStyle(
                      color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "R\$${model.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.green.shade500, fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AlertDialog removeDialog(BuildContext context, KeysRepository keysRepository, String keyId) {
  return AlertDialog(
    title: const Text("Deletar chave"),
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    content: const Text("Tem certeza que deseja remover está chave?"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.grey.shade600),
          )),
      TextButton(
          onPressed: () {
            keysRepository.delete(keyId).then((_) => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomeScreen())));
          },
          child: Text(
            "Remover!",
            style: TextStyle(color: Colors.red.shade400),
          ))
    ],
  );
}
