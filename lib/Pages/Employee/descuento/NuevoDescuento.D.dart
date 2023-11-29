import 'package:flutter/material.dart';

import '../../../Controller/ControllerDescuento.Con.dart';
import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';

class CrearDescuento extends StatefulWidget {
  const CrearDescuento({super.key});

  @override
  State<CrearDescuento> createState() => _DestuentoState();
}

class _DestuentoState extends State<CrearDescuento> {
  final TextEditingController desController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? resultMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Descuento',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              BasicText(
                labelText: 'Ingrese Descuento',
                icon: const Icon(Icons.new_label),
                controller: desController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSignInButton(
                    onPress: () {
                      desController.clear();
                    },
                    text: 'Cancelar',
                  ),
                  CustomSignInButton(
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform the save operation

                        double des = double.parse(desController.text);
                        String result = await createDescuento(des);
                        desController.clear();

                        // Update the state with the result
                        setState(() {
                          resultMessage = result;
                        });
                      }
                    },
                    text: 'Guardar',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Show the result message
              resultMessage != null
                  ? Text(
                      resultMessage!,
                      style: const TextStyle(color: Colors.green),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
