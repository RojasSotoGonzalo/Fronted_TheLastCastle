import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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
      body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return SingleChildScrollView(
          child: Stack(
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
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: 18.0,
                  right: 18,
                ),
                child: Form(
                  key: formKey,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                          const SizedBox(height: 15),
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
                          const SizedBox(height: 25),
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
                          const SizedBox(height: 30),
                          OrientationBuilder(
                            builder: (context, orientation) {
                              return orientation == Orientation.portrait
                                  ? Column(
                                      children: [
                                        CustomSignInButton(
                                          onPress: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // Lógica para manejar el inicio de sesión aquí
                                            }
                                          },
                                          text: 'Iniciar Sesión',
                                        ),
                                        const SizedBox(height: 15),
                                        CustomSignInButton(
                                          onPress: () {
                                            Navigator.pushNamed(
                                                context, 'signup');
                                          },
                                          text: 'Crear Usuario',
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomSignInButton(
                                          onPress: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // Lógica para manejar el inicio de sesión aquí
                                            }
                                          },
                                          text: 'Iniciar Sesión',
                                        ),
                                        CustomSignInButton(
                                          onPress: () {
                                            Navigator.pushNamed(
                                                context, 'signup');
                                          },
                                          text: 'Crear Usuario',
                                        ),
                                      ],
                                    );
                            },
                          ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
