import 'package:doctorkey/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
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
                child: Text(
                  "Bem-vindo ao Doctor Key!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.green.shade300,
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
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            style: TextStyle(color: Colors.green.shade300),
                            cursorColor: Colors.green.shade300,
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
                            style: TextStyle(color: Colors.green.shade300),
                            cursorColor: Colors.green.shade300,
                            decoration: setTextFieldDecoration(
                                "Senha",
                                Icon(Icons.key,
                                    color: Colors.green.shade300, size: 38))),
                      ),

                      //Login button
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Analisando!")));
                                var login = LoginService.getLogin(
                                        usernameCotnroller.text,
                                        passwordController.text,
                                        context)
                                    .then((value) => {
                                          // if (value.statusCode == 500)
                                          //   {
                                          //     showDialog(
                                          //         context: context,
                                          //         builder:
                                          //             (BuildContext context) {
                                          //           return dialog(context,
                                          //               "Usuário ou senha incorretos!");
                                          //         }),
                                          //   }
                                          // else
                                          //   {
                                          //     showDialog(
                                          //         context: context,
                                          //         builder:
                                          //             (BuildContext context) {
                                          //           return dialog(context,
                                          //               "Usuário logado!");
                                          //         }),
                                          //   }
                                        });
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green.shade300,
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
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(color: Colors.green.shade300),
                            )),
                      ),

                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não é um usuário? ",
                                style: TextStyle(color: Colors.green.shade300),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Cadastre-se aqui!",
                                    style: TextStyle(
                                      color: Colors.green.shade300,
                                      decorationColor: Colors.green.shade300,
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

AlertDialog dialog(BuildContext context, String message) {
  return AlertDialog(
    backgroundColor: Colors.white,
    content: Container(
      margin: const EdgeInsets.all(15),
      child: Text(message),
    ),
    actions: [
      TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red.shade300,
            minimumSize: const Size(150, 48),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Ok",
          )),
    ],
  );
}
