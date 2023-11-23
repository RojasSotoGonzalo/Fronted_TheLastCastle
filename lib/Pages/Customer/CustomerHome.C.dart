import 'package:flutter/material.dart';
import 'package:frontendthelastcastle/Pages/Customer/UserC.C.dart';

import 'Search.C.dart';
import 'Start.C.dart';
import 'Trolley.C.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int index = 0;
  List pages = const [
    Start(),
    SerachI(),
    Trolley(),
    UserCustomer(
      nombre: 'Gonzalo',
      apellido: 'Rojas',
      email: 'adrew@gmail.com',
      direccion: 'calle 2 valtarosa',
      telefono: '74745257',
      carnet: '5768834',
      user: 'alis',
      password: '123455',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: pages[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 25,
                  offset: const Offset(8, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                selectedItemColor: const Color.fromARGB(255, 190, 11, 206),
                unselectedItemColor: Colors.black,
                currentIndex: index,
                onTap: (i) {
                  setState(() {
                    index = i;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Inicio"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Busqueda"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: "Carrito"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Usuario"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
