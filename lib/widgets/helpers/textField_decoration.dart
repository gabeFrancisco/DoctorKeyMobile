import 'package:flutter/material.dart';

@override
InputDecoration setTextFieldDecoration() {
  return InputDecoration(
      errorStyle: TextStyle(color: Colors.red.shade300),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      icon: const Icon(Icons.key, color: Colors.white, size: 38),
      focusColor: Colors.white,
      labelText: "Senha",
      labelStyle: const TextStyle(color: Colors.white));
}
