import 'package:flutter/material.dart';

import '../../../Controller/ControllerCategoria.Con.dart';
import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';

class EditorCategoria extends StatefulWidget {
  final String id;
  final String name;
  const EditorCategoria({super.key, required this.id, required this.name});

  @override
  State<EditorCategoria> createState() => _EditorCategoriaState();
}

class _EditorCategoriaState extends State<EditorCategoria> {
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
                children: [
                  const Center(
                    child: Text(
                      'Categoria  Actual',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ID:',
                        style: TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                      Text(
                        widget.id,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categoria:',
                        style: TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Categoria Editar',
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BasicText(
                    labelText: 'Ingrese el tipo de producto',
                    icon: const Icon(Icons.new_label),
                    controller: categoriaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  CustomSignInButton(
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        // Perform the save operation
                        String tipoDeProducto = categoriaController.text;
                        final result = await updateCategoria(
                            widget.id.toString(), tipoDeProducto);
                        categoriaController.clear();
                        // Update the state with the result
                        setState(() {
                          resultMessage = result;
                        });
                      }
                    },
                    text: 'Editar',
                  ),
                  const SizedBox(height: 20),
                  resultMessage != null
                      ? Text(
                          resultMessage!,
                          style: const TextStyle(color: Colors.green),
                        )
                      : const SizedBox.shrink(),
                ],
              ))),
    );
  }
}
