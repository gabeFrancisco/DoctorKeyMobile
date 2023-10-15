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
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.5)),
      ),
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
