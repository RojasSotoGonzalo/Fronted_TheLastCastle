import 'package:flutter/material.dart';

class BasicText extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const BasicText(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color.fromARGB(255, 144, 23, 192),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 144, 23, 192)),
          ),
          labelText: labelText, // Usar labelText pasado como argumento
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 3,
                color: Color.fromARGB(255, 144, 23, 192) // Color del borde
                ),
          ),
          prefixIcon: Icon(icon.icon,
              color: const Color.fromARGB(
                  255, 144, 23, 192)), // Usar icon pasado como argumento
          hoverColor: Colors.black,
        ),
        validator: validator);
  }
}
