import 'package:flutter/material.dart';

class KeyViewInfo extends StatelessWidget {
  final String label;
  final String data;
  final IconData icon;
  const KeyViewInfo({super.key, required this.label, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$label: $data",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}
