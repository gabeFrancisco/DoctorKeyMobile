import 'package:doctorkey/constants/serviceTypes.dart';
import 'package:flutter/material.dart';

class ServiceTypesDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String initialValue;
  const ServiceTypesDropdown(
      {super.key, required this.onChanged, required this.initialValue});

  @override
  State<ServiceTypesDropdown> createState() => _ServiceTypesDropdownState();
}

class _ServiceTypesDropdownState extends State<ServiceTypesDropdown> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        isExpanded: true,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        onChanged: widget.onChanged,
        value: widget.initialValue,
        items: ServiceTypes.list.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
