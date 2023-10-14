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
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  border: Border.all(color: Colors.green.shade400, width: 2),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("${model.manufactor} - ${model.model}",
                      style: const TextStyle(
                          color: Colors.white, fontSize: 27, fontWeight: FontWeight.w600)),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.type_specimen),
                Text(model.keyType),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.try_sms_star_rounded),
                Text(model.bladeType),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.design_services),
                Text(model.serviceType),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.pin),
                Text(model.year),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.dialpad),
                Text(model.buttons.toString()),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  size: 36,
                ),
                Text(
                  model.price.toStringAsFixed(2),
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
