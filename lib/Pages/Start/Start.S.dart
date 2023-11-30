// ignore_for_file: camel_case_types, avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Controller/ControllerCategoria.Con.dart';
import '../../Models/Categoria.M.dart';

class Start extends ConsumerWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriaList = ref.watch(categoriaProvider);

    return DefaultTabController(
      length: categoriaList.maybeWhen(
        data: (categorias) => categorias.length,
        orElse: () => 0,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Inicio',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 17,
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/Image/login.jpeg',
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              categoriaList.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
                data: (categorias) {
                  if (categorias.isEmpty) {
                    return const Text('No hay categorías disponibles.');
                  }

                  return SizedBox(
                    height: 60,
                    child: TabBar(
                      isScrollable: true,
                      indicatorWeight: 0.1,
                      tabs: categorias
                          .map(
                              (categoria) => tapRap(rapptabCat(cat: categoria)))
                          .toList(),
                    ),
                  );
                },
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class tapRap extends StatelessWidget {
  final rapptabCat categori;

  const tapRap(this.categori, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final select = categori.selected;
    return Opacity(
      opacity: select ? 1 : 0.5,
      child: Card(
        elevation: select ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categori.cat.category,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class rapptabCat {
  final Categoria cat;
  final bool selected;

  rapptabCat({required this.cat, this.selected = false});
}
