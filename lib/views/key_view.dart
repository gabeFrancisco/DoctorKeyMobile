import 'package:doctorkey/views/update_key_view.dart';
import 'package:doctorkey/widgets/key_view_info.dart';
import 'package:flutter/material.dart';

import '../models/Key.dart';

class KeyView extends StatelessWidget {
  final KeyModel model;
  const KeyView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
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
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(7))),
            child: Row(
              children: [
                const Icon(
                  Icons.text_fields,
                  size: 30,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Observações: ${model.observation}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money,
                  size: 36,
                  color: Colors.green.shade500,
                ),
                Text(
                  "R\$${model.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.green.shade500, fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
