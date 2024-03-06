import 'package:doctorkey/views/dashboard_view.dart';
import 'package:doctorkey/widgets/key_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int actualPage = 1;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: actualPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          DashboardView(),
          KeyList(),
        ],
      ),
    );
  }
}
