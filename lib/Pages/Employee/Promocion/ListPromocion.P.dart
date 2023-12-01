// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Controller/ControllerPromocion.Con.dart';
import '../../../Models/Promocion.M.dart';
import 'EditarPromocion.P.dart';

class ListPromocion extends ConsumerWidget {
  const ListPromocion({required this.deslist, super.key});
  final List<PromocionDTO> deslist;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> eliminarpromocion(String desId) async {
      await deletePromocion(desId);
      ref.refresh(promocionProvider);
    }

    return ListView.builder(
      itemCount: deslist.length,
      itemBuilder: (BuildContext context, int index) {
        final prom = deslist[index];
        return GestureDetector(
          onTap: () {
            // Agrega la lógica que desees cuando se toque un elemento de la lista
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPromocion(
                  id: prom.idPromotion,
                  name: prom.namePromotion,
                  name1: prom.startDate,
                  name2: prom.endDate,
                ),
              ),
            );
            ref.refresh(promocionProvider);
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
                          prom.namePromotion,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Fecha de inicio: ${prom.startDate}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Fecha de finalización: ${prom.endDate}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        // Puedes agregar más detalles del tipo aquí si es necesario
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        eliminarpromocion(prom.idPromotion);
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
