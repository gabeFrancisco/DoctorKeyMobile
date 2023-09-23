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
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: const Text(
                  "Bem-vindo ao Doctor Key!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
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
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              icon: Icon(Icons.key,
                                  color: Colors.white, size: 38),
                              focusColor: Colors.white,
                              labelText: "Senha",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                              minimumSize: const Size(150, 48),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: const Text(
                              "Entrar!",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Esqueci minha senha",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Não é um usuário? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Cadastre-se aqui!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ]),
                      )
                    ],
                  ))
            ]),
      ),
    );
  }
}
