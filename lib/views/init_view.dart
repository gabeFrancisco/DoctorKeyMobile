import 'package:doctorkey/services/login_service.dart';
import 'package:doctorkey/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../widgets/helpers/textField_decoration.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<InitScreen> {
  final storage = const FlutterSecureStorage();
  bool error = false;
  bool loading = false;
  void setError(bool value) {
    setState(() {
      error = value;
    });
  }

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.read(key: 'user_token'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print(snapshot.data);
          if (snapshot.data == null) {
            return buildScaffold(context);
          } else {
            return const HomeScreen();
          }
        });
  }

  Widget buildScaffold(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var usernameCotnroller = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.all(30),
          child: Text(
            "Bem-vindo ao Doctor Key!",
            style: TextStyle(fontSize: 24, color: Colors.green.shade300, fontWeight: FontWeight.bold),
          ),
        ),
        Form(
            key: formKey,
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
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],
                      style: TextStyle(color: Colors.green.shade300),
                      cursorColor: Colors.green.shade300,
                      decoration: setTextFieldDecoration("Usuário", Icon(Icons.person, color: Colors.green.shade300, size: 38))),
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
                      decoration: setTextFieldDecoration("Senha", Icon(Icons.key, color: Colors.green.shade300, size: 38))),
                ),
                if (error)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)), color: Colors.red.shade300),
                    child: const Text(
                      "Usuário ou senha inválidos!",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                //Login button
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setError(false);
                          setLoading(true);
                          LoginService.getLogin(usernameCotnroller.text, passwordController.text).then((res) => {
                                if (res)
                                  {
                                    setLoading(false),
                                    setError(false),
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
                                  }
                                else
                                  {setLoading(false), setError(true)}
                              });
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green.shade300,
                        minimumSize: const Size(150, 48),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: (loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              "Entrar!",
                              style: TextStyle(fontSize: 20),
                            ))),
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
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
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
}
