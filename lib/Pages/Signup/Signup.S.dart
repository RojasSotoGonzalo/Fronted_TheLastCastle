import 'package:flutter/material.dart';

import '../../Widget/BasicPaswword.W.dart';
import '../../Widget/BasicText.W.dart';
import '../../Widget/CustomSignInButton.W.dart';
import 'Person.S.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
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
                          BasicText(
                            labelText: 'Correo Electrónico',
                            icon: const Icon(Icons.email),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su correo electrónico';
                              }
                              // Expresión regular para validar el formato de correo electrónico
                              String emailRegex =
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

                              if (!RegExp(emailRegex).hasMatch(value)) {
                                return 'Por favor, ingrese una dirección de correo electrónico válida';
                              }
                              return null;
                            },
                          ), // ... (tu código existente)
                          const SizedBox(
                            height: 15,
                          ),
                          BasicText(
                            labelText: 'Alias',
                            icon: const Icon(Icons.email),
                            controller: userController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su Alias';
                              }
                              return null;
                            },
                          ), // ... (tu código existente)
                          const SizedBox(
                            height: 15,
                          ),
                          BasicPassword(
                            labelText: 'Contraseña',
                            icon: const Icon(Icons.lock),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su contraseña';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          BasicPassword(
                            labelText: 'Repita la contraseña Contraseña',
                            icon: const Icon(Icons.lock),
                            controller: passwordController1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingrese su contraseña';
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
                                          String a = passwordController.text;
                                          String b = passwordController1.text;
                                          String c = userController.text;
                                          String d = emailController.text;

                                          if (a.compareTo(b) == 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Person(
                                                  user: c,
                                                  email: d,
                                                  password: a,
                                                ),
                                              ),
                                            );
                                          } else {
                                            userController.clear();
                                            emailController.clear();
                                            passwordController.clear();
                                            passwordController1.clear();
                                          }
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
                                          String a = passwordController.text;
                                          String b = passwordController1.text;
                                          String c = userController.text;
                                          String d = emailController.text;

                                          if (a.compareTo(b) == 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Person(
                                                  user: c,
                                                  email: d,
                                                  password: a,
                                                ),
                                              ),
                                            );
                                          } else {
                                            userController.clear();
                                            emailController.clear();
                                            passwordController.clear();
                                            passwordController1.clear();
                                          }
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
