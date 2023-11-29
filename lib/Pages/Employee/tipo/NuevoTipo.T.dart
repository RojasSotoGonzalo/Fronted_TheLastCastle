// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../Controller/ControllerTipoDeProducto.Con.dart';
import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';

class CreateTipo extends StatefulWidget {
  const CreateTipo({Key? key}) : super(key: key);

  @override
  _CreateTipoState createState() => _CreateTipoState();
}

class _CreateTipoState extends State<CreateTipo> {
  final TextEditingController tipoDeProductoController =
      TextEditingController();
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
                  'Tipo de Producto',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              BasicText(
                labelText: 'Ingrese el tipo de producto',
                icon: const Icon(Icons.new_label),
                controller: tipoDeProductoController,
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
                      tipoDeProductoController.clear();
                    },
                    text: 'Cancelar',
                  ),
                  CustomSignInButton(
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform the save operation
                        String tipoDeProducto = tipoDeProductoController.text;
                        String result =
                            await createTipoDeProducto(tipoDeProducto);
                        tipoDeProductoController.clear();

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
