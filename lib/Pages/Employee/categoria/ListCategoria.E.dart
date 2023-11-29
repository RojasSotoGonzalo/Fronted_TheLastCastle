// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontendthelastcastle/Controller/ControllerCategoria.Con.dart';

import '../../../Models/Categoria.M.dart';
import 'EditarCategoria.E.dart';

class ListCategorias extends ConsumerWidget {
  const ListCategorias({super.key, required this.categorlist});
  final List<Categoria> categorlist;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> eliminarCategoria(String categoryId) async {
      await deleteCategoria(categoryId);
      ref.refresh(categoriaProvider);
    }

    return ListView.builder(
      itemCount: categorlist.length,
      itemBuilder: (BuildContext context, int index) {
        final categoria = categorlist[index];

        return GestureDetector(
          onTap: () {
            // Agrega la lógica que desees cuando se toque un elemento de la lista
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditorCategoria(
                  id: categoria.idCategory,
                  name: categoria.category,
                ),
              ),
            );
            ref.refresh(categoriaProvider);
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
                          categoria.category,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Puedes agregar más detalles del tipo aquí si es necesario
                      ],
                    ),
                    // Agrega un icono de eliminar
                    GestureDetector(
                      onTap: () {
                        eliminarCategoria(categoria.idCategory);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
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
