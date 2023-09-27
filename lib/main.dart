import 'package:doctorkey/services/login_service.dart';
import 'package:doctorkey/views/init_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Key',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green, primary: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Login.getLogin('gabeFrank', '77777777')
        .then((value) => print(value.body))
        .onError((error, stackTrace) => print(error));
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: InitScreen(key: key));
  }
}
