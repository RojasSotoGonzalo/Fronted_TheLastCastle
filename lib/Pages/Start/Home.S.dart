import 'package:flutter/material.dart';
import 'package:frontendthelastcastle/Pages/Start/Start.S.dart';

import '../Login/Login.L.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int index = 0;
  List pages = [const Start(), Login()];
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
                      icon: Icon(Icons.logout_outlined), label: "Login"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
