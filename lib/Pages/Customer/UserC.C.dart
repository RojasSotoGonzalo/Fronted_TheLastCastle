import 'package:flutter/material.dart';

import '../../Widget/CustomSignInButton.W.dart';

class UserCustomer extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String email;
  final String direccion;
  final String telefono;
  final String carnet;
  final String user;
  final String password;

  const UserCustomer(
      {super.key,
      required this.nombre,
      required this.apellido,
      required this.email,
      required this.direccion,
      required this.telefono,
      required this.carnet,
      required this.user,
      required this.password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        backgroundColor: const Color.fromARGB(255, 144, 23, 192),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(text: 'Información Personal'),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 141, 23, 23)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10.0),
                child: InfoColumn(
                  items: [
                    InfoItem(label: 'Nombre:', value: nombre),
                    InfoItem(label: 'Apellido:', value: apellido),
                    InfoItem(label: 'Email:', value: email),
                    InfoItem(label: 'Dirección:', value: direccion),
                    InfoItem(label: 'Carnet:', value: carnet),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SectionTitle(text: 'Información de Usuario'),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 104, 13, 13)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10.0),
                child: InfoColumn(
                  items: [
                    InfoItem(label: 'Usuario:', value: user),
                    InfoItem(label: 'Contraseña:', value: password),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? Column(
                        children: [
                          CustomSignInButton(
                            onPress: () {},
                            text: 'Continuar',
                          ),
                          const SizedBox(height: 8),
                          CustomSignInButton(
                            onPress: () {
                              Navigator.pushNamed(context, 'Home');
                            },
                            text: 'Cancelar',
                          ),
                          const SizedBox(height: 8),
                          CustomSignInButton(
                            onPress: () {
                              // Lógica para el tercer botón aquí
                            },
                            text: 'Botón Adicional',
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomSignInButton(
                            onPress: () {},
                            text: 'Continuar',
                          ),
                          CustomSignInButton(
                            onPress: () {
                              Navigator.pushNamed(context, 'Home');
                            },
                            text: 'Cancelar',
                          ),
                          CustomSignInButton(
                            onPress: () {
                              // Lógica para el tercer botón aquí
                            },
                            text: 'Botón Adicional',
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 144, 23, 192),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 144, 23, 192),
          ),
        ),
        const SizedBox(height: 4), // Ajusta según sea necesario
        Text(value),
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  final List<InfoItem> items;

  const InfoColumn({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}
