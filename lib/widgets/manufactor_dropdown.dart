import 'package:doctorkey/constants/manufactors.dart';
import 'package:flutter/material.dart';

class ManufactorDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String initialValue;
  const ManufactorDropdown({super.key, required this.onChanged, required this.initialValue});

  @override
  State<ManufactorDropdown> createState() => _ManufactorDropdownState();
}

class _ManufactorDropdownState extends State<ManufactorDropdown> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        isExpanded: true,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        onChanged: widget.onChanged,
        value: widget.initialValue,
        items: Manufactors.list.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
      ),
    );
  }
}
