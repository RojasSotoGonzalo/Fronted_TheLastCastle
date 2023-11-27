import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontendthelastcastle/Models/TipoDeProducto.M.dart';

class ListTipoDeProducto extends ConsumerWidget {
  const ListTipoDeProducto({Key? key, required this.tiposList})
      : super(key: key);

  final List<TipoDeProducto> tiposList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: tiposList.length,
      itemBuilder: (BuildContext context, int index) {
        final tipo = tiposList[index];

        return GestureDetector(
          onTap: () {
            // Agrega la lógica que desees cuando se toque un elemento de la lista
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tipo.kindOfProduct,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Puedes agregar más detalles del tipo aquí si es necesario
                      ],
                    ),
                    // Puedes agregar más elementos si es necesario
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Eliminacion correcta'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el AlertDialog
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}
