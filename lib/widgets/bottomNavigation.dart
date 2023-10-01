import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
      BottomNavigationBarItem(icon: Icon(Icons.description), label: "Ordens de Serviço"),
      BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Checklist")
    ]);
  }
}
