import 'package:flutter/material.dart';

class ServiceOrderView extends StatelessWidget {
  const ServiceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordens de Serviço"),
        backgroundColor: Colors.green.shade400,
      ),
    );
  }
}
