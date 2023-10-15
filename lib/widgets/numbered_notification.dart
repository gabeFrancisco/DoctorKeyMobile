import 'package:flutter/material.dart';

class NumberedNotification extends StatelessWidget {
  final int number;
  const NumberedNotification({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)), color: Colors.red.shade300),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
