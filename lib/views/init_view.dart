import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<InitScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo ao Doctor Key!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            icon: Icon(Icons.person,
                                color: Colors.white, size: 38),
                            focusColor: Colors.white,
                            labelText: "Usuário",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            icon: Icon(Icons.password,
                                color: Colors.white, size: 38),
                            focusColor: Colors.white,
                            labelText: "Usuário",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(30),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Entrar"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green.shade300))))
                  ],
                ))
          ]),
    );
  }
}
