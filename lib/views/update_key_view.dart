import 'package:doctorkey/constants/keyTypes.dart';
import 'package:doctorkey/constants/manufactors.dart';
import 'package:doctorkey/models/Key.dart';
import 'package:doctorkey/repositories/keys_repository.dart';
import 'package:doctorkey/views/home_view.dart';
import 'package:doctorkey/widgets/bladeTypes_dropdown.dart';
import 'package:doctorkey/widgets/keyTypes_dropdown.dart';
import 'package:doctorkey/widgets/manufactor_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/bladeTypes.dart';
import '../constants/serviceTypes.dart';
import '../widgets/serviceTypes_dropdown.dart';

class UpdateKeyView extends StatefulWidget {
  final KeyModel keyModel;
  const UpdateKeyView({super.key, required this.keyModel});

  @override
  State<UpdateKeyView> createState() => _UpdateKeyViewState();
}

class _UpdateKeyViewState extends State<UpdateKeyView> {
  late KeyModel model;

  @override
  void initState() {
    // TODO: implement initState
    model = widget.keyModel;
    manufactorController.text = model.manufactor;
    keyTypeController.text = model.keyType;
    bladeTypeController.text = model.bladeType;
    serviceTypeController.text = model.serviceType;

    modelController.text = model.model;
    yearController.text = model.year;
    buttonsController.text = model.buttons.toString();
    priceController.text = model.price.toStringAsFixed(2);
    observationController.text = model.observation;
    super.initState();
  }

  var manufactorController = TextEditingController();
  var keyTypeController = TextEditingController();
  var bladeTypeController = TextEditingController();
  var serviceTypeController = TextEditingController();

  var modelController = TextEditingController();
  var yearController = TextEditingController();
  var buttonsController = TextEditingController();
  var priceController = TextEditingController();
  var observationController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var keysRepository = Provider.of<KeysRepository>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Atualizar chave"),
        backgroundColor: Colors.green.shade400,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Fabricante"),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ManufactorDropdown(
                        onChanged: (String? value) {
                          setState(() {
                            manufactorController.text = value!;
                          });
                        },
                        initialValue: manufactorController.text,
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tipo"),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: KeyTypesDropdown(
                        onChanged: (String? value) {
                          setState(() {
                            keyTypeController.text = value!;
                          });
                        },
                        initialValue: keyTypeController.text,
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Lâmina"),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: BladeTypesDropdown(
                        onChanged: (String? value) {
                          setState(() {
                            bladeTypeController.text = value!;
                          });
                        },
                        initialValue: bladeTypeController.text,
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Serviço"),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ServiceTypesDropdown(
                        onChanged: (String? value) {
                          setState(() {
                            serviceTypeController.text = value!;
                          });
                        },
                        initialValue: serviceTypeController.text,
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: modelController,
                  style: TextStyle(color: Colors.green.shade300),
                  cursorColor: Colors.green.shade300,
                  decoration: setTextFieldDecoration(
                      "Modelo", Icon(Icons.directions_car, color: Colors.grey.shade600, size: 38))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: yearController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.green.shade300),
                  cursorColor: Colors.green.shade300,
                  decoration: setTextFieldDecoration(
                      "Ano", Icon(Icons.pin, color: Colors.grey.shade600, size: 38))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: buttonsController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.green.shade300),
                  cursorColor: Colors.green.shade300,
                  decoration: setTextFieldDecoration("Número de botões",
                      Icon(Icons.dialpad, color: Colors.grey.shade600, size: 38))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.green.shade300),
                  cursorColor: Colors.green.shade300,
                  decoration: setTextFieldDecoration(
                      "Preço", Icon(Icons.attach_money, color: Colors.grey.shade600, size: 38))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: observationController,
                  maxLines: 5,
                  style: TextStyle(color: Colors.green.shade300),
                  cursorColor: Colors.green.shade300,
                  decoration: setTextFieldDecoration(
                      "Observações", Icon(Icons.article, color: Colors.grey.shade600, size: 38))),
            ),
          ]),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(15),
        child: FloatingActionButton(
            onPressed: () => {
                  keysRepository
                      .update(
                          KeyModel(
                              manufactor: manufactorController.text,
                              model: modelController.text,
                              keyType: keyTypeController.text,
                              bladeType: bladeTypeController.text,
                              serviceType: serviceTypeController.text,
                              year: yearController.text,
                              buttons: int.parse(buttonsController.text),
                              price: double.parse(priceController.text),
                              observation: observationController.text),
                          model.id!)
                      .then((_) => {
                            keysRepository.getAll().then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeScreen())))
                          })
                },
            backgroundColor: Colors.green.shade300,
            elevation: 5,
            child: const Icon(Icons.check, color: Colors.white)),
      ),
    );
  }
}

InputDecoration setTextFieldDecoration(String label, Icon icon) {
  return InputDecoration(
      errorStyle: TextStyle(color: Colors.red.shade200),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade200)),
      focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade200)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green.shade400)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
      border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      icon: icon,
      focusColor: Colors.green.shade300,
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade600));
}
