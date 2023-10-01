import 'package:flutter/material.dart';

InputDecoration setTextFieldDecoration(String label, Icon icon) {
  return InputDecoration(
      errorStyle: TextStyle(color: Colors.red.shade200),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade200)),
      focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade200)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green.shade300)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green.shade300)),
      border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      icon: icon,
      focusColor: Colors.green.shade300,
      labelText: label,
      labelStyle: TextStyle(color: Colors.green.shade300));
}
