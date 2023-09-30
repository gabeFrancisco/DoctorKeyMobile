import 'package:flutter/material.dart';

import '../models/Key.dart';

class KeyCard extends StatelessWidget {
  final KeyModel model;
  const KeyCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.green.shade100,
      onTap: () => print("God bless you!"),
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 4,
        surfaceTintColor: Colors.grey.shade300,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.model,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(model.year)
                ],
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  "R\$${model.price}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green.shade400,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
