import 'package:flutter/material.dart';
import 'package:frontendthelastcastle/Pages/Employee/ejemplo.c.dart';

import 'categoria/Categoria.E.dart';

import 'tipo/Tipo.T.dart';

class EmployyeHome extends StatefulWidget {
  const EmployyeHome({super.key});

  @override
  State<EmployyeHome> createState() => _EmployyeHomeState();
}

class _EmployyeHomeState extends State<EmployyeHome> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> pages = const [efe(), Tipo(), Categ()];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EMPLEADO"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú Lateral'),
            ),
            _buildDrawerItem(1, 'Datos Empleado'),
            _buildDrawerItem(2, 'Producto'),
            _buildDrawerItem(3, 'Tipo de Producto'),
            _buildDrawerItem(4, 'Marca'),
            _buildDrawerItem(5, 'Categoria'),
            _buildDrawerItem(6, 'Promcion'),
            _buildDrawerItem(7, 'Descuento'),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildDrawerItem(int index, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _onItemTapped(index - 1); // Index - 1 porque las páginas comienzan en 0
        Navigator.pop(context); // Cerrar el menú lateral
      },
    );
  }
}
