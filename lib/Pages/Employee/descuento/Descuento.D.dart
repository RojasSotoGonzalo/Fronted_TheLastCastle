// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Controller/ControllerDescuento.Con.dart';
import 'ListDescuento.D.dart';

class Descuen extends ConsumerWidget {
  const Descuen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deslist = ref.watch(descuentoProvider);
    return Scaffold(
      body: deslist.when(
        data: (deslist) {
          if (deslist.isNotEmpty) {
            return ListDescuento(deslist: deslist);
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
          Navigator.pushNamed(context, 'nuevodes').then((value) {
            // Recarga el proveedor cuando se vuelve de la página 'nuevoTipo'
            ref.refresh(descuentoProvider);
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
