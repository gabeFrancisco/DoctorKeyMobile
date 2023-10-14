import 'package:doctorkey/views/key_view.dart';
import 'package:flutter/material.dart';

import '../models/Key.dart';

class KeyCard extends StatelessWidget {
  final KeyModel model;
  const KeyCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.green.shade100,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => KeyView(model: model)));
      },
      child: Card(
        elevation: 7,
        shadowColor: const Color.fromARGB(65, 145, 145, 145),
        surfaceTintColor: Colors.grey.shade400,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${model.manufactor} ${model.model}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "R\$${model.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 20, color: Colors.green.shade400, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.pin,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          model.year,
                          style:
                              TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.type_specimen,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              model.keyType,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Icon(Icons.key, color: Colors.grey.shade500)),
                            Text(
                              model.bladeType,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
