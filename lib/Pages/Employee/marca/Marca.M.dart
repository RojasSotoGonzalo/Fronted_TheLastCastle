/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Categ extends ConsumerWidget {
  const Categ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorialist = ref.watch(categoriaProvider);
    return Scaffold(
      body: categorialist.when(
        data: (categorialis) {
          if (categorialis.isNotEmpty) {
            return ListCategorias(categorlist: categorialis);
          } else {
            return const Center(
              child: Text('No hay Categorias Agregados'),
            );
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => const Center(
          child: Text('Error al cargar los tipos de producto'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Cambia a la página para agregar un nuevo tipo de producto
          Navigator.pushNamed(context, 'nuevocat').then((value) {
            // Recarga el proveedor cuando se vuelve de la página 'nuevoTipo'
            ref.refresh(categoriaProvider);
          });
        },
        child: const Icon(
          Icons.add_circle_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
*/