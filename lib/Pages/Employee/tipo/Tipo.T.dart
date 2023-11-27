import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontendthelastcastle/Controller/ControllerTipoDeProducto.Con.Dart';

import 'ListTipoDeProducto.T.dart';

class Tipo extends ConsumerWidget {
  const Tipo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipoDeProductoList = ref.watch(tipoDeProductoProvider);

    return Scaffold(
      body: tipoDeProductoList.when(
        data: (tiposList) {
          if (tiposList.isNotEmpty) {
            return ListTipoDeProducto(tiposList: tiposList);
          } else {
            return const Center(
              child: Text('No hay Tipos de Producto Agregados'),
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
          Navigator.pushNamed(context, 'nuevoTipo');
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
