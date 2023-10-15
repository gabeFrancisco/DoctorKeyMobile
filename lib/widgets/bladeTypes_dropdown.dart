import 'package:doctorkey/constants/bladeTypes.dart';
import 'package:flutter/material.dart';

class BladeTypesDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String initialValue;
  const BladeTypesDropdown({super.key, required this.onChanged, required this.initialValue});

  @override
  State<BladeTypesDropdown> createState() => _BladeTypesDropdownState();
}

class _BladeTypesDropdownState extends State<BladeTypesDropdown> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        isExpanded: true,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        onChanged: widget.onChanged,
        value: widget.initialValue,
        items: BladeTypes.list.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
      ),
    );
  }
}
