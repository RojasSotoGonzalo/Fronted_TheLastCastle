import 'package:flutter/material.dart';

import '../../../Controller/ControllerCategoria.Con.dart';
import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';

class CrearCategoria extends StatefulWidget {
  const CrearCategoria({super.key});

  @override
  State<CrearCategoria> createState() => _CrearCategoriaState();
}

class _CrearCategoriaState extends State<CrearCategoria> {
  final TextEditingController categoriaController = TextEditingController();
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
                  'Categoria',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              BasicText(
                labelText: 'Ingrese Categoria',
                icon: const Icon(Icons.new_label),
                controller: categoriaController,
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
                      categoriaController.clear();
                    },
                    text: 'Cancelar',
                  ),
                  CustomSignInButton(
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform the save operation
                        String categoria = categoriaController.text;
                        String result = await createCategoria(categoria);
                        categoriaController.clear();

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
