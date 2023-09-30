import 'package:flutter/material.dart';

import '../models/Key.dart';

class KeyCard extends StatelessWidget {
  final KeyModel model;
  const KeyCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(model.model)],
      ),
    );
  }
}
