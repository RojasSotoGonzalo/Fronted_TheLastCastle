// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Controller/ControllerPromocion.Con.dart';
import 'ListPromocion.P.dart';

class Promocion extends ConsumerWidget {
  const Promocion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promlis = ref.watch(promocionProvider);
    return Scaffold(
      body: promlis.when(
        data: (promlis) {
          if (promlis.isNotEmpty) {
            return ListPromocion(deslist: promlis);
          } else {
            return const Center(
              child: Text('No hay Categorias Agregados'),
            );
          }
        },
        error: (error, stackTrace) => const Center(
          child: Text('Error al Promocion sin Productos'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Cambia a la página para agregar un nuevo tipo de producto
          Navigator.pushNamed(context, 'nuevopro').then((value) {
            // Recarga el proveedor cuando se vuelve de la página 'nuevoTipo'
            ref.refresh(promocionProvider);
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
