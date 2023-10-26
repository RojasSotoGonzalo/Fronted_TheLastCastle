import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../Widget/BasicText.W.dart';
import '../../Widget/BasicPaswword.W.dart';
import '../../Widget/CustomSignInButton.W.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Login({super.key});
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
                'Login\nDesea Iniciar Sesión',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Form(
              key: formKey, // Asigna la clave al formulario
              child: Container(
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
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: '¿Olvidaste tu Contraseña?',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color.fromARGB(255, 127, 36, 196),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Manejar la acción del enlace aquí
                              },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomSignInButton(
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                // Lógica para manejar el inicio de sesión aquí
                              }
                            },
                            text: 'Iniciar Sesión',
                          ),
                          CustomSignInButton(
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                // Lógica para manejar la creación de usuario aquí
                              }
                            },
                            text: 'Crear Usuario',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
