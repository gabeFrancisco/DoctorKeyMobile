import 'package:doctorkey/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: const Text("Painel"),
        foregroundColor: Colors.white,
      ),
      // drawer: const AppDrawer(),
      bottomNavigationBar: const BottomNavigation(
        selected: 0,
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
          ),
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: Card(
                elevation: 7,
                color: Colors.green.shade400,
                child: Container(
                    padding: const EdgeInsets.all(25),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chaves cadastradas:",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "7",
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: Card(
                elevation: 7,
                color: Colors.blue.shade400,
                child: Container(
                    padding: const EdgeInsets.all(25),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ordens de serviço:",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "3",
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: Card(
                elevation: 7,
                color: Colors.red.shade300,
                child: Container(
                    padding: const EdgeInsets.all(25),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Checklists Ativos:",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: Card(
                elevation: 7,
                color: Colors.yellow.shade600,
                child: Container(
                    padding: const EdgeInsets.all(25),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Clientes cadastrados:",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "8",
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
