import 'package:doctorkey/constants/manufactors.dart';
import 'package:flutter/material.dart';

class ManufactorDropdown extends StatefulWidget {
  const ManufactorDropdown({super.key});

  @override
  State<ManufactorDropdown> createState() => _ManufactorDropdownState();
}

class _ManufactorDropdownState extends State<ManufactorDropdown> {
  String dropdownValue = Manufactors.list.first;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        value: dropdownValue,
        items: Manufactors.list.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
