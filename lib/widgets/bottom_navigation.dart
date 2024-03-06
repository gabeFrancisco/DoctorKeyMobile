import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selected;
  const BottomNavigation({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        currentIndex: selected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.key), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: ""),
        ]);
  }
}
