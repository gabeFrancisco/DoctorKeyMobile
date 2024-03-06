import 'package:doctorkey/views/checklists_view.dart';
import 'package:doctorkey/views/config_view.dart';
import 'package:doctorkey/views/customers_view.dart';
import 'package:doctorkey/views/dashboard_view.dart';
import 'package:doctorkey/views/key_list_view.dart';
import 'package:doctorkey/views/service_order_view.dart';
import 'package:doctorkey/views/services_view.dart';
import 'package:doctorkey/widgets/bottom_navigation.dart';
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

  setActualPage(page) {
    setState(() {
      actualPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setActualPage,
        children: const [
          DashboardView(),
          KeyListView(),
          ServiceOrderView(),
          ServiceOrderView(),
          ChecklistsView(),
          CustomersView(),
          ServicesView(),
          ConfigView()
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selected: actualPage,
        pc: pc,
      ),
    );
  }
}
