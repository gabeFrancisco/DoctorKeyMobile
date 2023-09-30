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
    return const SingleChildScrollView(
      child: KeyCard(),
    );
  }
}
