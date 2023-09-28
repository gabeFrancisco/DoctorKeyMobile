import 'package:doctorkey/services/login_service.dart';
import 'package:flutter/material.dart';
import '../widgets/helpers/textField_decoration.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<InitScreen> {
  final _formKey = GlobalKey<FormState>();
  var usernameCotnroller = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: const Text(
                  "Bem-vindo!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
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
                            controller: usernameCotnroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira seu nome de usuário!';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.green),
                            cursorColor: Colors.green,
                            decoration: setTextFieldDecoration(
                                "Usuário",
                                Icon(Icons.person,
                                    color: Colors.green.shade300, size: 38))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insira sua senha!';
                              }
                              if (value.length < 8) {
                                return 'Sua senha deve ser maior ou igual a 8 digitos';
                              }
                              return null;
                            },
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: setTextFieldDecoration(
                                "Senha",
                                Icon(Icons.key,
                                    color: Colors.green.shade300, size: 38))),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Analisando!")));
                              }

                              LoginService.getLogin(usernameCotnroller.text,
                                  passwordController.text);
                            },
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
