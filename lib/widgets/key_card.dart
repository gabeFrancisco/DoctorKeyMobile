import 'package:flutter/material.dart';

class KeyCard extends StatelessWidget {
  const KeyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Key!")],
      ),
    );
  }
}
