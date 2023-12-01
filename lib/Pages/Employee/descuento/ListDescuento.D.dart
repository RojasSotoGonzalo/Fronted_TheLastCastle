// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Controller/ControllerDescuento.Con.dart';
import '../../../Models/Descuento.M.dart';
import 'EditarDescuento.D.dart';

class ListDescuento extends ConsumerWidget {
  const ListDescuento({super.key, required this.deslist});
  final List<DescuentoDTO> deslist;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> eliminardescuento(String descId) async {
      await deleteDescuento(descId);
      ref.refresh(descuentoProvider);
    }

    return ListView.builder(
      itemCount: deslist.length,
      itemBuilder: (BuildContext context, int index) {
        final descuento = deslist[index];

        return GestureDetector(
          onTap: () {
            // Agrega la lógica que desees cuando se toque un elemento de la lista
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditDescuentos(
                  id: descuento.idDiscount,
                  name: descuento.discount.toString(),
                ),
              ),
            );
            ref.refresh(descuentoProvider);
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
                          descuento.discount.toString(),
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
                        eliminardescuento(descuento.idDiscount);
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
