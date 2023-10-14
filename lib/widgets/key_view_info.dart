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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(7))),
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
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}
