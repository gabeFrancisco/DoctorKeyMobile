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
        title: Text(model.model, style: const TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
      ),
      body: Center(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade400, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(model.manufactor,
                      style: TextStyle(
                          color: Colors.green.shade400, fontSize: 27, fontWeight: FontWeight.w600)),
                  Text(model.model,
                      style: TextStyle(
                          color: Colors.green.shade400, fontSize: 27, fontWeight: FontWeight.w600))
                ],
              )),
          Text(model.model),
          Text(model.keyType),
          Text(model.bladeType),
          Text(model.serviceType),
          Text(model.year),
          Text(model.buttons.toString()),
          Text(model.price.toStringAsFixed(2)),
          Text(model.observation),
        ],
      )),
    );
  }
}
