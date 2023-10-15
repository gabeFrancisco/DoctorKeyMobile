import 'package:doctorkey/constants/keyTypes.dart';
import 'package:flutter/material.dart';

class KeyTypesDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String initialValue;
  const KeyTypesDropdown({super.key, required this.onChanged, required this.initialValue});

  @override
  State<KeyTypesDropdown> createState() => _KeyTypesDropdownState();
}

class _KeyTypesDropdownState extends State<KeyTypesDropdown> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        isExpanded: true,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        onChanged: widget.onChanged,
        value: widget.initialValue,
        items: KeyTypes.list.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
      ),
    );
  }
}
