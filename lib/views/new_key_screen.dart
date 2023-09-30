import 'package:flutter/material.dart';

class NewKeyScreen extends StatefulWidget {
  const NewKeyScreen({super.key});

  @override
  State<NewKeyScreen> createState() => _NewKeyScreenState();
}

class _NewKeyScreenState extends State<NewKeyScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Nova chave!"),
        backgroundColor: Colors.green.shade300,
      ),
      body: Form(
        key: formKey,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
                style: TextStyle(color: Colors.green.shade300),
                cursorColor: Colors.green.shade300,
                decoration: setTextFieldDecoration("Modelo",
                    Icon(Icons.abc, color: Colors.grey.shade500, size: 38))),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
                style: TextStyle(color: Colors.green.shade300),
                cursorColor: Colors.green.shade300,
                decoration: setTextFieldDecoration("Ano",
                    Icon(Icons.pin, color: Colors.grey.shade500, size: 38))),
          ),
        ]),
      ),
    );
  }
}

InputDecoration setTextFieldDecoration(String label, Icon icon) {
  return InputDecoration(
      errorStyle: TextStyle(color: Colors.red.shade200),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade200)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade200)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade400)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500)),
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      icon: icon,
      focusColor: Colors.green.shade300,
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade500));
}
