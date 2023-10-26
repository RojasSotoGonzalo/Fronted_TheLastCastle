import 'package:flutter/material.dart';

class BasicPassword extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const BasicPassword(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.controller,
      this.validator});

  @override
  State<BasicPassword> createState() => _BasicPasswordState();
}

class _BasicPasswordState extends State<BasicPassword> {
  bool vista = false;
  @override
  void initState() {
    super.initState();
    vista = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      cursorColor: const Color.fromARGB(255, 144, 23, 192),
      validator: widget.validator,
      obscureText: vista,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 144, 23, 192)),
        ),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(widget.icon.icon, // Convierte Icon en IconData
            color: const Color.fromARGB(255, 144, 23, 192)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              vista = !vista;
            });
          },
          icon: Icon(
            vista ? Icons.visibility : Icons.visibility_off,
            color: vista
                ? const Color.fromARGB(255, 144, 23, 192)
                : const Color.fromARGB(255, 144, 23, 192),
          ),
        ),
      ),
    );
  }
}
