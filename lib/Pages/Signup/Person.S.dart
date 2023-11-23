import 'package:flutter/material.dart';

import '../../Widget/BasicText.W.dart';
import '../../Widget/CustomSignInButton.W.dart';

class Person extends StatelessWidget {
  final String user;
  final String email;
  final String password;
  Person(
      {super.key,
      required this.user,
      required this.email,
      required this.password});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 178, 50, 218),
                  Color(0xff281537),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Signup\nDesea Crear un Nuevo Usuario',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Form(
              key: formKey,
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          BasicText(
                            labelText: 'Nombre',
                            icon: const Icon(Icons.person),
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BasicText(
                            labelText: 'Apellido',
                            icon: const Icon(Icons.person),
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su apellido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BasicText(
                            labelText: 'Teléfono',
                            icon: const Icon(Icons.phone),
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su teléfono';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BasicText(
                            labelText: 'Dirección',
                            icon: const Icon(Icons.home),
                            controller: addressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su dirección';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          orientation == Orientation.portrait
                              ? Column(
                                  // Vertical
                                  children: [
                                    CustomSignInButton(
                                      onPress: () {
                                        if (formKey.currentState!.validate()) {
                                          // Lógica para manejar la creación de usuario aquí
                                        }
                                      },
                                      text: 'Continuar',
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomSignInButton(
                                      onPress: () {
                                        Navigator.pushNamed(context, 'Home');
                                      },
                                      text: 'Cancelar',
                                    ),
                                  ],
                                )
                              : Row(
                                  // Horizontal
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomSignInButton(
                                      onPress: () {
                                        Navigator.pushNamed(context, 'Home');
                                      },
                                      text: 'Cancelar',
                                    ),
                                    CustomSignInButton(
                                      onPress: () {
                                        if (formKey.currentState!.validate()) {
                                          // Lógica para manejar la creación de usuario aquí
                                        }
                                      },
                                      text: 'Continuar',
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
