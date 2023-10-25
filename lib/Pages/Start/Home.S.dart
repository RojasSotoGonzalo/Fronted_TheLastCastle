import 'package:flutter/material.dart';

import '../Login/Login.L.dart';
import 'Search.S.dart';
import 'Start.S.dart';
import 'Trolley.S.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int index = 0;
  List pages = const [Start(), SerachI(), Trolley(), Login()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8, 20)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.redAccent,
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
                    icon: Icon(Icons.trolley), label: "Carrito"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.login), label: "Login"),
              ]),
        ),
      ),
      body: pages[index],
    );
  }
}
