import 'package:doctorkey/repositories/keys_repository.dart';
import 'package:doctorkey/repositories/user_repository.dart';
import 'package:doctorkey/views/init_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRepository>.value(value: UserRepository()),
      ChangeNotifierProvider<KeysRepository>.value(value: KeysRepository())
    ],
    child: const MyApp(),
  ));
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
              seedColor: Colors.green.shade400, primary: Colors.green.shade400),
          useMaterial3: true,
          textTheme: TextTheme(
              bodyMedium:
                  TextStyle(color: Colors.grey.shade600).apply(color: Colors.grey.shade600)),
          iconTheme: IconThemeData(color: Colors.grey.shade600)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, body: InitScreen(key: key));
  }
}
