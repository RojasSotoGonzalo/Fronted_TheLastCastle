import 'package:flutter/material.dart';

import '../../../Controller/ControllerDescuento.Con.dart';
import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';

class EditDescuentos extends StatefulWidget {
  final String id;
  final String name;
  const EditDescuentos({super.key, required this.id, required this.name});

  @override
  State<EditDescuentos> createState() => _EditDescuentosState();
}

class _EditDescuentosState extends State<EditDescuentos> {
  final TextEditingController desctController = TextEditingController();
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
                      'Descuento Actual',
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
                        'Descuento Actual:',
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
                    labelText: 'Ingrese el Nuevo descuento',
                    icon: const Icon(Icons.new_label),
                    controller: desctController,
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
                        double des = double.parse(desctController.text);

                        final result =
                            await updateDescuento(widget.id.toString(), des);
                        desctController.clear();
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
